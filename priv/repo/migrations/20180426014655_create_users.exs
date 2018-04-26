defmodule SharefestApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :lastname, :string
      add :phone, :string
      add :email, :string
      add :password, :string
      add :device_token, :string
      add :facebook_id, :string
      add :facebook_token, :string
      add :amazon_id, :string
      add :amazon_token, :string
      add :receive_notifications, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:phone])
    create unique_index(:users, [:amazon_id])
    create unique_index(:users, [:facebook_id])

  end
end
