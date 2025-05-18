import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig(() => {
  return {
    plugins: [react()],
    define: {
      __BACKEND_URL__: JSON.stringify('webapijrdemo-ded6g0gmc9aqh0h6.australiasoutheast-01.azurewebsites.net'),
    },
  };
});
