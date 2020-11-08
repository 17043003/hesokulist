<template>
    <div id="app">
        <h1 class="title">へそくりすと</h1>
        
        <li v-for="(data, index) in datas" :key="index">
            日付：{{ data.spent_date }}：{{ data.amount }}
        </li>

        <h2 class="subtitle">hesokulist</h2>
    </div>
</template>

<script>
export default {
    components: {
        
    },
    data() {
        return {
            datas: []
        }
    },
    async asyncData({ app }) {
        let res = await app.$axios.$get('http://localhost:4444/api/v1/households')
        return { datas: res.datas }
    },
    methods: {
    }
}
</script>