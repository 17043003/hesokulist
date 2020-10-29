<template>
    <div id="app">
        <h1 class="title">へそくりすと</h1>
        <input type="text" v-model="newItem">
        <form v-on:submit.prevent>
            <button @click="addItem">add</button>
        </form>

        <li v-for="(item, index) in items" :key="index">
            {{ index +1 }}:{{ item.item }}
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
            items: [],
            newItem: ''
        }
    },
    methods: {
        addItem: function(event) {
            let todo = {
                item: this.newItem
            };
            this.items.push(todo)
        }
    }
}
</script>