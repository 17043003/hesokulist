<template>
    <div>
        {{ $route.params.id }}
        {{ data.amount }}
        {{ data.memo }}
    </div>
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
    async asyncData({ app, params }) {
        let res = await app.$axios.$get(`http://localhost:4444/api/v1/households/${params.id}`)
        return { data: res.data }
    },
    methods: {
    }
}
</script>