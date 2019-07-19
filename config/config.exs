# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :meal_time,
  ecto_repos: [MealTime.Repo]

config :meal_time, MealTime.Auth.Guardian,
  issuer: "meal_time",
  secret_key: "M1B1k1OZPvDKsMX2O86aFH0HCy3kCw5LbAz3D34cmByVFA2JqRwq3nxT68ZRTfOt"

# Configures the endpoint
config :meal_time, MealTimeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "x9+WiKJl4xEFgitl23Gi9QaTPsMb608536GQp/U7J5FmhZH7Zbh5Z4z4WN/PbAe0",
  render_errors: [view: MealTimeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MealTime.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :argon2_elixir,
  salt: "ThisIsn'tGreat",
  t_cost: 13,
  m_cost: 17

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
