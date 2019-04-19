defmodule RealTimeWeb.PageControllerTest do
  use RealTimeWeb.ConnCase

  setup do
    RealTimeWeb.Endpoint.subscribe("PAGE")
  end

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert_receive %Phoenix.Socket.Broadcast{event: "WELCOME", topic: "PAGE", payload: %{data: _}}
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
