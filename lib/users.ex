defmodule Users do
  @enforce_keys [:name]
  defstruct [:name, :age, :is_cool, :can_drink]

  import Helpers.Format

  def check(%Users{} = _user), do: true
  def check(_user), do: false

  def new("Ken", age) do
    %Users{name: "Ken", age: age, is_cool: true, can_drink: true}
  end

  def new(name, age) when age >= 18 do
    formatted_name = trim_text(name)
    %Users{name: formatted_name, age: age, is_cool: false, can_drink: true}
  end

  def new(name, age) do
    formatted_name = trim_text(name)
    %Users{name: formatted_name, age: age, is_cool: false, can_drink: false}
  end

  def new, do: generate_default_user()

  defp generate_default_user do
    %Users{name: "Default User", age: 30, is_cool: false, can_drink: false}
  end
end
