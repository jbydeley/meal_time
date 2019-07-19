defmodule MealTime.PlansTest do
  use MealTime.DataCase

  alias MealTime.Plans

  describe "meals" do
    alias MealTime.Plans.Meal

    @valid_attrs %{description: "some description", name: "some name", photo: "some photo"}
    @update_attrs %{
      description: "some updated description",
      name: "some updated name",
      photo: "some updated photo"
    }
    @invalid_attrs %{description: nil, name: nil, photo: nil}

    def meal_fixture(attrs \\ %{}) do
      {:ok, meal} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Plans.create_meal()

      meal
    end

    test "list_meals/0 returns all meals" do
      meal = meal_fixture()
      assert Plans.list_meals() == [meal]
    end

    test "get_meal!/1 returns the meal with given id" do
      meal = meal_fixture()
      assert Plans.get_meal!(meal.id) == meal
    end

    test "create_meal/1 with valid data creates a meal" do
      assert {:ok, %Meal{} = meal} = Plans.create_meal(@valid_attrs)
      assert meal.description == "some description"
      assert meal.name == "some name"
      assert meal.photo == "some photo"
    end

    test "create_meal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plans.create_meal(@invalid_attrs)
    end

    test "update_meal/2 with valid data updates the meal" do
      meal = meal_fixture()
      assert {:ok, %Meal{} = meal} = Plans.update_meal(meal, @update_attrs)
      assert meal.description == "some updated description"
      assert meal.name == "some updated name"
      assert meal.photo == "some updated photo"
    end

    test "update_meal/2 with invalid data returns error changeset" do
      meal = meal_fixture()
      assert {:error, %Ecto.Changeset{}} = Plans.update_meal(meal, @invalid_attrs)
      assert meal == Plans.get_meal!(meal.id)
    end

    test "delete_meal/1 deletes the meal" do
      meal = meal_fixture()
      assert {:ok, %Meal{}} = Plans.delete_meal(meal)
      assert_raise Ecto.NoResultsError, fn -> Plans.get_meal!(meal.id) end
    end

    test "change_meal/1 returns a meal changeset" do
      meal = meal_fixture()
      assert %Ecto.Changeset{} = Plans.change_meal(meal)
    end
  end
end
