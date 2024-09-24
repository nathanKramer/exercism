defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    get_bit_size(color_count, 1)
  end

  defp get_bit_size(color_count, count) do
    if Integer.pow(2, count) < color_count do
      get_bit_size(color_count, count + 1)
    else
      count
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0b00::2, 0b01::2, 0b10::2, 0b11::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bit_count = palette_bit_size(color_count)

    <<pixel_color_index::size(bit_count), picture::bitstring>>
  end


  def get_first_pixel(<<>>, _), do: nil
  def get_first_pixel(picture, color_count) do
    bit_count = palette_bit_size(color_count)
    <<value::size(bit_count), _::bitstring>> = <<picture::bitstring>>

    value
  end

  def drop_first_pixel(<<>>, _), do: ""
  def drop_first_pixel(picture, color_count) do
    bit_count = palette_bit_size(color_count)
    <<_::size(bit_count), rest::bitstring>> = <<picture::bitstring>>

    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
