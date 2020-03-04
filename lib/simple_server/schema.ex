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

      resolve(fn %{id: item_id}, _ ->
        {:ok, @items[item_id]}
      end)
    end
  end
end
