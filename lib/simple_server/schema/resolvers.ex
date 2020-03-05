defmodule SimpleServer.Schema.Resolvers do

  @items %{
    "hello" => %{id: "hello", name: "world"},
    "bye" => %{id: "bye", name: "forever"}
  }

  def get_item(%{id: item_id}, _info) do
    case @items[item_id] do
      nil -> {:error, "no item for id #{item_id} found"}
      item -> {:ok, item}
    end
  end

  def get_all_items(_args, _info) do
    {:ok, Enum.map(@items, fn {_id, item} -> item end)}
  end
end
