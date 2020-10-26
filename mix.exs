defmodule Blacklist.MixProject do
  use Mix.Project

  @source_url "https://github.com/altenwald/blacklist"

  def project do
    [
      app: :blacklist,
      version: "0.2.0",
      name: "Blacklist",
      description: "Blacklist check with Akismet API implemented using Tesla",
      package: package(),
      elixir: "~> 1.7",
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:jason, "~> 1.2"},
      {:tesla, "~> 1.3"},
      {:ex_doc, "~> 0.23", only: :dev}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "mix.lock", "README*", "COPYING*"],
      maintainers: ["Manuel Rubio"],
      licenses: ["LGPL 2.1"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      extras: [
        "README.md"
      ]
    ]
  end
end
