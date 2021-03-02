defmodule RomanNumerals do
  @numerals %{
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M"
  }

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(pos_integer) do
    @numerals
    |> Map.keys()
    |> Enum.sort(&(&1 >= &2))
    |> Enum.reduce({"", pos_integer}, fn denomination, {roman_numerals, pos_integer} ->
      if pos_integer == 0 || denomination / pos_integer > 1 do
        {roman_numerals, pos_integer}
      else
        {
          roman_numerals <>
            String.duplicate(@numerals[denomination], div(pos_integer, denomination)),
          rem(pos_integer, denomination)
        }
      end
    end)
    |> elem(0)
  end
end
