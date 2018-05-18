defmodule SharefestApiWeb.SupplierController do
  use SharefestApiWeb, :controller

  alias SharefestApi.People.Supplier
  alias SharefestApi.People.Suppliers

  action_fallback SharefestApiWeb.FallbackController

  def index(conn, _params) do
    suppliers = Suppliers.list_suppliers()
    render(conn, "index.json", suppliers: suppliers)
  end

  def create(conn, %{"supplier" => supplier_params}) do
    with {:ok, %Supplier{} = supplier} <- Suppliers.create_supplier(supplier_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", supplier_path(conn, :show, supplier))
      |> render("show.json", supplier: supplier)
    end
  end

  def show(conn, %{"id" => id}) do
    supplier = Suppliers.get_supplier!(id)
    render(conn, "show.json", supplier: supplier)
  end

  def update(conn, %{"id" => id, "supplier" => supplier_params}) do
    supplier = Suppliers.get_supplier!(id)

    with {:ok, %Supplier{} = supplier} <- Suppliers.update_supplier(supplier, supplier_params) do
      render(conn, "show.json", supplier: supplier)
    end
  end

  def delete(conn, %{"id" => id}) do
    supplier = Suppliers.get_supplier!(id)
    with {:ok, %Supplier{}} <- Suppliers.delete_supplier(supplier) do
      send_resp(conn, :no_content, "")
    end
  end
end
