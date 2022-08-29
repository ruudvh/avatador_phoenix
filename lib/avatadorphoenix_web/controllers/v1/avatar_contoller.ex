defmodule AvatadorPhoenixWeb.V1.AvatarController do
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
      height: params["height"],
      font_size: params["font_size"],
      font_family: params["font_family"],
      caps: params["caps"],
      bold: params["bold"]
    }

    svg = Avatador.avatar(assigns)

    conn
    |> put_resp_content_type("image/svg+xml")
    |> send_resp(200, svg)
  end
end
