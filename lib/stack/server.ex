defmodule Stack.Server do
  use GenServer
  alias Stack.Impl

  def init(initial_stack) do
    {:ok, initial_stack}
  end

  def handle_call(:pop, _from, current_stack) do
    [ head | tail ] = Impl.pop(current_stack)
    {:reply, head, List.flatten(tail)}
  end

  def handle_cast({:push, value}, current_stack) do
    {
      :noreply,
      Impl.push(current_stack, value)
    }
  end
end
