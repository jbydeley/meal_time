defmodule MealTimeWeb.Router do
  use MealTimeWeb, :router

  pipeline :auth do
    plug MealTime.Auth.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MealTimeWeb do
    pipe_through [:browser, :auth]

    get "/", PageController, :index
    get "/login", SessionController, :new
    post "/login", SessionController, :login
    get "/logout", SessionController, :logout
    get "/signup", UserController, :new
    post "/signup", UserController, :create
  end

  scope "/", MealTimeWeb do
    pipe_through [:browser, :auth, :ensure_auth]

    resources "/meals", MealController,
      only: [:index, :new, :update, :edit, :create, :show, :delete]

    get "/secret", PageController, :secret
  end

  # Other scopes may use custom stacks.
  # scope "/api", MealTimeWeb do
  #   pipe_through :api
  # end
end
