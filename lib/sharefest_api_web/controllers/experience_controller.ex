defmodule SharefestApiWeb.ExperienceController do
  use SharefestApiWeb, :controller

  alias SharefestApi.Catalogue.Experience
  alias SharefestApi.Catalogue.Experiences

  action_fallback SharefestApiWeb.FallbackController

  def index(conn, _params) do
    experiences = Experiences.list_experiences()
    render(conn, "index.json", experiences: experiences)
  end

  def create(conn, %{"experience" => experience_params}) do
    with {:ok, %Experience{} = experience} <- Experiences.create_experience(experience_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", experience_path(conn, :show, experience))
      |> render("show.json", experience: experience)
    end
  end

  def show(conn, %{"id" => id}) do
    experience = Experiences.get_experience!(id)
    render(conn, "show.json", experience: experience)
  end

  def update(conn, %{"id" => id, "experience" => experience_params}) do
    experience = Experiences.get_experience!(id)

    with {:ok, %Experience{} = experience} <- Experiences.update_experience(experience, experience_params) do
      render(conn, "show.json", experience: experience)
    end
  end

  def delete(conn, %{"id" => id}) do
    experience = Experiences.get_experience!(id)
    with {:ok, %Experience{}} <- Experiences.delete_experience(experience) do
      send_resp(conn, :no_content, "")
    end
  end
end
