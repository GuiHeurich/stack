defmodule Stack do

  @server Stack.Server

  def start_link(current_stack) do
    GenServer.start_link(@server, current_stack, name: @server)
  end

  def pop do
    GenServer.call @server, :pop
  end

  def push(value) do
    GenServer.cast @server, {:push, value}
  end

end
