defmodule Issue1969Web.PageController do
  use Issue1969Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
