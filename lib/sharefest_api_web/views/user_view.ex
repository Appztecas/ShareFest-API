defmodule SharefestApiWeb.UserView do
  use SharefestApiWeb, :view
  alias SharefestApiWeb.UserView

  def render("index.json", %{user: user}) do
    %{
      success: "true",
      data: render_many(user, UserView, "user.json"),
      errors: nil
    }
  end

  def render("show.json", %{user: user}) do
    %{
      success: "true",
      data: render_one(user, UserView, "user.json"),
      errors: nil
    }
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      lastname: user.lastname,
      phone: user.phone,
      email: user.email,
      device_token: user.device_token,
      facebook_id: user.facebook_id,
      facebook_token: user.facebook_token,
      amazon_id: user.amazon_id,
      amazon_token: user.amazon_token,
      receive_notifications: user.receive_notifications}
  end
end
