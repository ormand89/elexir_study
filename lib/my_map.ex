defmodule MyMap do
  require Logger

  def solve do
    :erlang.garbage_collect
    begin_time = :os.system_time(:millisecond)
    finish_memory = calculate_iterator
    end_time = :os.system_time(:millisecond)
    Logger.warn "#{end_time - begin_time}, memory=#{finish_memory / 1024 / 1024}"
  end

  defp calculate_iterator do
    begin_memory = :erlang.memory(:total)
    list = Enum.to_list(1..50_000_000)
    map_fun = fn(i) -> i + 1 end
    my_map(list, map_fun)
    finish_memory = :erlang.memory(:total)
    finish_memory - begin_memory
  end


  def my_map([], _func), do: []

  def my_map([head | tail], func) do
    [func.(head) | my_map(tail, func)]
  end
end
