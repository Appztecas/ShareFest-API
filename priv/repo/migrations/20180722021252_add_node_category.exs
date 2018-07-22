defmodule SharefestApi.Repo.Migrations.AddNodeCategory do
  use Ecto.Migration

  def change do
    alter table(:categories) do
      add :node, :string
    end
  end
end
