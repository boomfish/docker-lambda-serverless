# boomfish/lambda-serverless

[![Serverless Application Framework AWS Lambda API Gateway](./assets/serverless-framework.png)](http://serverless.com)

[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)

Docker images for building [AWS Lambda](https://aws.amazon.com/lambda/) functions with native binary dependencies and deploying them using the [Serverless Framework](https://serverless.com/).

This image is very large and overkill for many Lambda applications, but is useful if you wish to write functions that use high-performance native libraries such as [libvis](https://jcupitt.github.io/libvips/) and wrappers for them such as the [Sharp](https://github.com/lovell/sharp) module for NodeJS.

Images are available for the following language runtimes supported in AWS Lambda:

- Node.js
  - v8.10 (`nodejs8.10`)
  - v6.10 (`nodejs6.10`)
- Python
  - Python 3.6 (`python3.6`)
  - Python 2.7 (`python2.7`)
- Java
  - Java 8 (`java8`)
- Go
  - Go 1.x (`go1.x`)


## Usage

### Build Locally

If you want to build and use your own local image

```bash
# build image locally for Node.JS v8.10
$ make build TAG=nodejs8.10
# go inside a container instance for the local Node.JS v8.10 image
$ make shell TAG=nodejs8.10
```

## Example

`example/apigw` is an example on how to use `boomfish/lambda-serverless`.

## Update Docker image

### New version of Serverless Framework

1. Change `SERVERLESS` in the `Dockerfile` for the language runtime you wish to test
2. Build and test locally (test also the apigw example)
3. Make similar changes to the `Dockerfile`s of the other language runtimes (if applicable)
4. Commit and push the changes to master
5. Push the corresponding branch for the runtime with command `$ make tag TAG={lang}`
6. Go to [hub.docker.com](https://hub.docker.com/r/boomfish/lambda-serverless/)
7. In `Build Details` tab, you should now see the build for the runtime tag kicking off
8. Repeat 1-8 for any other language runtimes you wish to test

### Fix for the current version

1. Do the fixes you want to do `$ make tag TAG={lang}`
2. Build and test locally (test also the apigw example)
3. Make similar changes to the `Dockerfile`s of the other language runtimes (if applicable)
4. Commit and push the changes
5. Run `$ make tag TAG={lang}`
6. Go to [hub.docker.com](https://hub.docker.com/r/boomfish/lambda-serverless/)
7. In `Build Details` tab, you should now see the build for the runtime tag kicking off
8. Repeat 1-8 for any other language runtimes you wish to test

## Docker image

The images use build images from [lambci/lambda](https://hub.docker.com/r/lambci/lambda/) for their base so that deployment packages built in it will be highly compatible with the Lambda execution environment. According to the maintainers, the base images include the following packages:

- aws-cli
- zip
- git
- vim
- docker (Docker in Docker!)
- gcc-c++
- clang
- openssl-devel
- cmake
- autoconf
- automake
- libtool
- xz-libs
- libffi-devel
- python27-devel
- libmpc-devel
- mpfr-devel
- gmp-devel

These image also add the following:

- [Serverless Framework](https://serverless.com/framework/)
- [yarn](https://github.com/yarnpkg/yarn) (for Node.js runtimes only)

## Acknowledgements

This is a fork of [amaysim/serverless](https://github.com/amaysim-au/docker-serverless)
and is intended to be a compatible with it for projects that follow their
[3 Musketeers](https://3musketeers.io/) methodology for development environments.

Many thanks to [Frederic Lemay](https://github.com/flemay) for creating and sharing the
3 Musketeers and sharing it at the
[Sydney Docker User Group](https://www.meetup.com/en-AU/Sydney-Docker-User-Group/) meetup,
as well as all those to contributed to the project.
