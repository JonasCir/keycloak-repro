## How to run this?
Insert this line into your `/etc/hosts` file:
```
127.0.0.1	sormas-docker-test.com
```

The goal is to run Keycloak behind a reverse proxy where `sormas-docker-test.com/keycloak` completely proxies the
keycloak container. This worked flawlessly in the last version I was using i.e., Keycloak 16.1.

* `src/hostname-path` contains a docker-compose deployment to show that passing `--hostname-path=keycloak` is not 
applied to `/admin`.

* `src/http-relative` contains a docker-compose deployment to show the blank page and reload of the admin console.

Run everything with `docker compose up -d`.