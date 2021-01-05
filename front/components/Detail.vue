<template>
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
</template>

<script>
export default {
  props: {
    detailData: null,
    currentDate: null,
  },
}
</script>
