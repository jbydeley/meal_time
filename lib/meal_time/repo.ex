defmodule MealTime.Repo do
  use Ecto.Repo,
    otp_app: :meal_time,
    adapter: Ecto.Adapters.Postgres
end
