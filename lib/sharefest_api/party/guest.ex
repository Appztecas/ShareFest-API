defmodule SharefestApi.Party.Guest do
  @moduledoc """
  This module has the definition of guest schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "guests" do
    field :email, :string
    field :phone, :string
    field :status, :string

    belongs_to :user, SharefestApi.People.User, [type: Ecto.UUID]
    belongs_to :event, SharefestApi.Party.Event

    timestamps()
  end

  @doc false
  def changeset(guest, attrs) do
    guest
    |> cast(attrs, [:email, :phone, :status, :event, :user])
    |> validate_required([:email, :phone, :status])
  end
end
