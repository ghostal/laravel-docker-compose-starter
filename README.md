# Laravel Docker Composer Starter

A project starter kit and CLI shortcut tool for developing Laravel
projects locally with `docker-compose`.

## Features

- Sets up new Laravel projects fast
- Includes containers for:
  - Laravel itself (using `php-apache`)
  - An SSL proxy container
  - Redis
  - MariaDB
  - [Laravel Echo Server][1]

## Usage

This repo is designed to be export, **not** cloned!

    $ wget https://github.com/ghostal/laravel-docker-compose-starter/archive/main.zip
    $ unzip main.zip
    $ rm main.zip 
    
Then you probably want to rename the directory:
    
    $ mv laravel-docker-compose-starter <your-project-name>

And then you can initialise a Laravel install:

    $ cd <your-project-name>
    $ ./dev init

## CLI Shortcut Tool

There is a CLI shortcut tool included, which makes a lot of common
`docker-compose` commands a lot quicker.

Instead of the following to start your project up and drop into a bash
prompt on the PHP container to use `artisan`:

    $ docker-compose up -d
    $ docker-compose exec -u 1000:1000 app bash

You can just do this:

    $ ./dev up
    $ ./dev app

For full usage instructions, just run:

    $ ./dev

### Install the shortcut CLI

You can also install the command line helper (and a bash completion
script) so that it's in your path and you can just use `dev` instead of
`./dev` each time:

    $ install ./dev ~/bin/dev
    $ cp ./dev-completion.bash /etc/bash_completion.d/

### Composer

Drop in to use composer:

    $ dev app   # Start a bash session in the "app" container
    $ composer  # Start using composer

### Node/NPM

The `docker-compose.yml` configuration ensures that `npm run watch` is
always running. All node commands are configured to run as the user
`node` within the container, with is `1000:1000`.

Run one-off commands with node in the `node` container:

    $ dev node npm install

## Credit Where Credit's Due

The SSL proxy container configuration is largely borrowed from
[bombbomb/docker-ssl-proxy][2]. It's a fairly hacked up version of their
altogether more skillful work.

### Main Contributors
- [Alex Miles](https://ghostaldev.com/) ([@ghostal](https://github.com/ghostal))

[1]: https://github.com/tlaverdure/Laravel-Echo-Server
[2]: https://github.com/bombbomb/docker-ssl-proxy