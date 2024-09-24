defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    days_to_add = additional_days(before_noon?(checkout_datetime))

    NaiveDateTime.to_date(checkout_datetime)
    |> Date.add(days_to_add)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    return_d = NaiveDateTime.to_date(actual_return_datetime)

    if Date.before?(return_d, planned_return_date) do
      0
    else
      Date.diff(return_d, planned_return_date)
    end
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    return_datetime = datetime_from_string(return)
    checkout_datetime = datetime_from_string(checkout)
    scheduled_return_date = return_date(checkout_datetime)

    days_late = days_late(scheduled_return_date, return_datetime)
    fee = rate * days_late

    if monday?(return_datetime) do
      div(fee, 2)
    else
      fee
    end
  end

  defp additional_days(before_noon) when before_noon == true do
    28
  end

  defp additional_days(before_noon) when before_noon == false do
    29
  end
end
