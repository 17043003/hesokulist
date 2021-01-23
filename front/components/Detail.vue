<template>
  <div>
    <li v-for="message in messages" :key="message.key">
      {{ message }}
    </li>
    <table class="household-list">
      <tbody>
        <tr>
          <th>日付</th>
          <th>金額</th>
          <th>メモ</th>
        </tr>
        <tr>
          <td>{{ currentDate }}</td>
          <td>
            <input v-model="amount" type="number" name="amount" />
          </td>
          <td>
            <input v-model="memo" type="text" name="memo" />
          </td>
          <td>
            <input
              type="button"
              value="更新"
              class="update-button"
              @click="updateData"
            />
          </td>
          <td>
            <input
              type="button"
              value="削除"
              class="delete-button"
              @click="deleteData"
            />
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  props: {
    currentDate: null,
  },
  data: function () {
    return {
      messages: [],
      amount: 0,
      memo: "",
      detailData: {},
    }
  },
  computed: {},
  watch: {
    currentDate: function (val) {
      this.getDetailDatas(val)

      // 日付選択時に変数を初期化
      this.amount = 0
      this.memo = ""
      this.messages = []
    },
    detailData: function (val) {
      if (val !== null) {
        this.amount = val.amount
        this.memo = val.memo
      } else {
        this.amount = 0
        this.memo = ""
      }
    },
  },

  mounted: function () {
    this.getDetailDatas(this.currentDate)
  },

  methods: {
    getDetailDatas(date) {
      this.$axios
        .$get(`household`, {
          params: {
            date: date,
          },
        })
        .then((responseData) => {
          this.detailData = responseData.data
        })
    },
    updateData() {
      this.$axios
        .post("household", {
          spent_date: this.currentDate,
          amount: this.amount,
          memo: this.memo,
        })
        .then((res) => {
          this.messages.length = 0 // 配列内要素を全て削除
          res.data.messages.forEach((message) => {
            this.messages.push(message)
          })
        })
    },
    deleteData() {
      this.$axios
        .request({
          method: "delete",
          url: "household",
          data: { spent_date: this.currentDate },
        })
        .then((res) => {
          if (res.data.status === "ok") {
            // 削除に成功した場合のみ、フォームをクリア
            this.amount = 0
            this.memo = ""

            this.messages.length = 0 // 配列内要素を全て削除
            res.data.messages.forEach((message) => {
              this.messages.push(message)
            })
          }
        })
    },
  },
}
</script>

<style lang="scss">
.update-button {
  background-color: midnightblue;
  width: 100%;
  height: 100%;
}

.delete-button {
  background-color: rgb(25, 112, 51);
  width: 100%;
  height: 100%;
}
</style>
