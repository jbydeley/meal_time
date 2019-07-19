defmodule MealTimeWeb.UserController do
  use MealTimeWeb, :controller

  alias MealTime.{Accounts, Accounts.User, Auth.Guardian}

  def new(conn, _) do
    changeset = Accounts.change_registration(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user)
        |> put_flash(:success, "Welcome")
        |> redirect(to: "/secret")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
