defmodule MealTime.Auth.ErrorHandler do
  import Phoenix.Controller

  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {_type, _reason}, _opts) do
    # body = to_string(reason)

    conn
    |> put_flash(:error, "You need to log in")
    |> redirect(to: "/login")
  end
end
