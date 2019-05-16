defmodule ElixirPlugEchoTest do
  use ExUnit.Case
  doctest ElixirPlugEcho

  test "greets the world" do
    assert ElixirPlugEcho.hello() == :world
  end
end
