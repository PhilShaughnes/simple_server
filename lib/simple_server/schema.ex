defmodule SimpleServer.Schema do
  use Absinthe.Schema
  use ApolloTracing

  import SimpleServer.Schema.Resolvers

  import_types(SimpleServer.Schema.Types)

  query do
    field :item, :item do
      arg(:id, non_null(:id))
      resolve(&(get_item/2))
    end

    field :items, list_of(:item) do
      resolve(&(get_all_items/2))
    end
  end
end
