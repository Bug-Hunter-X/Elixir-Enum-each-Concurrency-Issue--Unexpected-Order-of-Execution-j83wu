# Elixir Enum.each Concurrency Gotcha

This repository demonstrates a subtle concurrency issue related to `Enum.each` in Elixir.  While `Enum.each` appears to iterate sequentially, it doesn't guarantee the order of execution if the function it calls is I/O bound or performs long operations.

**The Problem:** The `bug.exs` file shows an example of using `Enum.each` with `Process.sleep` to simulate a long-running operation. In this case, the output might not be strictly sequential due to the asynchronous nature of the execution.

**The Solution:** The `bugSolution.exs` demonstrates a more robust solution,  `Enum.map` and `Enum.each` which addresses the order issue.