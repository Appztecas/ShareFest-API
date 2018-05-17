defmodule SharefestApi.Repo.Migrations.CreateBusinessActivities do
  use Ecto.Migration

  def change do
    create table(:business_activities) do
      add :name, :string

      timestamps()
    end

  end
end
