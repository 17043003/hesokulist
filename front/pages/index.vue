<template>
  <div id="app">
    <h1 class="title">へそくりすと</h1>
    <Calendar @selectedDay="getDetail"></Calendar>

    <!-- 詳細やグラフの表示を追加 -->
    <TabItem
    v-for="item in list"
    v-bind="item" :key="item.id"
    v-model="currentId" />

    <div class="content">
      <h1>{{ current.content }}</h1>
      <div class="detail" v-if="current.id == 1">
        <table class="household-list">
          <tbody>
            <tr>
              <th>日付</th>
              <th>金額</th>
              <th>メモ</th>
            </tr>
            <tr v-if="detailData">
              <td>{{ detailData.spent_date }}</td>
              <td>{{ detailData.amount }}</td>
              <td>{{ detailData.memo }}</td>
            </tr>
            <tr v-else>
              <td>{{ currentDate }}</td>
              <td>0</td>
              <td></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <h2 class="subtitle">hesokulist</h2>
  </div>
</template>

<script>
import Calendar from '~/components/Calendar.vue'
export default {
  components: {
    Calendar
  },
  async asyncData({ app }) {
    const res = await app.$axios.$get("http://localhost:4444/api/v1/households")
    return { datas: res.datas }
  },
  data() {
    return {
      datas: [],
      detailData: null,

      currentId: 1,
      list: [
        { id: 1, label: '詳細', content: 'detail' },
        { id: 2, label: 'グラフ', content: 'graph' }
      ],
      currentDate: null
    }
  },
  mounted: function(){
    const date = new Date();
    this.currentDate = date.getFullYear() + '-'
    + (date.getMonth() + 1) + '-'
    + date.getDate()
  },
  methods: {
    getDetail(day) {
      this.currentDate = day;

      const res = this.$axios.$get(
        `http://localhost:4444/api/v1/household`, {
          params: {
            date: this.currentDate
          }
        }
      ).then(responseData => {
        this.detailData = responseData.data;
      });
    }
  },

  computed: {
    current() {
      return this.list.find(el => el.id === this.currentId) || {}
    }
  }
}
</script>

<style lang="scss">
$table-border-color: lightyellow;

.household-list{
  border-collapse: collapse;
  border: solid 1px $table-border-color;
}
th, td{
  padding: 4px;
  width: 200px;
  border: solid 1px $table-border-color;
}
th{
  color: #226600;
  background-color: lightgray;
  text-align: center;
}
td{
  color: black;
  background-color: lightsteelblue;
  text-align: right;
}
</style>
