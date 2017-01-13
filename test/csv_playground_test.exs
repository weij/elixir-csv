defmodule CsvPlaygroundTest do
  use ExUnit.Case
  doctest CsvPlayground

  @file "test/fixtures/simple_data.csv"
  @data File.stream! @file

  test "reading csv as a list" do
    list = 
    @data
    |> CSV.decode
    |> Enum.to_list

    assert hd(list) == ~w(first_name last_name company)
  end

  test "reading csv as a map" do
  	list =
  	  @data
  	  |> CSV.decode(headers: true)
  	  |> Enum.to_list

  	sorted_keys = list |> hd |> Map.keys |> Enum.sort

  	assert sorted_keys == Enum.sort(~w(first_name last_name company))
  end
end
