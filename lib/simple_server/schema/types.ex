defmodule SimpleServer.Schema.Types do
  use Absinthe.Schema.Notation

  @desc "An item"
  object :item do
    field(:id, non_null(:id))
    field(:name, :string)
  end
end
