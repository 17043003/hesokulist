<template>
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
        <input type="button" value="更新" @click="updateData" />
      </tr>
    </tbody>
  </table>
</template>

<script>
export default {
  props: {
    currentDate: null,
  },
  data: function () {
    return {
      message: "",
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
        .$get(`http://localhost:4444/api/v1/household`, {
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
        .post("http://localhost:4444/api/v1/household", {
          spent_date: this.currentDate,
          amount: this.amount,
          memo: this.memo,
        })
        .then((res) => {
          alert(res.data.message)
        })
    },
  },
}
</script>
