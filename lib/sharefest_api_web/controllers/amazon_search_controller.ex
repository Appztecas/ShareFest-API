defmodule SharefestApiWeb.AmazonSearchController do
  use SharefestApiWeb, :controller


  def search(conn, %{"item" => %{"keywords" => keywords}}) do

    items = Apax.item_search(keywords)
    render(conn, "index.json", items: items)
  end

  def search(conn, %{"best_sellers" => %{"category" => index, "node" => node}}) do

    items = Apax.best_sellers(index, node)
    render(conn, "index.json", items: items)
  end

end

