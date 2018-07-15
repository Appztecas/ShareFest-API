defmodule SharefestApiWeb.CategoryControllerTest do
  use SharefestApiWeb.ConnCase

  alias SharefestApi.Catalogue.Category
  alias SharefestApi.Catalogue.Categories

  @create_attrs %{
    external_id: "some external_id",
    name: "some name",
    uri_image: "some uri_image"
  }
  @update_attrs %{
    external_id: "some updated external_id",
    name: "some updated name",
    uri_image: "some updated uri_image"
  }
  @invalid_attrs %{external_id: nil, name: nil, uri_image: nil}

  def fixture(:category) do
    {:ok, category} = Categories.create_category(@create_attrs)
    category
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all categories", %{conn: conn} do
      conn = get(conn, category_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create category" do
    test "renders category when data is valid", %{conn: conn} do
      conn = post(conn, category_path(conn, :create), category: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, category_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "external_id" => "some external_id",
               "name" => "some name",
               "uri_image" => "some uri_image"
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, category_path(conn, :create), category: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update category" do
    setup [:create_category]

    test "renders category when data is valid", %{
      conn: conn,
      category: %Category{id: id} = category
    } do
      conn = put(conn, category_path(conn, :update, category), category: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, category_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "external_id" => "some updated external_id",
               "name" => "some updated name",
               "uri_image" => "some updated uri_image"
             }
    end

    test "renders errors when data is invalid", %{conn: conn, category: category} do
      conn = put(conn, category_path(conn, :update, category), category: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete category" do
    setup [:create_category]

    test "deletes chosen category", %{conn: conn, category: category} do
      conn = delete(conn, category_path(conn, :delete, category))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, category_path(conn, :show, category))
      end)
    end
  end

  defp create_category(_) do
    category = fixture(:category)
    {:ok, category: category}
  end
end
