defmodule KitchenCalculator do
  def get_volume({_, numeric}), do: numeric

  def to_milliliter({:milliliter, numeric}), do: {:milliliter, numeric}
  def to_milliliter({:cup, numeric}), do: {:milliliter, numeric * 240}
  def to_milliliter({:fluid_ounce, numeric}), do: {:milliliter, numeric * 30}
  def to_milliliter({:teaspoon, numeric}), do: {:milliliter, numeric * 5}
  def to_milliliter({:tablespoon, numeric}), do: {:milliliter, numeric * 15}
  def to_milliliter(volume_pair), do: volume_pair

  def from_milliliter({_, num}, :cup), do: {:cup, num / 240}
  def from_milliliter({_, num}, :fluid_ounce), do: {:fluid_ounce, num / 30}
  def from_milliliter({_, num}, :teaspoon), do: {:teaspoon, num / 5}
  def from_milliliter({_, num}, :tablespoon), do: {:tablespoon, num / 15}
  def from_milliliter(volume_pair, :milliliter), do: volume_pair

  def convert(volume_pair, unit) do
    volume_pair |> to_milliliter |> from_milliliter(unit)
  end
end
