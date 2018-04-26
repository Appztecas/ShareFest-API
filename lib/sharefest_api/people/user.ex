defmodule SharefestApi.People.User do
  @moduledoc """
  Definition module for Users Schema
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Bcrypt

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field :amazon_id, :string
    field :amazon_token, :string
    field :device_token, :string
    field :email, :string
    field :facebook_id, :string
    field :facebook_token, :string
    field :lastname, :string
    field :name, :string
    field :password, :string
    field :phone, :string
    field :receive_notifications, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [
          :name,
          :lastname,
          :phone,
          :email,
          :password,
          :device_token,
          :facebook_id,
          :facebook_token,
          :amazon_id,
          :amazon_token,
          :receive_notifications
        ])
    |> validate_required([:name])
    |> unique_constraint(:email)
    |> unique_constraint(:phone)
    |> unique_constraint(:facebook_id)
    |> unique_constraint(:amazon_id)
    |> hash_pass()
  end

  defp hash_pass(%Ecto.Changeset{valid?: true, changes:
                                     %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hashpwsalt(password))
  end
  defp hash_pass(changeset), do: changeset

end
