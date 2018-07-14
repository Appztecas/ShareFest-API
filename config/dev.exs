use Mix.Config

config :sharefest_api, SharefestApiWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :sharefest_api, SharefestApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "sharefest_api_dev",
  hostname: "localhost",
  pool_size: 10

config :sharefest_api, SharefestApi.Authenticator,
  issuer: "sharefest",
  secret_key: "sw2CIb/8r9Dr3uQVJ4ih+oC7UiORWRUsW51ck9Jpwl5YKYIl2wULxJbsg5uY5ovU"

