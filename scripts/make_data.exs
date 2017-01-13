Faker.start

num_records = 10_000

headers = ~w(first_name last_name company)
data =
  1..num_records
  |> Enum.map( fn(_) ->
    [Faker.Name.first_name, Faker.Name.last_name, Faker.Company.name]
  end)

{:ok, file} = File.open("simple_data.csv", [:write])

[headers | data]
|> CSV.encode
|> Enum.each(&IO.write(file, &1))

:ok = File.close(file)