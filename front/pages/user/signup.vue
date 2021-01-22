<template>
  <div class="form-wrapper">
    <label class="form-group">
      <input
        v-model="name"
        type="text"
        placeholder="Your name"
        class="form name-form"
      />
    </label>
    <label class="form-group">
      <input
        v-model="email"
        type="email"
        placeholder="Email address"
        class="form email-form"
      />
    </label>
    <button class="signup-button" @click="register_user">新規登録</button>
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
  background-color: rgb(91, 114, 101);
  width: 80%;
  margin-left: auto;
  margin-right: auto;
  padding: 20px 0;
  border-radius: 30px;
}
.form {
  width: 50%;
  height: 40px;
  margin-bottom: 3%;
  color: white;
  border: 3px solid rgb(89, 141, 209);
}
label.form-group {
  width: 90%;
  text-align: center;
}

button.signup-button {
  background-color: rgb(47, 150, 209);
  padding: 10px;
  border-radius: 30px;
  box-shadow: 4px 4px 2px rgb(20, 91, 150);
}

@mixin placeholder($color) {
  &::placeholder {
    color: $color;
  }

  // IE
  &:-ms-input-placeholder {
    color: $color;
  }

  // Edge
  &::-ms-input-placeholder {
    color: $color;
  }
}

input {
  @include placeholder(rgb(131, 125, 125));
}
</style>
