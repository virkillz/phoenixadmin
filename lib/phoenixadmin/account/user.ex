defmodule Phoenixadmin.Account.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Phoenixadmin.Account.User


  schema "user" do
    field :avatar, :string
    field :bio, :string
    field :email, :string
    field :fullname, :string
    field :is_active, :boolean, default: false
    field :location, :string
    field :mobile, :string
    field :password, :string
    field :password_hash, :string
    field :role, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:fullname, :username, :password, :password_hash, :avatar, :role, :is_active, :email, :mobile, :bio, :location])
    |> validate_required([:fullname, :username, :password, :avatar ])
  end


  def registration_changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:fullname, :avatar, :role, :is_active, :username, :password, :email, :mobile, :bio, :location])
    |> validate_required([:fullname, :username, :password])
    |> validate_length(:username, min: 3, max: 16)
    |> validate_length(:password, min: 5)
    |> unique_constraint(:username)
    |> put_password_hash()
    |> put_change(:password, "-")
  end

  def put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        change(changeset, password_hash: Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end

end
