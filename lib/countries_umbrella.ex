defmodule Country do
  @moduledoc """
  Documentation for Country.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Country.hello
      :world

  """
  def hello do
    :world
  end

  def country_code(country_name) do
    File.stream!("../countries.csv")
    |> CSV.decode(
      headers: [
        "name",
        "alpha-2",
        "alpha-3",
        "country-code",
        "iso_3166-2",
        "region",
        "sub-region",
        "region-code",
        "sub-regi	on-code"
      ]
    )
    |> Enum.to_list()
    |> Enum.each(fn country ->
      name = elem(country, 1)["name"]

      if name == country_name do
        IO.inspect(elem(country, 1)["country-code"])
      end
    end)
  end

  def list_countries(region) do
    File.stream!("../countries.csv")
    |> CSV.decode(
      headers: [
        "name",
        "alpha-2",
        "alpha-3",
        "country-code",
        "iso_3166-2",
        "region",
        "sub-region",
        "region-code",
        "sub-regi on-code"
      ]
    )
    |> Enum.to_list()
    |> Enum.each(fn country ->
      region_name = elem(country, 1)["region"]

      if region_name == region do
        IO.inspect(elem(country, 1)["name"])
      end
    end)
  end

  def frequency(word) do
    {:ok, contents} = File.read("countries.csv")

    String.split(contents, [",", "\n", " "])
    |> Enum.filter(&(&1 == word))
    |> Enum.count()
  end

  def fibonacci_series(number) do
    case number do
      ^number = 0 -> 0
      ^number = 1 -> 1
      _ -> fibonacci_series(number - 1) + fibonacci_series(number - 2)
    end
  end

  def get_contents do
    {:ok, contents} = File.read("countries.csv")
    String.split(contents, [",", "\n", " "])
  end

  def recursive_frequency(word, [], accumulator) do
    accumulator
  end

  def recursive_frequency(word, contents, accumulator) do
    [head | tail] = contents

    case word do
      ^head = ^word -> recursive_frequency(word, tail, accumulator + 1)
      _ -> recursive_frequency(word, tail, accumulator)
    end
  end
end
