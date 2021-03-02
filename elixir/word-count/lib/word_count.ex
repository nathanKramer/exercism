defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split([" ", "_"])
    |> Enum.map(&sanitize(&1))
    |> Enum.filter(fn a -> String.length(a) > 0 end)
    |> group_as_map
  end

  defp sanitize(str) do
    str
    |> String.trim()
    |> String.replace(~r/[^-\w]/iu, "")
  end

  defp group_as_map(list_str) do
    list_str
    |> Enum.group_by(fn a -> a end)
    |> Enum.map(fn {k, v} -> {k, length(v)} end)
    |> Enum.into(%{})
  end
end
