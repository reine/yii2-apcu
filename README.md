# yii2-apcu
Docker image of Yii2 with APCu extension

## Overview

This is a base image that uses the official Yii Framework's docker image with PHP 7.3 and Apache, and with APCu support added during build time.

## Environment Variables

You can override the default working directory and APC version to suit your project's requirements.

Default values:
- APP_WORKDIR = /app
- APCU_VERSION = 5.1.11

Sample usage:

```
  web:
    image: sreine/yii2-apcu:latest
      environment:
        - APP_WORKDIR="/home/user/app"
        - APCU_VERSION=5.1.12
```