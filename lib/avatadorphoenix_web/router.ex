defmodule AvatadorPhoenixWeb.Router do
  use AvatadorPhoenixWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {AvatadorPhoenixWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["html"]
    plug :put_layout, false
    plug :put_root_layout, false
  end

  scope "/", AvatadorPhoenixWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/speed", PageController, :speed
  end


  # todo add header info
  scope "/", AvatadorPhoenixWeb do
    pipe_through :api

    # Versioning:
    # Most recent version gets called from "/"
    # Safe old versions in separate scope
    scope "/av" do
      get "/", V1.AvatarController, :svg
      get "/svg", V1.AvatarController, :svg
    end

    scope "/id" do
      get "/", V1.IdenticonController, :svg
      get "/svg", V1.IdenticonController, :svg
      get "/png", V1.IdenticonController, :png
    end
  end

  scope "/v1", AvatadorPhoenixWeb do
    pipe_through :api

    get "/", V1.AvatarController, :svg

    scope "/av" do
      get "/", V1.AvatarController, :svg
      get "/svg", V1.AvatarController, :svg
    end

    scope "/id" do
      get "/", V1.IdenticonController, :svg
      get "/svg", V1.IdenticonController, :svg
      get "/png", V1.IdenticonController, :png
    end
  end
end
