defmodule RealTimeWeb.PageChannelTest do
    use RealTimeWeb.ChannelCase
    alias RealTimeWeb.UserSocket

    setup do
        {:ok, socket} = connect(UserSocket, %{})
        {:ok, socket: socket}
    end

    test "send welcome message when join topic successfully", %{socket: socket} do
        {:ok, _, _socket} = subscribe_and_join(socket, "PAGE", %{})

        assert_broadcast "WELCOME", %{data: _}
    end

end