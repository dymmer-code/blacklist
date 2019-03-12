defmodule Blacklist.MixProject do
  use Mix.Project

  def project do
    [
      app: :blacklist,
      version: "0.1.0",
      name: "Blacklist",
      description: "Blacklist check with Akismet API implementation using Tesla",
      package: package(),
      source_url: "https://github.com/altenwald/blacklist",
      elixir: "~> 1.7",
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
      {:jason, ">= 1.0.0"},
      {:tesla, "~> 1.1.0"},

      {:ex_doc, "~> 0.19.0", only: :dev},
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "mix.lock", "README*", "COPYING*"],
      maintainers: ["Manuel Rubio"],
      licenses: ["LGPL 2.1"],
      links: %{"GitHub" => "https://github.com/altenwald/blacklist"},
    ]
  end
end
