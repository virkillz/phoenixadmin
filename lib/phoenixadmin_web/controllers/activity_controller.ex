defmodule PhoenixadminWeb.ActivityController do
  use PhoenixadminWeb, :controller

  alias Phoenixadmin.Logging
  alias Phoenixadmin.Logging.Activity

  def index(conn, _params) do
    activity = Logging.get_last_x_activity(100)
    render(conn, "index.html", activity: activity)
  end

  def new(conn, _params) do
    changeset = Logging.change_activity(%Activity{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"activity" => activity_params}) do
    case Logging.create_activity(activity_params) do
      {:ok, activity} ->
        conn
        |> put_flash(:info, "Activity created successfully.")
        |> redirect(to: activity_path(conn, :show, activity))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    activity = Logging.get_activity!(id)
    render(conn, "show.html", activity: activity)
  end

  def edit(conn, %{"id" => id}) do
    activity = Logging.get_activity!(id)
    changeset = Logging.change_activity(activity)
    render(conn, "edit.html", activity: activity, changeset: changeset)
  end

  def update(conn, %{"id" => id, "activity" => activity_params}) do
    activity = Logging.get_activity!(id)

    case Logging.update_activity(activity, activity_params) do
      {:ok, activity} ->
        conn
        |> put_flash(:info, "Activity updated successfully.")
        |> redirect(to: activity_path(conn, :show, activity))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", activity: activity, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    activity = Logging.get_activity!(id)
    {:ok, _activity} = Logging.delete_activity(activity)

    conn
    |> put_flash(:info, "Activity deleted successfully.")
    |> redirect(to: activity_path(conn, :index))
  end
end
