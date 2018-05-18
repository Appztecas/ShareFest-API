defmodule SharefestApi.Repo.Migrations.CreateSuppliers do
  use Ecto.Migration

  def change do
    create table(:suppliers) do
      add :name, :string
      add :description, :string
      add :area_of_service, :string
      add :photo, :string
      add :email, :string
      add :phone, :string
      add :social_account, :string
      add :logo, :string
      add :enabled, :boolean, default: true, null: false
      add :business_activity_id, references(:business_activities, on_delete: :nothing)

      timestamps()
    end

    create index(:suppliers, [:business_activity_id])
  end
end
