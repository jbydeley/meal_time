defmodule MealTime.Repo.Migrations.AddDateAndOwnerToMeal do
  use Ecto.Migration

  def change do
    alter table(:meals) do
      add :owner, :string
      add :date, :date
    end

    create index(:meals, [:owner])
  end
end
