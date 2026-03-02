import { defineConfig } from "eslint/config";

export default defineConfig([
  {
    files: ["**/*.js"],   
    languageOptions: {
      ecmaVersion: "latest",
      sourceType: "module",
    },
    rules: {
      "no-console": "warn",
      "no-var": "error",
      "max-len": ["error", { code: 80 }],
     "no-eval": "error",
    },
  },
]);