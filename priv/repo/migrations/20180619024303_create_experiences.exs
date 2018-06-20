defmodule SharefestApi.Repo.Migrations.CreateExperiences do
  use Ecto.Migration

  def change do
    create table(:experiences) do
      add :name, :string
      add :description, :string, size: 1024
      add :uri_image, :string, size: 512
      add :status, :boolean, default: true, null: false

      timestamps()
    end

  end
end
