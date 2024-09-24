defmodule NameBadge do
  def print(id, name, department) do
    d = if department, do: String.upcase(department), else: "OWNER"
    if id do
      "[#{id}] - #{name} - #{d}"
    else
      "#{name} - #{d}"
    end
  end
end
