defmodule Games do
  def get do
    %{name: "Diablo 4", in_stock: true, price: 100}
  end

  def validate_purchase(game) do
    if(!game.in_stock) do
      {:error, "Game not available for purchase"}
    else
      if game.price > 50 do
        {:error, "Too expensive to buy"}
      else
        {:ok, "Game purchased successfully"}
      end
    end
  end
end
