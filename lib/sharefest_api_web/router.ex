defmodule SharefestApiWeb.Router do
  use SharefestApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/v1", SharefestApiWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]

    # Services related to Authentication
    post "/sign_in", AuthController, :sign_in
    post "/sign_out", AuthController, :sign_out

  end
end
