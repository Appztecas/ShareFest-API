defmodule SharefestApiWeb.Router do
  use SharefestApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SharefestApiWeb do
    pipe_through :api
  end
end
