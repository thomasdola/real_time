defmodule RealTimeWeb.PageChannel do
    use RealTimeWeb, :channel

    @topic "PAGE"

    def join(@topic = topic, params, socket), do: _join(params, topic, socket)
    def join(_, _, _), do: {:error, %{reason: "unauthorized"}}

    defp _join(_params, topic, socket) do
        send(self(), {:after_join, topic})
        {:ok, socket}
    end

    def handle_info({:after_join, @topic}, socket) do
        broadcast!(socket, "WELCOME", %{data: "welcome to Real Time Channel"})
        RealTimeWeb.Endpoint.broadcast(@topic, "WELCOME", %{data: "Welcome to Real Time Channel with endpoint"})
        {:noreply, socket}
    end
end