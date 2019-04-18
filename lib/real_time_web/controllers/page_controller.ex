defmodule RealTimeWeb.PageController do
  use RealTimeWeb, :controller

  def index(conn, _params) do
    RealTimeWeb.Endpoint.broadcast!("PAGE", "WELCOME", %{data: "Welcome to Real Time Page"})
    render(conn, "index.html")
  end
end
