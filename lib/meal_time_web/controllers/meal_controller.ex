defmodule MealTimeWeb.MealController do
  use MealTimeWeb, :controller

  alias MealTime.Plans
  alias MealTime.Plans.Meal

  def index(conn, _) do
    meals = Plans.list_meals()
    render(conn, "index.html", meals: meals)
  end

  def new(conn, _) do
    changeset = Plans.change_meal(%Meal{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"meal" => params}) do
    case Plans.create_meal(params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Meal created")
        |> redirect(to: Routes.meal_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    meal = Plans.get_meal!(id)
    render(conn, "index.html", meal: meal)
  end

  def edit(conn, %{"id" => id}) do
    meal = Plans.get_meal!(id)
    changeset = Plans.change_meal(meal)
    render(conn, "edit.html", meal: meal, changeset: changeset)
  end

  def update(conn, %{"id" => id, "meal" => params}) do
    meal = Plans.get_meal!(id)

    case Plans.update_meal(meal, params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Meal updated")
        |> redirect(to: Routes.meal_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    meal = Plans.get_meal!(id)
    Plans.delete_meal(meal)

    conn
    |> put_flash(:info, "Meal deleted")
    |> redirect(to: Routes.meal_path(conn, :index))
  end
end
