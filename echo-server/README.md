When deployed, the Laravel Echo Server can use a .env file in the
directory alongside `laravel-echo-server.json`, which changes `authHost`
setting to a production value.

Something like this:

```
LARAVEL_ECHO_SERVER_AUTH_HOST=https://mywebsite.com
```

The `authHost` setting is the host used for the auth back channel the
server uses to authenticate clients for private channels.

Also in the `laravel-echo-server.json` file is a
`databaseConfig.keyPrefix` setting. This must match Laravel's
`database.redis.options.prefix` setting (`REDIS_PREFIX` in the `.env`
file by default). It can be used to allow multiple applications to share
a single Redis instance without key collisions.
