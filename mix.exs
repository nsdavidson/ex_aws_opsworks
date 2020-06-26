defmodule ExAws.Opsworks.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_aws_opsworks,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:ex_aws, "~> 2.0"},
      {:jason, "~> 1.2"},
      {:hackney, ">= 0.0.0", only: [:dev, :test]}
    ]
  end
end
