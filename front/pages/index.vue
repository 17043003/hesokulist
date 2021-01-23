<template>
  <div id="app">
    <h1 class="title">へそくりすと</h1>
    <Calendar @selected-day="setCurrentDate"></Calendar>

    <!-- 詳細やグラフの表示を追加 -->
    <TabItem
      v-for="item in list"
      :key="item.id"
      v-model="currentId"
      v-bind="item"
    />

    <div class="content">
      <h1>{{ current.content }}</h1>
      <div v-if="current.id == 1" class="detail">
        <Detail :current-date="currentDate" />
      </div>
    </div>
  </div>
</template>

<script>
import Calendar from "~/components/Calendar.vue"
import Detail from "~/components/Detail.vue"

export default {
  components: {
    Calendar,
    Detail,
  },
  async asyncData({ app }) {
    const res = await app.$axios.$get("households")
    return { datas: res.datas }
  },
  data() {
    return {
      datas: [],
      detailData: null,

      currentId: 1,
      list: [
        { id: 1, label: "詳細", content: "detail" },
        { id: 2, label: "グラフ", content: "graph" },
      ],
      currentDate: null,
    }
  },

  computed: {
    current() {
      return this.list.find((el) => el.id === this.currentId) || {}
    },
  },
  mounted: function () {
    const date = new Date()
    this.currentDate =
      ("0000" + date.getFullYear()).slice(-4) +
      "-" +
      ("00" + (date.getMonth() + 1)).slice(-2) +
      "-" +
      ("00" + date.getDate()).slice(-2)
  },
  methods: {
    setCurrentDate(date) {
      this.currentDate = date
    },
  },
}
</script>

<style lang="scss">
$table-border-color: lightyellow;

.household-list {
  border-collapse: collapse;
  border: solid 1px $table-border-color;
}
th,
td {
  padding: 4px;
  width: 200px;
  border: solid 1px $table-border-color;
}
th {
  color: #226600;
  background-color: lightgray;
  text-align: center;
}
td {
  color: black;
  background-color: lightsteelblue;
  text-align: right;
}
</style>
