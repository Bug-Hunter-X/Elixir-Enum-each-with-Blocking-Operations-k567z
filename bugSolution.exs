```elixir
list = [1, 2, 3, 4, 5]

Enum.each(list, fn x ->
  Task.async(fn ->
    if x == 3 do
      Process.sleep(1000) # Simulate a long-running operation
    end
    x
  end)
  |> Task.await # Wait for the result
  |> IO.puts
end)
```