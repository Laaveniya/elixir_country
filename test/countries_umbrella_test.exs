defmodule CountryTest do
  use ExUnit.Case
  doctest Country

  test "greets the world" do
    #assert Country.hello() == :oops
    assert Country.hello() == :world
  end

 # test "gives the country code" do
  #  assert Country.country_code("India") == "356"
 # end

  test "gives the frequency of word" do
    assert Country.frequency("Asia") == 102
  end
  
#  test "gives the countries in the region" do
   # countries= ["American Samoa", "Australia", "Cook Islands", "Fiji", "French Polynesia",
    #"Guam", "Kiribati", "Marshall Islands", "Micronesia (Federated States of)",
    #"Nauru", "New Caledonia", "New Zealand", "Niue", "Norfolk Island",
    #"Northern Mariana Islands", "Palau", "Papua New Guinea", "Pitcairn", "Samoa",
    #"Solomon Islands", "Tokelau", "Tonga", "Tuvalu", "Vanuatu",
    #"Wallis and Futuna"]
    #assert Country.list_countries("Oceania") == countries
#  end
  
end
