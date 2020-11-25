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
  async asyncData ({ app, params }) {
    const res = await app.$axios.$get(`http://localhost:4444/api/v1/households/${params.id}`)
    return { data: res.data }
  },
  data () {
    return {
      data: []
    }
  },
  methods: {
  }
}
</script>
