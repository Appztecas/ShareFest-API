defmodule SharefestApiWeb.ExperienceControllerTest do
  use SharefestApiWeb.ConnCase

  alias SharefestApi.Catalogue.Experience
  alias SharefestApi.Catalogue.Experiences

  @create_attrs %{description: "some description", name: "some name", status: true, uri_image: "some uri_image"}
  @update_attrs %{description: "some updated description", name: "some updated name", status: false, uri_image: "some updated uri_image"}
  @invalid_attrs %{description: nil, name: nil, status: nil, uri_image: nil}

  def fixture(:experience) do
    {:ok, experience} = Experiences.create_experience(@create_attrs)
    experience
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all experiences", %{conn: conn} do
      conn = get conn, experience_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create experience" do
    test "renders experience when data is valid", %{conn: conn} do
      conn = post conn, experience_path(conn, :create), experience: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, experience_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description",
        "name" => "some name",
        "status" => true,
        "uri_image" => "some uri_image"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, experience_path(conn, :create), experience: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update experience" do
    setup [:create_experience]

    test "renders experience when data is valid", %{conn: conn, experience: %Experience{id: id} = experience} do
      conn = put conn, experience_path(conn, :update, experience), experience: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, experience_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description",
        "name" => "some updated name",
        "status" => false,
        "uri_image" => "some updated uri_image"}
    end

    test "renders errors when data is invalid", %{conn: conn, experience: experience} do
      conn = put conn, experience_path(conn, :update, experience), experience: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete experience" do
    setup [:create_experience]

    test "deletes chosen experience", %{conn: conn, experience: experience} do
      conn = delete conn, experience_path(conn, :delete, experience)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, experience_path(conn, :show, experience)
      end
    end
  end

  defp create_experience(_) do
    experience = fixture(:experience)
    {:ok, experience: experience}
  end
end
