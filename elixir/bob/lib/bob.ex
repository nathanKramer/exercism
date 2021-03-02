defmodule Bob do
  def hey(input) do
    input |> String.trim() |> highly_sophisticated_nlp
  end

  defp highly_sophisticated_nlp(input) do
    cond do
      blank?(input) ->
        "Fine. Be that way!"

      question?(input) && yelling?(input) ->
        "Calm down, I know what I'm doing!"

      question?(input) ->
        "Sure."

      yelling?(input) ->
        "Whoa, chill out!"

      true ->
        "Whatever."
    end
  end

  defp alphabetical?(s) do
    String.downcase(s) != String.upcase(s)
  end

  defp blank?(input) do
    String.trim(input) == ""
  end

  defp yelling?(input) do
    yellable = input |> String.split() |> Enum.filter(&alphabetical?(&1))
    Enum.count(yellable) > 0 && Enum.all?(yellable, &all_caps?(&1))
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end

  defp all_caps?(word) do
    String.upcase(word) == word
  end
end
