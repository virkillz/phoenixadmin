defmodule PhoenixadminWeb.PageController do
  use PhoenixadminWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
