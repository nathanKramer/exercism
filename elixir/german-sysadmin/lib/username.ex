defmodule Username do

  def sanitize([]), do: []
  def sanitize([head | tail]), do: sanitize_char(head) ++ sanitize(tail)

  defp sanitize_char(char) do
    case char do
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      char when char >= ?a and char <= ?z -> [char]
      ?_ -> ~c"_"
      _ -> ~c""
    end
  end
end
