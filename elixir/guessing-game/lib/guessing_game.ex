defmodule GuessingGame do
  def compare(_, guess \\ :no_guess)

  def compare(secret_number, guess) when guess == secret_number do
    "Correct"
  end

  def compare(_, :no_guess) do
    "Make a guess"
  end

  def compare(secret_number, guess)
      when abs(guess - secret_number) == 1 do
    "So close"
  end

  def compare(secret_number, guess) when guess > secret_number do
    "Too high"
  end

  def compare(secret_number, guess) when guess < secret_number do
    "Too low"
  end
end
