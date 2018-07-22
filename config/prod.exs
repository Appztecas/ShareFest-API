use Mix.Config

config :sharefest_api, SharefestApiWeb.Endpoint,
  http: [port: "${PORT}"],
  url: [host: "${PHX_URL}"],
  secret_key_base: "${PHX_SECRET_KEY_BASE}",
  server: true,
  root: ".",
  version: Mix.Project.config[:version]

# Do not print debug messages in production
config :logger, level: :info

# Configures the Database
config :sharefest_api, SharefestApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: "${DATABASE_URL}",
  pool_size: 20

config :sharefest_api, SharefestApi.Authenticator,
  issuer: "appaztecas",
  secret_key: "${AUTH_SECRET_KEY}"

config :apax,
  AWS_ASSOCIATE: "${AWS_ASSOCIATE}",
  AWS_KEY: "${AWS_KEY}" ,
  AWS_SECRET: "${AWS_SECRET}",
  marketplace_host: "webservices.amazon.com.mx"
