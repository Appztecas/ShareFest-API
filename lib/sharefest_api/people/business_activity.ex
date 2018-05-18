defmodule SharefestApi.People.BusinessActivity do
  @moduledoc """
  Definition module for Business Activities
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "business_activities" do
    field :name, :string

    has_many :suppliers, SharefestApi.People.Supplier

    timestamps()
  end

  @doc false
  def changeset(business_activity, attrs) do
    business_activity
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
