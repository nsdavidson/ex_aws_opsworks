defmodule ExAws.Opsworks do
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



  defp request(action, data, opts \\ %{}) do
    operation =
      action
      |> Atom.to_string
      |> Macro.camelize

    ExAws.Operation.JSON.new(:opsworks, %{
      data: data,
      headers: [
        {"x-amz-target", "#{@namespace}.#{operation}"},
        {"content-type", "application/x-amz-json-1.1"}
      ],
    } |> Map.merge(opts))
  end
end
