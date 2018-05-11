defmodule SharefestApi.Party.Event do
  use Ecto.Schema
  import Ecto.Changeset

  @foreign_key_type Ecto.UUID

  schema "events" do
    field :address, :string
    field :description, :string
    field :invitation_uri, :string
    field :latitude, :string
    field :longitude, :string
    field :name, :string
    field :start_date, :date

    belongs_to :user, SharefestApi.People.User

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :description, :start_date, :address, :latitude, :longitude, :invitation_uri])
    |> validate_required([:name, :description, :start_date, :address, :latitude, :longitude, :invitation_uri])
    |> foreign_key_constraint(:user_id)
  end
end
