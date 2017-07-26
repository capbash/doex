defmodule Doex.Mixfile do
  use Mix.Project

  @app :doex
  @git_url "https://github.com/capbash/doex"
  @home_url @git_url
  @version "0.2.2"

  @deps [
    {:mix_test_watch, "~> 0.3", only: :dev, runtime: false},
    {:poison, "~> 3.1.0"},
    {:httpoison, "~> 0.11.1"},
    {:fn_expr, "~> 0.1.0"},
    {:version_tasks, "~> 0.9.1"},
    {:ex_doc, ">= 0.0.0", only: :dev},
  ]

  @aliases [
  ]

  @package [
    name: @app,
    files: ["lib", "mix.exs", "README*", "LICENSE*"],
    maintainers: ["Andrew Forward"],
    licenses: ["MIT"],
    links: %{"GitHub" => @git_url}
  ]

  # ------------------------------------------------------------

  def project do
    [
      app:     @app,
      version: @version,
      elixir:  "~> 1.4",
      name: @app,
      description: "A Digital Ocean API v2 client for Elixir (yes, another one)",
      package: @package,
      source_url: @git_url,
      homepage_url: @home_url,
      docs: [main: "Doex",
             extras: ["README.md"]],
      build_embedded: true,
      start_permanent: true,
      deps:    @deps,
      aliases: @aliases,
    ]
  end

  def application do
    [
      mod: { Doex.Application, [] },
      extra_applications: [
        :logger
      ],
    ]
  end

end
