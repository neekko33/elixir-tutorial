defmodule Games do
  def get do
    %{name: "Diablo 4", in_stock: true, price: 20}
  end

  def get_all do
    [
      %{name: "Diablo 4", in_stock: true, price: 20},
      %{name: "Starfield", in_stock: false, price: 60},
      %{name: "Cyberpunk 2077", in_stock: false, price: 30},
      %{name: "Hogwarts Legacy", in_stock: true, price: 50}
    ]
  end

  def filter_games(game_list) do
    Enum.filter(game_list, &filter_handler/1)
  end

  defp filter_handler(game) do
    game.in_stock and game.price <= 50
  end

  def print_list(game_list) do
    Enum.map(
      game_list,
      &"#{&1.name} is #{if &1.in_stock, do: "In stock!", else: "Not available 😭"}, price: $#{&1.price}"
    )
  end

  def print(game) do
    Enum.each(game, fn {key, value} -> IO.puts("#{key}: #{value}") end)
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
