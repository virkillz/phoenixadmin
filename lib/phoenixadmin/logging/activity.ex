defmodule Phoenixadmin.Logging.Activity do
  use Ecto.Schema
  import Ecto.Changeset


  schema "activity" do
    field :activity, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(activity, attrs) do
    activity
    |> cast(attrs, [:activity, :user_id])
    |> validate_required([:activity, :user_id])
  end
end
