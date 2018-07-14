defmodule SharefestApi.Party.Event do
  @moduledoc """
  This module contains the definition of event schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  @foreign_key_type Ecto.UUID

  schema "events" do
    field(:address, :string)
    field(:description, :string)
    field(:invitation_uri, :string)
    field(:latitude, :string)
    field(:longitude, :string)
    field(:name, :string)
    field(:start_date, :utc_datetime)
    field(:feasted, :string)
    field(:referred_code, :string)

    belongs_to(:user, SharefestApi.People.User, type: Ecto.UUID)

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [
      :name,
      :description,
      :start_date,
      :address,
      :latitude,
      :longitude,
      :invitation_uri,
      :user_id,
      :feasted,
      :referred_code,
    ])
    |> validate_required([
      :name,
      :start_date,
      :address,
      :latitude,
      :longitude,
      :invitation_uri,
      :feasted
    ])
    |> foreign_key_constraint(:user_id)
  end
end
