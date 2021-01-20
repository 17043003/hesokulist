<template>
  <div class="form-wrapper">
    <label class="form-group">
      <span class="label">名前：</span>
      <input v-model="name" type="text" class="form name-form" />
    </label>
    <label class="form-group">
      <span class="label">メールアドレス：</span>
      <input v-model="email" type="email" class="form email-form" />
    </label>
    <button @click="register_user">新規登録</button>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      name: "",
      email: "",
    }
  },
  methods: {
    register_user: function () {
      this.$axios.post("http://localhost:4444/api/v1/users/", {
        name: this.name,
        email: this.email,
      })
    },
  },
}
</script>

<style lang="scss">
.form-wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 5%;
}
.form {
  border: 1px solid aquamarine;
  width: 50%;
  margin-bottom: 3%;
}
label.form-group {
  width: 50%;
}
span.label {
  width: 30%;
  display: inline-block;
  text-align: right;
}
</style>
