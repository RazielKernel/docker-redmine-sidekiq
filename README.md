This is a fully functional Redmine Ticketing Docker setup that uses Sidekiq as the default, production-grade, event and mailer handlers.

## **Instructions**
- Pull the repo
- Adjust **docker-compose.yml** by setting your own:
  - Optional `HOST_IP`, then required `HOST_PORT`
  - `REDMINE_DB_PASSWORD` with a strong password
  - `REDMINE_SECRET_KEY_BASE` with a long string, usually generated with something like: `openssl rand -hex 32`
  - `POSTGRES_PASSWORD` with what you've set as `REDMINE_DB_PASSWORD`
  - `redmine` and `redmine_worker`'s environment variables and mounted volumes NEED to be the same on both. This is because the `redmine` service runs the web interface, whereas `redmine_worker` only runs Sidekiq and takes care of the events that sit in the Redis database.
- Run `docker compose up -d`
- Check the logs with `docker compose logs -f`
- Redmine's web UI should be accessible at the specified `HOST_PORT`
- A reverse-proxy like Caddy would be very welcome.

Let me know if you run into any issues.
