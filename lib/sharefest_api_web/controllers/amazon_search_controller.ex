defmodule SharefestApiWeb.AmazonSearchController do
  use SharefestApiWeb, :controller


  def search(conn, %{"item" => %{"keywords" => keywords}}) do

    System.put_env("AWS_ASSOCIATE", "sharefest02-20")

    items = Apax.item_search(keywords)
    IO.inspect items

    render(conn, "index.json", items: items)
  end

end

