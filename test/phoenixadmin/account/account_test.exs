defmodule Phoenixadmin.AccountTest do
  use Phoenixadmin.DataCase

  alias Phoenixadmin.Account

  describe "user" do
    alias Phoenixadmin.Account.User

    @valid_attrs %{avatar: "some avatar", bio: "some bio", email: "some email", fullname: "some fullname", is_active: true, location: "some location", mobile: "some mobile", password: "some password", password_hash: "some password_hash", role: "some role", username: "some username"}
    @update_attrs %{avatar: "some updated avatar", bio: "some updated bio", email: "some updated email", fullname: "some updated fullname", is_active: false, location: "some updated location", mobile: "some updated mobile", password: "some updated password", password_hash: "some updated password_hash", role: "some updated role", username: "some updated username"}
    @invalid_attrs %{avatar: nil, bio: nil, email: nil, fullname: nil, is_active: nil, location: nil, mobile: nil, password: nil, password_hash: nil, role: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_user()

      user
    end

    test "list_user/0 returns all user" do
      user = user_fixture()
      assert Account.list_user() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Account.create_user(@valid_attrs)
      assert user.avatar == "some avatar"
      assert user.bio == "some bio"
      assert user.email == "some email"
      assert user.fullname == "some fullname"
      assert user.is_active == true
      assert user.location == "some location"
      assert user.mobile == "some mobile"
      assert user.password == "some password"
      assert user.password_hash == "some password_hash"
      assert user.role == "some role"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Account.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.avatar == "some updated avatar"
      assert user.bio == "some updated bio"
      assert user.email == "some updated email"
      assert user.fullname == "some updated fullname"
      assert user.is_active == false
      assert user.location == "some updated location"
      assert user.mobile == "some updated mobile"
      assert user.password == "some updated password"
      assert user.password_hash == "some updated password_hash"
      assert user.role == "some updated role"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end
end
