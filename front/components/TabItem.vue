<template>
    <button @click="$emit('input', id)" :class="['tab', active]">
        {{ label }}
    </button>
</template>

<script>
export default {
    props: {
        id: Number,
        label: String,
        value: Number
    },
    computed: {
        active(){
            return this.value === this.id ? 'active' : false
        }
    }
}
</script>

<style lang="css">
    .tab {
        border-radius: 2px 2px 0 0;
        background: #112f4d;
        color:chocolate;
        line-height: 24px;
    }
</style>