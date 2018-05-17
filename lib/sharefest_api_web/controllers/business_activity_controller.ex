defmodule SharefestApiWeb.BusinessActivityController do
  use SharefestApiWeb, :controller

  alias SharefestApi.People.BusinessActivity
  alias SharefestApi.People.BusinessActivities

  action_fallback(SharefestApiWeb.FallbackController)

  def index(conn, _params) do
    business_activities = BusinessActivities.list_business_activities()
    render(conn, "index.json", business_activities: business_activities)
  end

  def create(conn, %{"business_activity" => business_activity_params}) do
    with {:ok, %BusinessActivity{} = business_activity} <-
           BusinessActivities.create_business_activity(business_activity_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", business_activity_path(conn, :show, business_activity))
      |> render("show.json", business_activity: business_activity)
    end
  end

  def show(conn, %{"id" => id}) do
    business_activity = BusinessActivities.get_business_activity!(id)
    render(conn, "show.json", business_activity: business_activity)
  end

  def update(conn, %{"id" => id, "business_activity" => business_activity_params}) do
    business_activity = BusinessActivities.get_business_activity!(id)

    with {:ok, %BusinessActivity{} = business_activity} <-
           BusinessActivities.update_business_activity(
             business_activity,
             business_activity_params
           ) do
      render(conn, "show.json", business_activity: business_activity)
    end
  end

end
