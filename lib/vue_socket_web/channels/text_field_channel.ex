defmodule VueSocketWeb.TextFieldChannel do
  require Logger
  use VueSocketWeb, :channel

  def join("textField:*", params, socket) do
    :timer.send_interval(5_000, :ping)
    {:ok, socket}
  end

  def handle_info(:ping, socket) do
    count = socket.assigns[:count] || 1
    push socket, "ping", %{count: count}
    {:noreply, assign(socket, :count, count + 1)}
  end

  def handle_in("textFieldChangeEvent", params, socket) do
    broadcast! socket, "textFieldChangeEvent", %{
      msg: params["msg"]
    }
    
    {:reply, :ok, socket}
  end
end
