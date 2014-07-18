docker-gemserver
================

Private gem server as docker image.

It uses [geminabox](https://github.com/geminabox/geminabox) and love.

Usage:

```
  docker pull tscolari/gemserver
  docker run -e USERNAME=secret_username -e PASSWORD=secret_password -d tscolari/gemserver
```

It's possible to set the gem folder as well:

```
  docker run ... -v /my_gems /var/gems ... tscolari/gemserver
```

