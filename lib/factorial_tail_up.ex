defmodule FactorialTailUp do
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
    factorial(150_000)
    finish_memory = :erlang.memory(:total)
    finish_memory - begin_memory
  end

  defp factorial(n) do
    factorial(1, n, 1)
  end

  defp factorial(current, n, result) when current <= n do
    new_result = result * current
    factorial(current + 1, n, new_result)
  end

  defp factorial(_current, _n, result) do
    result
  end
end
