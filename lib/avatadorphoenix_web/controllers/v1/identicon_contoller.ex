defmodule AvatadorPhoenixWeb.V1.IdenticonController do
  use AvatadorPhoenixWeb, :controller
  alias Avatador

  require Logger

  def svg(conn, params) do
    assigns = %{
      format: "SVG",
      background: params["background"],
      color: params["color"],
      name: params["name"],
      rounded: params["rounded"],
      is_rounded: params["is_rounded"],
      width: params["width"],
      height: params["height"]
    }

    svg = Avatador.identicon(assigns)

    conn
    |> put_resp_content_type("image/svg+xml")
    |> send_resp(200, svg)
  end

  def png(conn, params) do
    assigns = %{
      format: "PNG",
      background: params["background"],
      color: params["color"],
      name: params["name"],
      width: params["width"],
      height: params["height"],
    }

    base64_png = Avatador.identicon(assigns)
    {:ok, png} = Base.decode64(base64_png)

    conn
    |> put_resp_content_type("image/png")
    |> send_resp(200, png)
  end
end
