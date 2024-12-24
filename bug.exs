```elixir
list = [1, 2, 3, 4, 5]

Enum.each(list, fn x ->
  if x == 3 do
    Process.sleep(1000) # Simulate some work
  end
  IO.puts(x)
end)
```
This code seems innocuous, but it hides a subtle concurrency issue. `Enum.each` does not guarantee any particular order of execution. If `Process.sleep` is called for `x == 3`,  the rest of the list may get processed *before* the sleep completes.  This is likely not the expected behavior in this use-case and is usually a hidden performance issue.

The problem lies in the implicit assumption that `Enum.each` is sequential. It's not.
