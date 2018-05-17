defmodule SharefestApiWeb.BusinessActivityControllerTest do
  use SharefestApiWeb.ConnCase

  alias SharefestApi.People.BusinessActivity
  alias SharefestApi.People.BusinessActivities

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:business_activity) do
    {:ok, business_activity} = BusinessActivities.create_business_activity(@create_attrs)
    business_activity
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all business_activities", %{conn: conn} do
      conn = get(conn, business_activity_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create business_activity" do
    test "renders business_activity when data is valid", %{conn: conn} do
      conn = post(conn, business_activity_path(conn, :create), business_activity: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, business_activity_path(conn, :show, id))
      assert json_response(conn, 200)["data"] == %{"id" => id, "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, business_activity_path(conn, :create), business_activity: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update business_activity" do
    setup [:create_business_activity]

    test "renders business_activity when data is valid", %{
      conn: conn,
      business_activity: %BusinessActivity{id: id} = business_activity
    } do
      conn =
        put(
          conn,
          business_activity_path(conn, :update, business_activity),
          business_activity: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, business_activity_path(conn, :show, id))
      assert json_response(conn, 200)["data"] == %{"id" => id, "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      business_activity: business_activity
    } do
      conn =
        put(
          conn,
          business_activity_path(conn, :update, business_activity),
          business_activity: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp create_business_activity(_) do
    business_activity = fixture(:business_activity)
    {:ok, business_activity: business_activity}
  end
end
