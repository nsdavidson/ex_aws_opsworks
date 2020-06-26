defmodule ExAws.OpsworksTest do
  use ExUnit.Case
  doctest ExAws.Opsworks

  test "greets the world" do
    assert ExAws.Opsworks.hello() == :world
  end
end
