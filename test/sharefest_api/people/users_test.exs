defmodule SharefestApi.People.UsersTest do
  use SharefestApi.DataCase

  alias SharefestApi.People.Users

  describe "user" do
    alias SharefestApi.People.User

    @valid_attrs %{
      amazon_id: "some amazon_id",
      amazon_token: "some amazon_token",
      device_token: "some device_token",
      email: "some email",
      facebook_id: "some facebook_id",
      facebook_token: "some facebook_token",
      lastname: "some lastname",
      name: "some name",
      password: "elixir",
      phone: "some phone",
      receive_notifications: true
    }
    @update_attrs %{
      amazon_id: "some updated amazon_id",
      amazon_token: "some updated amazon_token",
      device_token: "some updated device_token",
      email: "some updated email",
      facebook_id: "some updated facebook_id",
      facebook_token: "some updated facebook_token",
      lastname: "some updated lastname",
      name: "some updated name",
      password: "elixir",
      phone: "some updated phone",
      receive_notifications: false
    }
    @invalid_attrs %{
      amazon_id: nil,
      amazon_token: nil,
      device_token: nil,
      email: nil,
      facebook_id: nil,
      facebook_token: nil,
      lastname: nil,
      name: nil,
      password: nil,
      phone: nil,
      receive_notifications: nil
    }

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_user()

      user
    end

    test "list_user/0 returns all user" do
      user = user_fixture()
      [saved_user] = Users.list_user()

      assert saved_user.email == user.email
      assert saved_user.phone == user.phone
      assert saved_user.name == user.name
      assert saved_user.lastname == user.lastname
      assert saved_user.amazon_id == user.amazon_id
      assert saved_user.amazon_token == user.amazon_token
      assert saved_user.device_token == user.device_token
      assert saved_user.facebook_id == user.facebook_id
      assert saved_user.facebook_token == user.facebook_token
      assert saved_user.password == user.password
      assert saved_user.receive_notifications == user.receive_notifications

    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      saved_user = Users.get_user!(user.id)

      assert saved_user.email == user.email
      assert saved_user.phone == user.phone
      assert saved_user.name == user.name
      assert saved_user.lastname == user.lastname
      assert saved_user.amazon_id == user.amazon_id
      assert saved_user.amazon_token == user.amazon_token
      assert saved_user.device_token == user.device_token
      assert saved_user.facebook_id == user.facebook_id
      assert saved_user.facebook_token == user.facebook_token
      assert saved_user.password == user.password
      assert saved_user.receive_notifications == user.receive_notifications

    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Users.create_user(@valid_attrs)
      assert user.amazon_id == "some amazon_id"
      assert user.amazon_token == "some amazon_token"
      assert user.device_token == "some device_token"
      assert user.email == "some email"
      assert user.facebook_id == "some facebook_id"
      assert user.facebook_token == "some facebook_token"
      assert user.lastname == "some lastname"
      assert user.name == "some name"
      assert user.phone == "some phone"
      assert user.receive_notifications == true
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user_sample = user_fixture()
      assert {:ok, user} = Users.update_user(user_sample, @update_attrs)
      assert %User{} = user
      assert user.amazon_id == "some updated amazon_id"
      assert user.amazon_token == "some updated amazon_token"
      assert user.device_token == "some updated device_token"
      assert user.email == "some updated email"
      assert user.facebook_id == "some updated facebook_id"
      assert user.facebook_token == "some updated facebook_token"
      assert user.lastname == "some updated lastname"
      assert user.name == "some updated name"
      assert user.password == user_sample.password
      assert user.phone == "some updated phone"
      assert user.receive_notifications == false
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      saved_user = Users.get_user!(user.id)

      assert saved_user.email == user.email
      assert saved_user.phone == user.phone
      assert saved_user.name == user.name
      assert saved_user.lastname == user.lastname
      assert saved_user.amazon_id == user.amazon_id
      assert saved_user.amazon_token == user.amazon_token
      assert saved_user.device_token == user.device_token
      assert saved_user.facebook_id == user.facebook_id
      assert saved_user.facebook_token == user.facebook_token
      assert saved_user.password == user.password
      assert saved_user.receive_notifications == user.receive_notifications

    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end
