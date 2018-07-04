defmodule Phoenixadmin.Repo.Migrations.CreateActivity do
  use Ecto.Migration

  def change do
    create table(:activity) do
      add :activity, :string
      add :user_id, references(:user, on_delete: :nothing)

      timestamps()
    end

    create index(:activity, [:user_id])
  end
end
