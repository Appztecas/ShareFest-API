defmodule SharefestApi.Repo.Migrations.CreateExperienceProducts do
  use Ecto.Migration

  def change do
    create table(:experience_products) do
      add :name, :string
      add :description, :string
      add :uri_image, :string
      add :price, :float
      add :experience_id, references(:experiences, on_delete: :nothing)

      timestamps()
    end

    create index(:experience_products, [:experience_id])
  end
end
