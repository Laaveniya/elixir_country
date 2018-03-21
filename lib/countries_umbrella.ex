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
    |> CSV.decode(headers: ["name", "alpha-2", "alpha-3", "country-code", "iso_3166-2", "region","sub-region", "region-code", "sub-regi	on-code"])
    |> Enum.to_list
    |>Enum.each(fn country ->
      name = elem(country, 1)["name"]
      if name == country_name do
	      IO.inspect elem(country, 1)["country-code"]
      end
    end)
  end

  def list_countries(region) do
    File.stream!("../countries.csv")
    |> CSV.decode(headers: ["name", "alpha-2", "alpha-3", "country-code", "iso_3166-2", "region","sub-region", "region-code", "sub-regi on-code"])
    |> Enum.to_list
    |> Enum.each(fn country ->
    region_name = elem(country, 1)["region"]
      if region_name == region do
        IO.inspect elem(country, 1)["name"]
      end
    end)
  end

  def frequency(word) do
    tuple = File.read("../countries.csv")
    list = String.split(elem(tuple, 1), [",", "\n", " "])
    Enum.filter(list, fn(country) -> country == word end)
    |> Enum.count
  end
end
