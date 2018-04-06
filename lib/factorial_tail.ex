defmodule FactorialTail do
  require Logger

  def solve do
    :erlang.garbage_collect
    begin_time = :os.system_time(:millisecond)
    finish_memory = calculate_factorial
    end_time = :os.system_time(:millisecond)
    Logger.warn "#{end_time - begin_time}, memory=#{finish_memory / 1024 / 1024}"
  end

  defp calculate_factorial do
    begin_memory = :erlang.memory(:total)
    factorial(100_000)
    finish_memory = :erlang.memory(:total)
    finish_memory - begin_memory
  end

  defp factorial(num, acc \\ 1)

  defp factorial(0, acc) do
    acc
  end

  defp factorial(num, acc) do
    result = factorial(num - 1, acc * num)
  end
end
