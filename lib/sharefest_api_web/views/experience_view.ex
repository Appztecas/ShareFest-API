defmodule SharefestApiWeb.ExperienceView do
  use SharefestApiWeb, :view
  alias SharefestApiWeb.ExperienceView

  def render("index.json", %{experiences: experiences}) do
    %{
      success: "true",
      data: render_many(experiences, ExperienceView, "experience.json"),
      errors: nil
    }
  end

  def render("show.json", %{experience: experience}) do
    %{
      success: "true",
      data: render_one(experience, ExperienceView, "experience.json"),
      errors: nil
    }
  end

  def render("experience.json", %{experience: experience}) do
    %{id: experience.id,
      name: experience.name,
      description: experience.description,
      uri_image: experience.uri_image,
      status: experience.status}
  end
end
