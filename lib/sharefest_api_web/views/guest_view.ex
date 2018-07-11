defmodule SharefestApiWeb.GuestView do
  use SharefestApiWeb, :view
  alias SharefestApiWeb.GuestView

  def render("index.json", %{guests: guests}) do
    %{data: render_many(guests, GuestView, "guest.json")}
  end

  def render("show.json", %{guest: guest}) do
    %{data: render_one(guest, GuestView, "guest.json")}
  end

  def render("guest.json", %{guest: guest}) do
    %{id: guest.id,
      email: guest.email,
      phone: guest.phone,
      status: guest.status}
  end
end
