defmodule SharefestApiWeb.AuthView do
  use SharefestApiWeb, :view

  def render("authenticated.json", %{user: user, token: token}) do
    %{
      success: "true",
      data: %{
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
        receive_notifications: user.receive_notifications,
        token: token
      },
      errors: nil
    }

  end

  def render("error.json", %{message: message}) when is_binary(message) do
    %{
      status: "error",
      data: nil,
      errors: [message]
    }
  end

end
