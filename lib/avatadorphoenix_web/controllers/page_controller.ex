defmodule AvatadorPhoenixWeb.PageController do
  use AvatadorPhoenixWeb, :controller

  def index(conn, _params) do
    example_names = ["James Smith","Michael Smith","Robert Smith","Maria Garcia","David Smith","Maria Rodriguez","Mary Smith","Maria Hernandez","Maria Martinez","James Johnson","James Smith","Michael Smith","Robert Smith","Maria Garcia","David Smith","Maria Rodriguez","Mary Smith","Maria Hernandez","Maria Martinez","James Johnson"]

    avatar_list = Enum.map(example_names, fn name->
      Avatador.avatar(%{name: name, width: 50})
    end)

    identicon_list = Enum.map(example_names, fn name->
      Avatador.identicon(%{name: name, width: 50})
    end)

    render(conn, "index.html", data: %{avatar_list: avatar_list, identicon_list: identicon_list})
  end

  def speed(conn, _params) do
    render(conn, "speed.html")
  end
end
