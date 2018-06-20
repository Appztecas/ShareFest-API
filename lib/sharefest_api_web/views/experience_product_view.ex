defmodule SharefestApiWeb.ExperienceProductView do
  use SharefestApiWeb, :view
  alias SharefestApiWeb.ExperienceProductView

  def render("index.json", %{experience_products: experience_products}) do
    %{
      success: "true",
      data: render_many(experience_products, ExperienceProductView, "experience_product.json"),
      errors: nil
    }
  end

  def render("show.json", %{experience_product: experience_product}) do
    %{
      success: "true",
      data: render_one(experience_product, ExperienceProductView, "experience_product.json"),
      errors: nil
    }
  end

  def render("experience_product.json", %{experience_product: experience_product}) do
    %{id: experience_product.id,
      name: experience_product.name,
      description: experience_product.description,
      uri_image: experience_product.uri_image,
      price: experience_product.price}
  end
end
