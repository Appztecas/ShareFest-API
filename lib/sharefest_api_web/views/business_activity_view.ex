defmodule SharefestApiWeb.BusinessActivityView do
  use SharefestApiWeb, :view
  alias SharefestApiWeb.BusinessActivityView

  def render("index.json", %{business_activities: business_activities}) do
    %{
      success: "true",
      data: render_many(business_activities, BusinessActivityView, "business_activity.json"),
      errors: nil
    }
  end

  def render("show.json", %{business_activity: business_activity}) do
    %{
      success: "true",
      data: render_one(business_activity, BusinessActivityView, "business_activity.json"),
      errors: nil
    }
  end

  def render("business_activity.json", %{business_activity: business_activity}) do
    %{id: business_activity.id, name: business_activity.name}
  end
end
