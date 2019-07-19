defmodule MealTime.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :meal_time,
    error_handler: MealTime.Auth.ErrorHandler,
    module: MealTime.Auth.Guardian

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
  plug MealTime.Auth.CurrentUser
end
