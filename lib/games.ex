defmodule Games do
  def get do
    %{name: "Diablo 4", in_stock: true, price: 20}
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
