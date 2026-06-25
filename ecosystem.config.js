module.exports = {
  apps: [
    {
      name: 'dom-patrimonio-frontend',
      script: 'serve',
      env: {
        PM2_SERVE_PATH: '.',
        PM2_SERVE_PORT: 3030,
        PM2_SERVE_SPA: 'true',
        PM2_SERVE_HOMEPAGE: './index.html'
      }
    }
  ]
};
