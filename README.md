# fable-docker

F# Fable container with 
- .net SDK 5
- Node.js 16
- npm 8

## Getting started with Fable

https://fable.io/docs/2-steps/your-first-fable-project.html

## Run the container

Run the container with a volume mount to your application in the current directory:

```
docker run --rm -it -v $(pwd):/app -p 81:8080 wazum/fable-docker
```

## Development server

Start the npm development server with `npm start`, the container exposes port `8080` for the outside world
(we map that to port `81` on our local machine in the example above).

You'll want to add a host value `0.0.0.0` and allow all hosts access for development in your webpack configuration (`webpack.config.js`):

```
    devServer: {
        publicPath: "/",
        contentBase: "./public",
        port: 8080,
        host: "0.0.0.0",
        disableHostCheck: true
    },
```

## Build

```
docker build -f Dockerfile -t wazum/fable-docker:latest ./
```
