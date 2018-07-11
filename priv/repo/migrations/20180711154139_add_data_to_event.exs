defmodule SharefestApi.Repo.Migrations.AddDataToEvent do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :feasted, :string
      add :referred_code, :string
    end
  end
end
