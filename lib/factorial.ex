defmodule Factorial do
  require Logger

  defp log_this do
    stacktrace = Process.info(self(), :current_stacktrace) |> elem(1)
    Logger.warn "IMEDIATE CALLER: #{stacktrace |> Enum.at(2) |> Exception.format_stacktrace_entry}"
  end

  def solve do
    :erlang.garbage_collect
    begin_time = :os.system_time(:millisecond)
    finish_memory = calculate_factorial
    end_time = :os.system_time(:millisecond)
    finish_memory = :erlang.memory(:total)
    Logger.warn "#{end_time - begin_time}, memory=#{finish_memory / 1024 / 1024}"
  end

  defp calculate_factorial do
    begin_memory = :erlang.memory(:total)
    factorial(100_000)
    finish_memory = :erlang.memory(:total)
    finish_memory - begin_memory
  end

  defp factorial(n \\ 1)

  defp factorial(n) when n >= 1 do
    result = n * factorial(n - 1)
  end

  defp factorial(n), do: 1
end
