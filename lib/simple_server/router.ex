defmodule SimpleServer.Router do
  use Plug.Router

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    pass: ["*/*"],
    json_decoder: Jason
  )

  forward "/gql",
    to: Absinthe.Plug,
    init_opts: [schema: SimpleServer.Schema]


  forward "/graphiql",
    to: Absinthe.Plug.GraphiQL,
    init_opts: [schema: SimpleServer.Schema]

  plug(:match)
  plug(:dispatch)

  get "/ping" do
    # send_resp(conn, 200, Jason.encode!(%{ hello: "world" }))
    send_resp(conn, 200, "hello world")
  end

  get "/json" do
    render_json(conn, %{message: "hello there"})
  end

  match _ do
    send_resp(conn, 404, "you have died of disentary :(")
  end

  defp render_json(%{status: status} = conn, data) do
    body = Jason.encode!(data)
    send_resp(conn, status || 200, body)
  end
end
