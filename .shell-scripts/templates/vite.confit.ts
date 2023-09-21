/// <reference types="vitest" />
import { defineConfig } from 'vite';
import { resolve } from 'path';
import vue from '@vitejs/plugin-vue';

export default defineConfig({
  plugins: [vue()],
  test: {
    globals: true,
    environment: 'happy-dom',

    // vitest 启动时, 会执行的文件, 一般是用于设置测试代码环境
    // 比如测试vue组件, 需要 vue-router, 不可能每个测试文件都写一次
    // setupFiles: [
    //    resolve('./src/__tests__/setups/router-mock.ts'),
    // ],
  },

  // 配置路径别名
  resolve: {
    alias: {
      '@': resolve('./src'),
    },
  },
});
