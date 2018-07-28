defmodule SharefestApiWeb.GuestView do
  use SharefestApiWeb, :view
  alias SharefestApiWeb.GuestView

  def render("index.json", %{guests: guests}) do
    %{
      success: "true",
      data: render_many(guests, GuestView, "guest.json"),
      errors: nil
    }
  end

  def render("show.json", %{guest: guest}) do
    %{
      success: "true",
      data: render_one(guest, GuestView, "guest.json"),
      errors: nil
    }
  end

  def render("guest.json", %{guest: guest}) do
    %{id: guest.id,
      email: guest.email,
      phone: guest.phone,
      status: guest.status}
  end
end
