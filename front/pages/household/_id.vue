<template>
    <div>{{ $route.params.id }}</div>
</template>

<script>
export default {
    components: {
        
    },
    data() {
        return {
            data: []
        }
    },
    async asyncData({ app }) {
        let res = await app.$axios.$get(`http://localhost:4444/api/v1/households`)
        return { data: res.datas }
    },
    methods: {
    }
}
</script>