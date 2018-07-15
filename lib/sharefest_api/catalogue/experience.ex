defmodule SharefestApi.Catalogue.Experience do
  @moduledoc """
  This module defines the products schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "experiences" do
    field :description, :string
    field :name, :string
    field :status, :boolean, default: false
    field :uri_image, :string

    has_many :experience_products, SharefestApi.Catalogue.ExperienceProduct

    timestamps()
  end

  @doc false
  def changeset(experience, attrs) do
    experience
    |> cast(attrs, [:name, :description, :uri_image, :status])
    |> validate_required([:name, :description, :uri_image, :status])
  end
end
