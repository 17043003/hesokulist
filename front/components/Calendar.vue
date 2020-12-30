<template>
    <div>
        <client-only>
            <v-calendar is-expanded :attributes='attrs'>
                <!-- ページごとのヘッダータイトルを設定 -->
                <template slot='header-title' slot-scope='page'>
                    {{page.yearLabel}}年 {{page.month}}月
                </template>
                <!-- 日毎の内容を設定 -->
                <!-- <template slot='day-content' slot-scope='props'>
                    {{props.day.day}}
                </template> -->
            </v-calendar>
        </client-only>
    </div>
</template>

<script>
export default {
    methods: {},
    data() {
        return {
            attrs: [
                {
                    key: 'today',
                    dot: true,
                    dates: new Date(),
                }
            ]
        }
    }
}
</script>

<style lang="sass">

</style>