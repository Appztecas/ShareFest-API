defmodule SharefestApiWeb.ExperienceProductController do
  use SharefestApiWeb, :controller

  alias SharefestApi.Catalogue.ExperienceProduct
  alias SharefestApi.Catalogue.ExperienceProducts

  action_fallback(SharefestApiWeb.FallbackController)

  def index(conn,  %{"experience_id" => experience_id}) do
    experience_products = ExperienceProducts.list_experience_products(experience_id)
    render(conn, "index.json", experience_products: experience_products)
  end

  def create(conn, %{"experience_product" => experience_product_params, "experience_id" => experience_id}) do
   params = Map.put(experience_product_params, "experience_id", experience_id)
    with {:ok, %ExperienceProduct{} = experience_product} <-
           ExperienceProducts.create_experience_product(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", experience_experience_product_path(conn, :show, experience_id, experience_product))
      |> render("show.json", experience_product: experience_product)
    end
  end

  def show(conn, id, %{"id" => id, "experience_id" => experience_id}) do
    experience_product = ExperienceProducts.get_experience_product!(id)
    render(conn, "show.json", experience_product: experience_product)
  end

  def update(conn, %{"id" => id, "experience_product" => experience_product_params}) do
    experience_product = ExperienceProducts.get_experience_product!(id)

    with {:ok, %ExperienceProduct{} = experience_product} <-
           ExperienceProducts.update_experience_product(
             experience_product,
             experience_product_params
           ) do
      render(conn, "show.json", experience_product: experience_product)
    end
  end

  def delete(conn, %{"id" => id}) do
    experience_product = ExperienceProducts.get_experience_product!(id)

    with {:ok, %ExperienceProduct{}} <-
           ExperienceProducts.delete_experience_product(experience_product) do
      send_resp(conn, :no_content, "")
    end
  end
end
