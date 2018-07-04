defmodule Phoenixadmin.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :fullname, :string
      add :username, :string
      add :password, :string
      add :password_hash, :string
      add :avatar, :string
      add :role, :string
      add :is_active, :boolean, default: false, null: false
      add :bio, :string
      add :email, :string
      add :mobile, :string
      add :location, :string

      timestamps()
    end

  end
end
