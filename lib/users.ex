defmodule Users do
  alias Helpers.Format

  def new("Ken", age) do
    %{name: "Ken", age: age, is_cool: true, can_drink: true}
  end

  def new(name, age) when age >= 18 do
    formatted_name = Format.trim_text(name)
    %{name: formatted_name, age: age, is_cool: false, can_drink: true}
  end

  def new(name, age) do
    formatted_name = Format.trim_text(name)
    %{name: formatted_name, age: age, is_cool: false, can_drink: false}
  end

  def new, do: generate_default_user()

  defp generate_default_user do
    %{name: "Default User", age: 30, is_cool: false, can_drink: false}
  end
end
