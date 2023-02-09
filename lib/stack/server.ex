defmodule Stack.Server do
  use GenServer

  def init(initial_stack) do
    {:ok, initial_stack}
  end

  def handle_call(:pop, _from, current_stack) do
    [ head | tail ] = Tuple.to_list(List.pop_at(current_stack, 0))
    {:reply, head, List.flatten(tail)}
  end

  def handle_cast({:push, value}, current_stack) do
    {
      :noreply,
      List.insert_at(current_stack, -1, value)
    }
  end
end
