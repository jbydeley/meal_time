defmodule MealTime.Repo.Migrations.CreateMeals do
  use Ecto.Migration

  def change do
    create table(:meals) do
      add :name, :string, null: false
      add :description, :text

      timestamps()
    end

    create unique_index(:meals, [:name])
  end
end
