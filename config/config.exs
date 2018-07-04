# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenixadmin,
  ecto_repos: [Phoenixadmin.Repo]

# Configures the endpoint
config :phoenixadmin, PhoenixadminWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "U6rb9AJCDoSe1LtiNJOsLGzUW8+S60TApNALK1lnjems+w+yx3pcMD2d4dskTxax",
  render_errors: [view: PhoenixadminWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Phoenixadmin.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Configures Guardian
config :phoenixadmin, Phoenixadmin.Auth.Guardian,
  issuer: "phoenixadmin",
  secret_key: "HNinpKh9Ne3tr8BpjCpAEh0xzCqTIG3PWsfkR2AtzvUaRIpbs6oIQ9RcmjmGPekJ"

config :phoenixadmin, Phoenixadmin.Auth.AuthAccessPipeline,
  module: Phoenixadmin.Auth.Guardian,
  error_handler: Phoenixadmin.Auth.AuthErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
