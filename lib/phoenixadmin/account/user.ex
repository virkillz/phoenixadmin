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
    field :password, :string, virtual: true
    field :repassword, :string, virtual: true
    field :password_hash, :string
    field :role, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:fullname, :username, :password, :repassword, :password_hash, :avatar, :role, :is_active, :email, :mobile, :bio, :location])
    |> validate_required([:fullname, :username, :password, :avatar ])
  end


  def registration_changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:fullname, :avatar, :role, :is_active, :username, :password, :repassword, :email, :mobile, :bio, :location])
    |> validate_required([:fullname, :username, :password])
    |> validate_length(:username, min: 3, max: 16)
    |> validate_length(:password, min: 5)
    |> validate_password
    |> unique_constraint(:username)
    |> put_password_hash()
  end

  def validate_password(changeset) do 
    password = get_field(changeset, :password)
    repassword = get_field(changeset, :repassword)    
    if password == repassword do
      changeset
    else
      add_error(changeset, :repassword, "Password didn't match")
    end
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
