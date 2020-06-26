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

  test "#describe_instances with instance_ids" do
    expected = %{
      "InstanceIds" => ["abc123"]
    }

    assert Opsworks.describe_instances(instance_ids: ["abc123"]).data == expected
  end

  test "#describe_instances with layer_id" do
    expected = %{
      "LayerId" => "abc123"
    }

    assert Opsworks.describe_instances(layer_id: "abc123").data == expected
  end

  test "#describe_instances with stack_id" do
    expected = %{
      "StackId" => "abc123"
    }

    assert Opsworks.describe_instances(stack_id: "abc123").data == expected
  end
end
