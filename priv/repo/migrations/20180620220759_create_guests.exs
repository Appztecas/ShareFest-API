defmodule SharefestApi.Repo.Migrations.CreateGuests do
  use Ecto.Migration

  def change do
    create table(:guests) do
      add :email, :string
      add :phone, :string
      add :status, :string
      add :user_id, references(:users, on_delete: :nothing, type: :uuid)
      add :event_id, references(:events, on_delete: :nothing)

      timestamps()
    end

    create index(:guests, [:user_id])
    create index(:guests, [:event_id])
  end
end
