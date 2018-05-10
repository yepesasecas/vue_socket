defmodule VueSocketWeb.DraggableChannel do
  require Logger
  use VueSocketWeb, :channel

  def join("draggable:*", params, socket) do
    {:ok, socket}
  end

  def handle_in("dragDiv", params, socket) do
    broadcast! socket, "dragDiv", params
    {:reply, :ok, socket}
  end
end
