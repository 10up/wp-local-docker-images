# WP Local Docker Images

> Images used by [WP Local Docker](https://github.com/10up/wp-local-docker)

[![Support Level](https://img.shields.io/badge/support-active-green.svg)](#support-level) [![MIT License](https://img.shields.io/github/license/10up/wp-local-docker-images.svg)](https://github.com/10up/wp-local-docker-images/blob/master/LICENSE.md)

## Overview

Available on Dockerhub: 
[10up/nginx-proxy](https://hub.docker.com/r/10up/nginx-proxy/)
[10up/wpsnapshots](https://hub.docker.com/r/10up/wpsnapshots)
[10up/phpfpm](https://hub.docker.com/r/10up/phpfpm/) - deprecated, do not use

## Building

In each directory you can issue:

`docker build . -t <your tag>`

If you want to build a multiarch version (currently only nginx-proxy supports this) you might run:

`docker buildx build . -t <your tag> --platform linux/amd64,linux/arm64`

## Support Level

**Active:** 10up is actively working on this, and we expect to continue work for the foreseeable future including keeping tested up to the most recent version of WordPress.  Bug reports, feature requests, questions, and pull requests are welcome.

## Like what you see?

<a href="http://10up.com/contact/"><img src="https://10updotcom-wpengine.s3.amazonaws.com/uploads/2016/10/10up-Github-Banner.png" width="850" alt="Work with us at 10up"></a>
