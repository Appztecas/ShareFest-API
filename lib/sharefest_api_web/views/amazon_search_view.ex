defmodule SharefestApiWeb.AmazonSearchView do
  use SharefestApiWeb, :view
  alias SharefestApiWeb.AmazonSearchView

  def render("index.json", %{items: items}) do
    %{
      success: "true",
      data: render_many(items, AmazonSearchView, "item.json"),
      errors: nil
    }
  end

  def render("item.json", %{amazon_search: item}) do
    %{
      asin: item.asin,
      image: item.image,
      link: item.link,
      title: item.title
    }
  end
end
