defmodule SimpleServer.Schema do
  use Absinthe.Schema

  import_types(SimpleServer.Schema.Types)

  @items %{
    "hello" => %{id: "hello", name: "world"},
    "bye" => %{id: "bye", name: "forever"}
  }

  query do
    field :item, :item do
      arg(:id, non_null(:id))

      resolve(fn %{id: item_id}, _info ->
        case @items[item_id] do
          nil -> {:error, "no item for id #{item_id} found"}
          item -> {:ok, item}
        end
      end)
    end

    field :items, list_of(:item) do
      resolve(fn args, info ->
        {:ok, Enum.map(@items, fn {_id, item} -> item end)}
      end)
    end
  end
end
