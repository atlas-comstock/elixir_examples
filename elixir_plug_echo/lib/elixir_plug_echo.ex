defmodule ElixirPlugEcho do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: HelloWorldPlug, options: [port: 9090]}
    ]
    opts = [strategy: :one_for_one, name: ElixirPlugEcho.Supervisor]

    Logger.info("Starting application...")

    Supervisor.start_link(children, opts)
  end
end

defmodule HelloWorldPlug do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello World!\n")
  end
end
