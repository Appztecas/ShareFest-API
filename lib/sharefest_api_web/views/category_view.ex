defmodule SharefestApiWeb.CategoryView do
  use SharefestApiWeb, :view
  alias SharefestApiWeb.CategoryView

  def render("index.json", %{categories: categories}) do
    %{
      success: "true",
      data: render_many(categories, CategoryView, "category.json"),
      errors: nil
    }
  end

  def render("show.json", %{category: category}) do
    %{
      success: "true",
      data: render_one(category, CategoryView, "category.json"),
      errors: nil
    }
  end

  def render("category.json", %{category: category}) do
    %{
      id: category.id,
      name: category.name,
      external_id: category.external_id,
      uri_image: category.uri_image,
      node: category.node
    }
  end
end
