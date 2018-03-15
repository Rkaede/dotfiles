module.exports = {
  env: {
    browser: true,
    es6: true,
  },
  extends: 'eslint:recommended',
  parserOptions: {
    sourceType: 'module',
    ecmaVersion: 2017,
  },
  rules: {
    // 'indent': ['error', 4],
    'linebreak-style': ['error', 'unix'],
    quotes: ['error', 'single'],
    semi: ['error', 'always'],
    radix: ['error', 'always'],
    'no-undef': 'off',
    'no-console': 'off',
    'no-debugger': 'off',
    'object-curly-spacing': ['error', 'always'],
  },
};
