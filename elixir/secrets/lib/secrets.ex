defmodule Secrets do
  def secret_add(n) do
    &(&1 + n)
  end

  def secret_subtract(n) do
    &(&1 - n)
  end

  def secret_multiply(n) do
    &(&1 * n)
  end

  def secret_divide(n) do
    &div(&1, n)
  end

  def secret_and(secret) do
    fn param -> Bitwise.band(param, secret) end
  end

  def secret_xor(secret) do
    fn param -> Bitwise.bxor(param, secret) end
  end

  def secret_combine(fn1, fn2) do
    &(&1
      |> fn1.()
      |> fn2.())
  end
end
