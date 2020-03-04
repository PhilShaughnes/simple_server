defmodule SimpleServer.Schema.Resolvers do

  @items %{
    "hello" => %{id: "hello", name: "world"},
    "bye" => %{id: "bye", name: "forever"}
  }

  get_item(%{id: item_id}, _info) do
    {:ok, @items[item_id]}
  end

  get_all_items(_args, _info) do
    {:ok, Enum.map(@items, fn {_id, item} -> item end)}
  end
end
