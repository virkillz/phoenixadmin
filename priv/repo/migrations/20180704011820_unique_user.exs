defmodule Phoenixadmin.Repo.Migrations.UniqueUser do
  use Ecto.Migration

  def change do
  		create unique_index(:user, [:username])
  end
end
