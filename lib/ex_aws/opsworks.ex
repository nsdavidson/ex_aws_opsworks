defmodule ExAws.Opsworks do
  @moduledoc """
  Operations on AWS Opsworks Stacks
  """

  alias ExAws.Operation

  @namespace "OpsWorks_20130218"

  def describe_stacks do
    request(:describe_stacks, %{})
  end

  def describe_stacks(stack_id) when is_binary(stack_id) do
    describe_stacks([stack_id])
  end

  def describe_stacks(stack_ids) when is_list(stack_ids) do
    data = %{"StackIds" => stack_ids}
    request(:describe_stacks, data)
  end

  @type describe_instances_opts :: [
          instance_ids: list(binary),
          layer_id: binary,
          stack_id: binary
        ]

  @spec describe_instances(opts :: describe_instances_opts) :: Operation.JSON.t()
  def describe_instances(opts) when is_list(opts) do
    data = keywords_to_data(opts)
    request(:describe_instances, data)
  end

  defp keywords_to_data(keywords) when is_list(keywords) do
    keywords
    |> Enum.into(%{}, fn {k, v} -> {k |> Atom.to_string() |> Macro.camelize(), v} end)
  end

  defp request(action, data, opts \\ %{}) do
    operation =
      action
      |> Atom.to_string()
      |> Macro.camelize()

    Operation.JSON.new(
      :opsworks,
      %{
        data: data,
        headers: [
          {"x-amz-target", "#{@namespace}.#{operation}"},
          {"content-type", "application/x-amz-json-1.1"}
        ]
      }
      |> Map.merge(opts)
    )
  end
end
