defmodule BinGenerator do
  require Logger

  def solve do
    :erlang.garbage_collect
    begin_time = :os.system_time(:millisecond)
    finish_memory = generate_string
    end_time = :os.system_time(:millisecond)
    Logger.warn "#{end_time - begin_time}, memory=#{finish_memory / 1024 / 1024}"
  end

  defp generate_string do
    begin_memory = :erlang.memory(:total)
    generate(150_000)
    finish_memory = :erlang.memory(:total)
    finish_memory - begin_memory
  end

  defp generate(len \\ 0)

  defp generate(len) when len <= 1, do: ""

  defp generate(len) when len >= 1 do
    Integer.to_string(:random.uniform(2) - 1) <> generate(len - 1)
  end
end
