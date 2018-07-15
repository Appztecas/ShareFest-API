defmodule SharefestApi.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :external_id, :string
      add :uri_image, :string

      timestamps()
    end

  end
end
