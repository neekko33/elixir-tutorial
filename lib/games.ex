defmodule Games do
  def get do
    %{name: "Diablo 4", in_stock: true, price: 20}
  end

  def get_all do
    [
      %{name: "Diablo 4", in_stock: true, price: 20},
      %{name: "Starfield", in_stock: false, price: 60},
      %{name: "Cyberpunk 2077", in_stock: true, price: 30},
      %{name: "Hogwarts Legacy", in_stock: true, price: 50}
    ]
  end

  def count([]), do: 0

  def count([_ | tail]) do
    1 + count(tail)
  end

  def total([]), do: 0

  def total([head | tail]) do
    head.price + total(tail)
  end

  def purchase(game) do
    case validate_purchase(game) do
      {:error, reason} -> "Error: #{reason}"
      {:ok, _} -> "Successful purchase!"
    end
  end

  defp validate_purchase(game) do
    cond do
      !game.in_stock ->
        {:error, "Game not available for purchase"}

      game.price > 50 ->
        {:error, "Too expensive to buy"}

      true ->
        {:ok, "Game purchased successfully"}
    end
  end
end
