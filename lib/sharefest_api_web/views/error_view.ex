defmodule SharefestApiWeb.ErrorView do
  use SharefestApiWeb, :view

  def render("400.json", _assigns) do
    %{
      success: "false",
      data: nil,
      errors: ["Bad request"]
    }
  end

  def render("401.json", _assigns) do
    %{
      success: "false",
      errors: ["Unauthorized"],
    }
  end

  def render("404.json", _assigns) do
    %{
      success: "false",
      data: nil,
      errors: ["Record not found"]
    }
  end

  def render("500.json", _assigns) do
    %{
      success: "false",
      data: nil,
      errors: ["Internal server error"]
    }
  end

  def render("error.json", %{message: message}) when is_binary(message) do
    %{
      status: "error",
      data: nil,
      errors: [message]
    }
  end

  def render("error.json", %{message: message}) do
    message
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.json", assigns
  end

end
