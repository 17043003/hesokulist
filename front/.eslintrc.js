module.exports = {
  root: true,
  env: {
    browser: true,
    node: true
  },
  extends: [
    'plugin:nuxt/recommended',
    "@nuxtjs"
  ],
  plugins: [
  ],
  rules: {
    "no-extra-semi": "warn",
    "semi": [2, "never"],
    "no-console": "off",
    "vue/max-attributes-per-line": "off",
  }
}