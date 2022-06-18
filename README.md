# Deployment Wrapper for PHP Cross-Domain Proxy

This project provides a Docker-ized staging environment to deploy [PHP CORS Proxy](https://github.com/softius/php-cross-domain-proxy) onto a bare PHP server. It aims to provide the following benefits:

 - Full use of the target Git project from the VCS source (in progress)
 - A targeted deploy via any standard filesystem mount
 - No need to install or maintain PHP or Composer natively on the runtime machine
 - Safe, optimized deployment (to the limits of Composer)

Docker and `docker-compose` must be installed and runnable.
