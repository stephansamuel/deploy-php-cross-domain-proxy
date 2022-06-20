# Deployment Wrapper for PHP Cross-Domain Proxy

This project provides a Docker-ized staging environment to deploy [PHP CORS Proxy](https://github.com/softius/php-cross-domain-proxy) onto a bare PHP server. It aims to provide the following benefits:

 - Full use of the target Git project from the VCS source (in progress)
 - A targeted deploy via any standard filesystem mount
 - No need to install or maintain PHP or Composer natively on the runtime machine
 - Safe, optimized deployment (to the limits of Composer)

Docker and `docker-compose` must be installed and runnable.

## Setup

The primary configuration step is to create a configuration file and edit its contents.

A sample configuration file can be found in `config.json.sample`. Copy this file to `config.json` and edit it.

**Deployment target path**

Set the value of `deployTarget` to the deploy-to directory where the production files should be copied.

**URL list**

Add to `validUrls`. Only the domain is required, the remainder of any entered URLs will be discarded. Duplicates are fine, they will be treated as a single entry for that domain.

## Maintenance, utilities

To run Composer or perform other maintenance tasks:

```
docker-compose run util
```

For normal use, i.e., just deploying the proxy, there shouldn't be any need for this.

## Outline of function

The following steps occur when the deploy process is kicked off:

1. Read the `deployTarget` variable and create a link in the current directory to the target.
1. Update the source project from GitHub using Composer.
1. Read the configuration JSON file and modify the correct variable in `proxy.php` file to contain the necessary information. 
1. Run `composer install` to generate the [optimized](https://getcomposer.org/doc/articles/autoloader-optimization.md) autoloader. More [here](https://stackoverflow.com/questions/21721495/how-to-deploy-correctly-when-using-composers-develop-production-switch).
1. Copy the necessary output files to the target.

## Credits

Most obviously, this project is simply a deploy wrapper for the project created by [Iacovos Constantinou](https://github.com/softius). There are [additional contributors](https://github.com/softius/php-cross-domain-proxy/contributors) to that project.

Code for reading the configuration JSON file in `bash` came from [here](http://dailyraisin.com/read-json-value-in-bash/#:~:text=Read%20a%20JSON%20Value%20in%20Bash%201%20Function,and%20report%20to%20stderr.%20...%205%20Caveats.%20). This has been deprecated based on information from [this article](https://www.delftstack.com/howto/linux/parse-json-in-bash/) about using `jq`, which is available for the Alpine base (used for containers) via `apk`.

