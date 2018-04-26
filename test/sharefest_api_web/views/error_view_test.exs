defmodule SharefestApiWeb.ErrorViewTest do
  use SharefestApiWeb.ConnCase, async: true

  alias SharefestApiWeb.ErrorView

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 400.json" do
    assert render(ErrorView, "400.json", []) == %{
      success: "false",
      data: nil,
      errors: ["Bad request"]
    }
  end

  test "renders 404.json" do
    assert render(ErrorView, "404.json", []) == %{
      success: "false",
      data: nil,
      errors: ["Record not found"]
    }
  end

  test "render 500.json" do
    assert render(ErrorView, "500.json", []) == %{
      success: "false",
      data: nil,
      errors: ["Internal server error"]
    }
  end

end
