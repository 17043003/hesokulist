module.exports = {
  root: true,
  env: {
    browser: true,
    node: true
  },
  parserOptions: {
    parser: 'babel-eslint'
  },
  extends: [
    'eslint:recommended',
    'plugin:vue/recommended',
    'plugin:prettier/recommended',
  ],
  plugins: [
    'vue'
  ],
  rules: {
    'no-extra-semi': 'warn',
    semi: [2, 'never'],
    'no-console': 'off',
    'vue/max-attributes-per-line': 'off',
    "prettier/prettier": ["error", { semi: false }],
    "vue/html-self-closing": "off", //空タグを許可する
  }
}
