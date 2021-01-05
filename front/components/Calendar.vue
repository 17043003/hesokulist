<template>
  <div>
    <client-only>
      <v-date-picker
        v-model="selectedDay"
        is-expanded
        :attributes="attrs"
        @dayclick="dayClicked"
      >
        <template slot="header-title" slot-scope="page">
          {{ page.yearLabel }}年 {{ page.month }}月
        </template>
      </v-date-picker>
    </client-only>
  </div>
</template>

<script>
export default {
  data() {
    return {
      attrs: [
        {
          key: "today",
          dot: true,
          dates: new Date(),
        },
      ],
      selectedDay: null,
    }
  },
  methods: {
    dayClicked(day) {
      this.selectedDay = day
      this.$emit("selected-day", this.selectedDay.id) // 選択された日付を渡す
    },
  },
}
</script>

<style lang="sass"></style>
