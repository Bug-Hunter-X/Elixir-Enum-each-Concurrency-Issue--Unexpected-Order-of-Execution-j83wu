```elixir
list = [1, 2, 3, 4, 5]

# Solution using Enum.map and then Enum.each
Enum.map(list, fn x ->
  if x == 3 do
    Process.sleep(1000)
  end
  x
end) |> Enum.each(fn x -> IO.puts(x) end)

#Alternative solution, more efficient:
Enum.each(list, fn x ->
  if x == 3 do
    Process.sleep(1000)
  end
  IO.puts(x)
end)
```
This revised code uses `Enum.map` to perform the operation on each element in parallel then iterates over the result sequentially. This ensures the output is in the intended order, preserving the original intent.  The alternative shows that the issue is not about using map, but rather the order of operations within the `Enum.each` function itself.