defmodule Stack.Impl do

  def pop(current_stack),         do: Tuple.to_list(List.pop_at(current_stack, 0))
  def push(current_stack, value), do: List.insert_at(current_stack, -1, value)
end
