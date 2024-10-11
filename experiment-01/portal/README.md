# Kubernetes Experiments 1: Portal application

## Docker packaging
1. Create a new repository for your images in Docker Hub. In this case, the repository is `k8s-experiments-01-portal`.
2. Build the image: `npm run build-docker` 
3. Tag the local image: `docker tag k8s-experiments-01-portal:latest cebartling/k8s-experiments-01-portal:latest`
4. Push the image to Docker Hub: `docker push cebartling/k8s-experiments-01-portal:latest`



## Remix

- This is a Remix application using Express.
- 📖 [Remix docs](https://remix.run/docs)

## Development

Run the dev server:

```shellscript
npm run dev
```

## Deployment

First, build your app for production:

```sh
npm run build
```

Then run the app in production mode:

```sh
npm start
```

Now you'll need to pick a host to deploy it to.

### DIY

If you're familiar with deploying Node applications, the built-in Remix app server is production-ready.

Make sure to deploy the output of `npm run build`

- `build/server`
- `build/client`

## Styling

This template comes with [Tailwind CSS](https://tailwindcss.com/) already configured for a simple default starting
experience. You can use whatever css framework you prefer. See
the [Vite docs on css](https://vitejs.dev/guide/features.html#css) for more information.
