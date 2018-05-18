defmodule SharefestApiWeb.SupplierControllerTest do
  use SharefestApiWeb.ConnCase

  alias SharefestApi.People.Supplier
  alias SharefestApi.People.Suppliers

  @create_attrs %{
    area_of_service: "some area_of_service",
    description: "some description",
    email: "some email",
    logo: "some logo",
    name: "some name",
    phone: "some phone",
    photo: "some photo",
    social_account: "some social_account"
  }
  @update_attrs %{
    area_of_service: "some updated area_of_service",
    description: "some updated description",
    email: "some updated email",
    logo: "some updated logo",
    name: "some updated name",
    phone: "some updated phone",
    photo: "some updated photo",
    social_account: "some updated social_account"
  }
  @invalid_attrs %{
    area_of_service: nil,
    description: nil,
    email: nil,
    logo: nil,
    name: nil,
    phone: nil,
    photo: nil,
    social_account: nil
  }

  def fixture(:supplier) do
    {:ok, supplier} = Suppliers.create_supplier(@create_attrs)
    supplier
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all suppliers", %{conn: conn} do
      conn = get(conn, supplier_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create supplier" do
    test "renders supplier when data is valid", %{conn: conn} do
      conn = post(conn, supplier_path(conn, :create), supplier: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, supplier_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "area_of_service" => "some area_of_service",
               "description" => "some description",
               "email" => "some email",
               "logo" => "some logo",
               "name" => "some name",
               "phone" => "some phone",
               "photo" => "some photo",
               "social_account" => "some social_account"
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, supplier_path(conn, :create), supplier: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update supplier" do
    setup [:create_supplier]

    test "renders supplier when data is valid", %{
      conn: conn,
      supplier: %Supplier{id: id} = supplier
    } do
      conn = put(conn, supplier_path(conn, :update, supplier), supplier: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, supplier_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "area_of_service" => "some updated area_of_service",
               "description" => "some updated description",
               "email" => "some updated email",
               "logo" => "some updated logo",
               "name" => "some updated name",
               "phone" => "some updated phone",
               "photo" => "some updated photo",
               "social_account" => "some updated social_account"
             }
    end

    test "renders errors when data is invalid", %{conn: conn, supplier: supplier} do
      conn = put(conn, supplier_path(conn, :update, supplier), supplier: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete supplier" do
    setup [:create_supplier]

    test "deletes chosen supplier", %{conn: conn, supplier: supplier} do
      conn = delete(conn, supplier_path(conn, :delete, supplier))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, supplier_path(conn, :show, supplier))
      end)
    end
  end

  defp create_supplier(_) do
    supplier = fixture(:supplier)
    {:ok, supplier: supplier}
  end
end
