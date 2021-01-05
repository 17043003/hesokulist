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
        <Detail :detailData="detailData" :currentDate="currentDate"/>
      </div>
    </div>

  </div>
</template>

<script>
import Calendar from '~/components/Calendar.vue'
import Detail   from '~/components/Detail.vue'

export default {
  components: {
    Calendar,
    Detail
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
    this.currentDate = ('0000' + date.getFullYear()).slice(-4) + '-'
    + ('00' + (date.getMonth() + 1)).slice(-2) + '-'
    + ('00' + date.getDate()).slice(-2)
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
