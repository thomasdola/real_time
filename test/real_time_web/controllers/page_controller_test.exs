defmodule RealTimeWeb.PageControllerTest do
  use RealTimeWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert_receive %Phoenix.Socket.Broadcast{event: "WELCOME", topic: "PAGE", payload: %{"data" => _}}
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
