defmodule BirdCount do
  @busy_day_threshold 5

  def today([]), do: nil
  def today([today | _]), do: today

  def increment_day_count([]), do: [1]
  def increment_day_count([today | rest]), do: [today + 1 | rest]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | rest]), do: has_day_without_birds?(rest)

  def total([]), do: 0
  def total([head | rest]), do: head + total(rest)

  def busy_days([]), do: 0
  def busy_days([head | rest]) when head >= @busy_day_threshold, do: 1 + busy_days(rest)
  def busy_days([_ | rest]), do: busy_days(rest)
end
