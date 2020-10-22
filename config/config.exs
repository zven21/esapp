# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :esapp,
  ecto_repos: [Esapp.Repo]

# Configures the endpoint
config :esapp, EsappWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AQQ3T47acX/IDymEwZSi0hCrgxgJy4m0riNTCjojO2sJ8MYa44xa0m1jw5QOxRpK",
  render_errors: [view: EsappWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Esapp.PubSub,
  live_view: [signing_salt: "8zXW+rXm"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
