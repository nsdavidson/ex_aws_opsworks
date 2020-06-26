defmodule ExAws.OpsworksTest do
  use ExUnit.Case, async: true
  alias ExAws.Opsworks

  test "#describe_stacks for all stacks" do
    expected = %{}

    assert Opsworks.describe_stacks().data == expected
  end

  test "#describe_stacks with one stack id" do
    expected = %{
      "StackIds" => ["abc123"]
    }

    assert Opsworks.describe_stacks("abc123").data == expected
  end

  test "#describe_stacks with list of stack ids" do
    expected = %{
      "StackIds" => ["abc123", "def456"]
    }

    assert Opsworks.describe_stacks(["abc123", "def456"]).data == expected
  end
end
