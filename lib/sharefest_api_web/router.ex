defmodule SharefestApiWeb.Router do
  use SharefestApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_auth do
    plug Guardian.Plug.Pipeline, module: SharefestApi.Authenticator,
      error_handler: SharefestApiWeb.AuthErrorHandler
    plug Guardian.Plug.VerifySession
  end

  scope "/v1", SharefestApiWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]

    # Services related to Authentication
    post "/sign_in", AuthController, :sign_in
    post "/sign_out", AuthController, :sign_out
    resources "/business_activities", BusinessActivityController, except: [:new, :edit]
  end

  scope "/v1", SharefestApiWeb do
    pipe_through [:api, :api_auth]
    # pipe_through :api

    resources "/events", EventController, except: [:new, :edit] do
      resources "/guests", GuestController, except: [:new, :edit]
    end
    resources "/experiences", ExperienceController, except: [:new, :edit] do
      resources "/products", ExperienceProductController, except: [:new, :edit]
    end
    resources "/suppliers", SupplierController, except: [:new, :edit]
  end

end
