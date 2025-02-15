defmodule ZenoIndexingEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :zenos_indexing_ex,
      version: "0.1.0",
      elixir: "~> 1.14",
      licenses: "MIT", 
      source_url: "https://github.com/gdso/zeno_indexing_ex",
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
      {:jason, "~> 1.0", only: [:test]},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  # def aliases do
  #   [
  #     reformat_test_cases: &reformat_test_cases/1
  #   ]
  # end

  # defp reformat_test_cases(_) do
  #   # Mix.Task.run(
  # end
end
