defmodule SharefestApiWeb.ExperienceProductControllerTest do
  use SharefestApiWeb.ConnCase

  alias SharefestApi.Catalogue.ExperienceProduct
  alias SharefestApi.Catalogue.ExperienceProducts

  @create_attrs %{
    description: "some description",
    name: "some name",
    price: 120.5,
    uri_image: "some uri_image"
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name",
    price: 456.7,
    uri_image: "some updated uri_image"
  }
  @invalid_attrs %{description: nil, name: nil, price: nil, uri_image: nil}

  def fixture(:experience_product) do
    {:ok, experience_product} = ExperienceProducts.create_experience_product(@create_attrs)
    experience_product
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all experience_products", %{conn: conn} do
      conn = get(conn, experience_experience_product_path(conn, :index, 1))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create experience_product" do
    test "renders experience_product when data is valid", %{conn: conn} do
      conn =
        post(
          conn,
          experience_experience_product_path(conn, :create),
          experience_product: @create_attrs
        )

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, experience_experience_product_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "description" => "some description",
               "name" => "some name",
               "price" => 120.5,
               "uri_image" => "some uri_image"
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(
          conn,
          experience_experience_product_path(conn, :create),
          experience_product: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update experience_product" do
    setup [:create_experience_product]

    test "renders experience_product when data is valid", %{
      conn: conn,
      experience_product: %ExperienceProduct{id: id} = experience_product
    } do
      conn =
        put(
          conn,
          experience_experience_product_path(conn, :update, experience_product),
          experience_product: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, experience_experience_product_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "description" => "some updated description",
               "name" => "some updated name",
               "price" => 456.7,
               "uri_image" => "some updated uri_image"
             }
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      experience_product: experience_product
    } do
      conn =
        put(
          conn,
          experience_experience_product_path(conn, :update, experience_product),
          experience_product: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete experience_product" do
    setup [:create_experience_product]

    test "deletes chosen experience_product", %{
      conn: conn,
      experience_product: experience_product
    } do
      conn = delete(conn, experience_experience_product_path(conn, :delete, experience_product))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, experience_experience_product_path(conn, :show, experience_product))
      end)
    end
  end

  defp create_experience_product(_) do
    experience_product = fixture(:experience_product)
    {:ok, experience_product: experience_product}
  end
end
