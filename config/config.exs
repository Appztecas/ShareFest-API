# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sharefest_api,
  ecto_repos: [SharefestApi.Repo]

# Configures the endpoint
config :sharefest_api, SharefestApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "X08KX+poGS2lnB1J7F94wmDfJwL9sdghyb9KDzaEn9AO92M5Uz9uijH52UnEtpWK",
  render_errors: [view: SharefestApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: SharefestApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :sharefest_api, SharefestApi.Authenticator,
  issuer: "appaztecas",
  secret_key: "fivpxAZ+mR1Ywzv3oXm8N9qacTNVA0paz/jRaTVLUYMPCgik1jL0JHH4rYV9+WWH"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
