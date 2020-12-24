<template>
    <div>
        <client-only>
            <v-calendar is-expanded :attributes='attrs'></v-calendar>
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