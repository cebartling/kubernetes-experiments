import { createRequestHandler } from '@remix-run/express';
import compression from 'compression';
import express from 'express';
import morgan from 'morgan';
import { createTerminus } from '@godaddy/terminus';

const viteDevServer =
  process.env.NODE_ENV === 'production'
    ? undefined
    : await import('vite').then((vite) =>
      vite.createServer({
        server: { middlewareMode: true },
      }),
    );

const remixHandler = createRequestHandler({
  build: viteDevServer
    ? () => viteDevServer.ssrLoadModule('virtual:remix/server-build')
    : await import('./build/server/index.js'),
});

const app = express();

app.use(compression());

// http://expressjs.com/en/advanced/best-practice-security.html#at-a-minimum-disable-x-powered-by-header
app.disable('x-powered-by');

// handle asset requests
if (viteDevServer) {
  app.use(viteDevServer.middlewares);
} else {
  // Vite fingerprints its assets so we can cache forever.
  app.use(
    '/assets',
    express.static('build/client/assets', { immutable: true, maxAge: '1y' }),
  );
}

// Everything else (like favicon.ico) is cached for an hour. You may want to be
// more aggressive with this caching.
app.use(express.static('build/client', { maxAge: '1h' }));

app.use(morgan('tiny'));

// handle SSR requests
app.all('*', remixHandler);

const port = process.env.PORT || 3000;
const server = app.listen(port, () =>
  console.log(`Express server listening at http://localhost:${port}`),
);

console.log('Configuring terminus');

function onSignal() {
  console.log('server is starting cleanup');
  return Promise.resolve();
}

function onHealthCheck() {
  return Promise.resolve(); // optionally include checks (e.g., DB, cache)
}

createTerminus(server, {
  signal: 'SIGINT',
  healthChecks: {
    '/health/livenessCheck': onHealthCheck,
    '/health/readinessCheck': onHealthCheck,
  },
  onSignal,
});
