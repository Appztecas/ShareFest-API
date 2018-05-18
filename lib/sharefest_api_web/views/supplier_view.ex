defmodule SharefestApiWeb.SupplierView do
  use SharefestApiWeb, :view
  alias SharefestApiWeb.SupplierView

  def render("index.json", %{suppliers: suppliers}) do
    %{
      success: "true",
      data: render_many(suppliers, SupplierView, "supplier.json"),
      errors: nil
    }
  end

  def render("show.json", %{supplier: supplier}) do
    %{
      success: "true",
      data: render_one(supplier, SupplierView, "supplier.json"),
      errors: nil
    }
  end

  def render("supplier.json", %{supplier: supplier}) do
    %{id: supplier.id,
      name: supplier.name,
      description: supplier.description,
      area_of_service: supplier.area_of_service,
      photo: supplier.photo,
      email: supplier.email,
      phone: supplier.phone,
      social_account: supplier.social_account,
      logo: supplier.logo}
  end
end
