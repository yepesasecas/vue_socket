defmodule VueSocketWeb.PageController do
  use VueSocketWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
