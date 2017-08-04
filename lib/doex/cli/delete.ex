defmodule Doex.Cli.Delete do
  use FnExpr
  alias Doex.Cli.{Parser, Shell}

  @moduledoc"""
  Execute a Digital Ocean API DELETE request

       doex delete <path> <attributes>

  For example

      doex delete /droplets/12345

  The output will be similar to the following, and it's the IDs you want.

      {:ok, nil}

  """

  def run(raw_args) do
    {:ok, _started} = Application.ensure_all_started(:doex)

    raw_args
    |> Parser.parse()
    |> invoke(fn {body, [endpoint]} -> Doex.Api.delete(endpoint, body) end)
    |> Shell.inspect(raw_args)
  end

end