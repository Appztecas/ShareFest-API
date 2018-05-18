defmodule SharefestApi.People.Supplier do
  @moduledoc """
  Definition module for Suppliers
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "suppliers" do
    field(:area_of_service, :string)
    field(:description, :string)
    field(:email, :string)
    field(:enabled, :boolean, default: true)
    field(:logo, :string)
    field(:name, :string)
    field(:phone, :string)
    field(:photo, :string)
    field(:social_account, :string)

    belongs_to(:business_activity, SharefestApi.People.BusinessActivity)

    timestamps()
  end

  @doc false
  def changeset(supplier, attrs) do
    supplier
    |> cast(attrs, [
      :name,
      :description,
      :area_of_service,
      :photo,
      :email,
      :phone,
      :social_account,
      :logo,
      :enabled
    ])
    |> validate_required([
      :name,
      :description,
      :area_of_service,
      :photo,
      :email,
      :phone,
      :social_account,
      :logo
    ])
    # |> foreign_key_constraint(:business_activity_id)
  end
end
