defmodule SharefestApi.Catalogue.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field(:external_id, :string)
    field(:name, :string)
    field(:uri_image, :string)
    field(:node, :string)

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :external_id, :uri_image, :node])
    |> validate_required([:name, :external_id, :uri_image, :node])
  end
end
