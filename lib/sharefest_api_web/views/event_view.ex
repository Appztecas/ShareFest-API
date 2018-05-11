defmodule SharefestApiWeb.EventView do
  use SharefestApiWeb, :view
  alias SharefestApiWeb.EventView

  def render("index.json", %{events: events}) do
    %{
      success: "true",
      data: render_many(events, EventView, "event.json"),
      errors: nil
    }
  end

  def render("show.json", %{event: event}) do
    %{
      success: "true",
      data: render_one(event, EventView, "event.json"),
      errors: nil
    }
  end

  def render("event.json", %{event: event}) do
    %{id: event.id,
      name: event.name,
      description: event.description,
      start_date: event.start_date,
      address: event.address,
      latitude: event.latitude,
      longitude: event.longitude,
      invitation_uri: event.invitation_uri}
  end
end
