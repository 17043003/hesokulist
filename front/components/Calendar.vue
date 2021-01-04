<template>
    <div>
        <client-only>
            <v-date-picker is-expanded
            :attributes='attrs'
            v-model='selectedDay'
            @dayclick='dayClicked'>
                <template slot='header-title' slot-scope='page'>
                    {{page.yearLabel}}年 {{page.month}}月
                </template>
            </v-date-picker>
        </client-only>
    </div>
</template>

<script>
export default {
    methods: {
        dayClicked(day){
            this.selectedDay = day;
            this.$emit('selectedDay', this.selectedDay.id); // 選択された日付を渡す
        }
    },
    data() {
        return {
            attrs: [
                {
                    key: 'today',
                    dot: true,
                    dates: new Date(),
                }
            ],
            selectedDay: null,
        }
    }
}
</script>

<style lang="sass">

</style>