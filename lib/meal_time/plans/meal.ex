defmodule MealTime.Plans.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "meals" do
    field :description, :string
    field :name, :string
    field :owner, :string
    field :date, :date

    timestamps()
  end

  @doc false
  def changeset(meal, attrs) do
    meal
    |> cast(attrs, [:name, :description, :owner, :date])
    |> validate_required([:name, :description])
  end
end
