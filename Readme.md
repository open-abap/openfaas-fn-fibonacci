# ABAP implementation of Fibonacci via OpenFaas

This repo contains an [OpenFaaS](https://openfaas.com) function to calculate Fibonacci numbers - in ABAP.

## How to deploy it

This repo contains the template definition of the [open-abap template](https://github.com/open-abap/openfaas-abap-template).
Therefore, the only thing you need to do in order to deploy it locally:

```bash
faas-cli up --image <docker-username/abap-fibonacci>
```

## Updating the template

ABAP as OpenFaaS function is still in early alpha - to say the least.
Thus, the template is also in constant change.
In order to update the template, execute the following command from the project directory:

```bash
faas-cli template pull https://github.com/open-abap/openfaas-abap-template --overwrite
```

## Building for PI

With Docker-for-Mac, you can [set up a builder](https://docs.docker.com/buildx/working-with-buildx/) in order to create images for the ARM platform:

```bash
docker buildx build -t <docker-username>/abap-fibonacci:latest --platform linux/amd64,linux/armhf --push .
```
