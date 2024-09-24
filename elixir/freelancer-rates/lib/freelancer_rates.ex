defmodule FreelancerRates do
  @hours_per_day 8.0
  @billable_days_per_month 22.0

  def daily_rate(hourly_rate) do
    @hours_per_day * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * (discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    before_discount = @billable_days_per_month * daily_rate(hourly_rate)
    ceil(apply_discount(before_discount, discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    rate = apply_discount(daily_rate(hourly_rate), discount)

    Float.floor(budget / rate, 1)
  end
end
