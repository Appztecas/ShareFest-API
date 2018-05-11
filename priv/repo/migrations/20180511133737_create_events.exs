defmodule SharefestApi.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :description, :string
      add :start_date, :date
      add :address, :string
      add :latitude, :string
      add :longitude, :string
      add :invitation_uri, :string
      add :user_id, references(:users, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create index(:events, [:user_id])
  end
end
