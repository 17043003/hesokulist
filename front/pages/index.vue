<template>
  <div id="app">
    <h1 class="title">
      へそくりすと
    </h1>

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
            <nuxt-link :to="`/household/${data.id}`">
              詳細
            </nuxt-link>
          </td>
        </tr>
      </tbody>
    </table>

    <h2 class="subtitle">
      hesokulist
    </h2>
  </div>
</template>

<script>
export default {
  components: {

  },
  async asyncData ({ app }) {
    const res = await app.$axios.$get('http://localhost:4444/api/v1/households')
    return { datas: res.datas }
  },
  data () {
    return {
      datas: []
    }
  },
  methods: {
  }
}
</script>

<style lang="scss">
    .list-data{
        background-color: rgb(18, 36, 30);
        border: solid 1px;
    }
</style>
