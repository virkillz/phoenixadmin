defmodule Phoenixadmin.LoggingTest do
  use Phoenixadmin.DataCase

  alias Phoenixadmin.Logging

  describe "activity" do
    alias Phoenixadmin.Logging.Activity

    @valid_attrs %{activity: "some activity"}
    @update_attrs %{activity: "some updated activity"}
    @invalid_attrs %{activity: nil}

    def activity_fixture(attrs \\ %{}) do
      {:ok, activity} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Logging.create_activity()

      activity
    end

    test "list_activity/0 returns all activity" do
      activity = activity_fixture()
      assert Logging.list_activity() == [activity]
    end

    test "get_activity!/1 returns the activity with given id" do
      activity = activity_fixture()
      assert Logging.get_activity!(activity.id) == activity
    end

    test "create_activity/1 with valid data creates a activity" do
      assert {:ok, %Activity{} = activity} = Logging.create_activity(@valid_attrs)
      assert activity.activity == "some activity"
    end

    test "create_activity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Logging.create_activity(@invalid_attrs)
    end

    test "update_activity/2 with valid data updates the activity" do
      activity = activity_fixture()
      assert {:ok, activity} = Logging.update_activity(activity, @update_attrs)
      assert %Activity{} = activity
      assert activity.activity == "some updated activity"
    end

    test "update_activity/2 with invalid data returns error changeset" do
      activity = activity_fixture()
      assert {:error, %Ecto.Changeset{}} = Logging.update_activity(activity, @invalid_attrs)
      assert activity == Logging.get_activity!(activity.id)
    end

    test "delete_activity/1 deletes the activity" do
      activity = activity_fixture()
      assert {:ok, %Activity{}} = Logging.delete_activity(activity)
      assert_raise Ecto.NoResultsError, fn -> Logging.get_activity!(activity.id) end
    end

    test "change_activity/1 returns a activity changeset" do
      activity = activity_fixture()
      assert %Ecto.Changeset{} = Logging.change_activity(activity)
    end
  end
end
