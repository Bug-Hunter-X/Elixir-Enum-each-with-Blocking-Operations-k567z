# Elixir Enum.each with Blocking Operations

This repository demonstrates a potential issue when using `Enum.each` in Elixir with long-running operations within the enumeration. The code in `bug.exs` shows a scenario where a potentially blocking operation (`Process.sleep`) can lead to unexpected pauses and potentially deadlocks.  `bugSolution.exs` offers a safer solution.

## Problem

When running the `bug.exs` file you'll notice a delay in the output. This happens because `Process.sleep` blocks the execution of the current process.  In real-world scenarios, this could involve database calls, network requests, or other operations that consume significant time. The other elements in the Enum.each will wait for this operation to be completed before continuing. If many of these long-running operations are present, it can drastically impact performance.

## Solution

`bugSolution.exs` provides a solution using `Task.async` to run the long-running operation concurrently. This prevents blocking the main process and allows for better performance, especially when dealing with multiple long-running operations. 
