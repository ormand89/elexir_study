defmodule MapTail do
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

  def my_map(list, function) do
    Enum.reverse my_map([], list, function)
  end

  defp my_map(acc, [head | tail], function) do
    my_map([function.(head) | acc], tail, function)
  end

  defp my_map(acc, [], _function) do
    acc
  end
end
