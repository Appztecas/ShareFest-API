defmodule SharefestApi.Catalogue.ExperienceProduct do
  @moduledoc """
  This module defines the products of experiences
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "experience_products" do
    field :description, :string
    field :name, :string
    field :price, :float
    field :uri_image, :string

    belongs_to :experience, SharefestApi.Catalogue.Experience

    timestamps()
  end

  @doc false
  def changeset(experience_product, attrs) do
    experience_product
    |> cast(attrs, [:name, :description, :uri_image, :price, :experience_id])
    |> validate_required([:name, :description, :uri_image, :price, :experience_id])
    |> foreign_key_constraint(:experience_id)
  end
end
