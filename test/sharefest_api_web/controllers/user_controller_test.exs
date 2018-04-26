defmodule SharefestApiWeb.UserControllerTest do
  use SharefestApiWeb.ConnCase

  alias SharefestApi.People.User
  alias SharefestApi.People.Users
  alias Comeonin.Bcrypt

  @create_attrs %{
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

  def fixture(:user) do
    {:ok, user} = Users.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all user", %{conn: conn} do
      conn = get conn, user_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post conn, user_path(conn, :create), user: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, user_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "amazon_id" => "some amazon_id",
        "amazon_token" => "some amazon_token",
        "device_token" => "some device_token",
        "email" => "some email",
        "facebook_id" => "some facebook_id",
        "facebook_token" => "some facebook_token",
        "lastname" => "some lastname",
        "password" => Bcrypt.hashpwsalt("elixir"),
        "name" => "some name",
        "phone" => "some phone",
        "receive_notifications" => true}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, user_path(conn, :create), user: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user" do
    setup [:create_user]

    test "renders user when data is valid", %{conn: conn, user: %User{id: id} = user} do
      conn = put conn, user_path(conn, :update, user), user: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, user_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "amazon_id" => "some updated amazon_id",
        "amazon_token" => "some updated amazon_token",
        "device_token" => "some updated device_token",
        "email" => "some updated email",
        "facebook_id" => "some updated facebook_id",
        "facebook_token" => "some updated facebook_token",
        "lastname" => "some updated lastname",
        "name" => "some updated name",
        "password" => Bcrypt.hashpwsalt("elixir"),
        "phone" => "some updated phone",
        "receive_notifications" => false}
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put conn, user_path(conn, :update, user), user: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    {:ok, user: user}
  end
end
