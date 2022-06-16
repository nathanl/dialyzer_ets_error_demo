defmodule DialyzerEtsError.MixProject do
  use Mix.Project

  def project do
    [
      app: :dialyzer_ets_error,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer()

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
      {:dialyxir, "~> 1.1.0", only: [:dev, :test], runtime: false},
    ]
  end

  defp dialyzer do
    [
      # ignore_warnings: ".dialyzer_ignore.exs",
      # list_unused_filters: true,
      # plt_add_apps: [:ex_unit, :mix]
    ]
  end
end
