defmodule SharefestApiWeb.EventControllerTest do
  use SharefestApiWeb.ConnCase

  alias SharefestApi.Party.Event
  alias SharefestApi.Party.Events

  @create_attrs %{
    address: "some address",
    description: "some description",
    invitation_uri: "some invitation_uri",
    latitude: "some latitude",
    longitude: "some longitude",
    name: "some name",
    start_date: ~D[2010-04-17]
  }
  @update_attrs %{
    address: "some updated address",
    description: "some updated description",
    invitation_uri: "some updated invitation_uri",
    latitude: "some updated latitude",
    longitude: "some updated longitude",
    name: "some updated name",
    start_date: ~D[2011-05-18]
  }
  @invalid_attrs %{
    address: nil,
    description: nil,
    invitation_uri: nil,
    latitude: nil,
    longitude: nil,
    name: nil,
    start_date: nil
  }

  def fixture(:event) do
    {:ok, event} = Events.create_event(@create_attrs)
    event
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all events", %{conn: conn} do
      conn = get(conn, event_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create event" do
    test "renders event when data is valid", %{conn: conn} do
      conn = post(conn, event_path(conn, :create), event: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, event_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "address" => "some address",
               "description" => "some description",
               "invitation_uri" => "some invitation_uri",
               "latitude" => "some latitude",
               "longitude" => "some longitude",
               "name" => "some name",
               "start_date" => "2010-04-17"
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, event_path(conn, :create), event: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update event" do
    setup [:create_event]

    test "renders event when data is valid", %{conn: conn, event: %Event{id: id} = event} do
      conn = put(conn, event_path(conn, :update, event), event: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, event_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "address" => "some updated address",
               "description" => "some updated description",
               "invitation_uri" => "some updated invitation_uri",
               "latitude" => "some updated latitude",
               "longitude" => "some updated longitude",
               "name" => "some updated name",
               "start_date" => "2011-05-18"
             }
    end

    test "renders errors when data is invalid", %{conn: conn, event: event} do
      conn = put(conn, event_path(conn, :update, event), event: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete event" do
    setup [:create_event]

    test "deletes chosen event", %{conn: conn, event: event} do
      conn = delete(conn, event_path(conn, :delete, event))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, event_path(conn, :show, event))
      end)
    end
  end

  defp create_event(_) do
    event = fixture(:event)
    {:ok, event: event}
  end
end
