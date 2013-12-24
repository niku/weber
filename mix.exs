defmodule Weber.Mixfile do
  use Mix.Project

  def project do
    [ app: :weber,
      version: "0.0.4",
      name: "Weber",
      deps: deps(Mix.env), 
      source_url: "https://github.com/0xAX/weber",
      homepage_url: "http://0xax.github.io/weber/index.html"
    ]
  end

  def application do
    [
      description: 'weber - is Elixir MVC web framework.',
      registered: [:weber],
      mod: { Weber, [] },
      lager: [
        {:handlers, [
          {:lager_console_backend, :info},
          {:lager_file_backend, [{:file, "error.log"}, {:level, :error}]},
          {:lager_file_backend, [{:file, "console.log"}, {:level, :info}]},
        ]}
      ]
    ]
  end

  defp deps(:prod) do
    [
      {:cowboy, github: "extend/cowboy" },
      {:postgrex, "~> 0.3.0", [git: "git://github.com/ericmj/postgrex.git", optional: true]},
      {:ecto, github: "elixir-lang/ecto"},
      {:exjson, github: "guedes/exjson"},
      {:plug, github: "elixir-lang/plug"},
      {:exlager, github: "khia/exlager"}
    ]
  end

  defp deps(:test) do
    deps(:prod) ++ [{ :hackney, github: "benoitc/hackney" }]
  end
  
  defp deps(_) do
    deps(:prod)
  end
end
