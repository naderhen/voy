defmodule Voy.Router do
  use Voy.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Voy do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Voy do
  #   pipe_through :api
  # end
end
