<template>
  <div id="app">
    <h1 class="title">へそくりすと</h1>
    <Calendar></Calendar>

    <!-- 詳細やグラフの表示を追加 -->
    <TabItem
    v-for="item in list"
    v-bind="item" :key="item.id"
    v-model="currentId" />

    <div class="content">
      {{ current.content }}
    </div>

    <table>
      <tbody class="list-data">
        <tr>
          <th>日付</th>
          <th>金額</th>
        </tr>
        <tr v-for="(data, index) in datas" :key="index">
          <td>{{ data.spent_date }}</td>
          <td>{{ data.amount }}</td>
          <td>
            <nuxt-link :to="`/household/${data.id}`"> 詳細 </nuxt-link>
          </td>
        </tr>
      </tbody>
    </table>

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

      currentId: 1,
      list: [
        { id: 1, label: '詳細', content: 'detail' },
        { id: 2, label: 'グラフ', content: 'graph' }
      ]
    }
  },
  methods: {},

  computed: {
    current() {
      return this.list.find(el => el.id === this.currentId) || {}
    }
  }
}
</script>

<style lang="scss">
.list-data {
  background-color: rgb(18, 36, 30);
  border: solid 1px;
}
</style>
