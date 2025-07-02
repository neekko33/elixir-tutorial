defmodule Helpers.Format do
  def trim_text(text) do
    String.trim(text)
  end

  def generate_slug(text) do
    text
    |> String.trim()
    |> dbg()
    |> String.downcase()
    |> String.replace(" ", "-")
  end
end
