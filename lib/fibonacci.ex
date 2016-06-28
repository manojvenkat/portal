defmodule Fib do
  @seed [0, 1]

  def fib(n) when n < 2 do 
    Enum.take @seed, n
  end

  def fib(n) when n >= 2 do
    fib(@seed, n-2)
  end

  def fib(acc, 0), do: acc

  def fib(acc, n) do
    fib(acc ++ [Enum.at(acc, -2) + Enum.at(acc, -1)], n-1)
  end
end

defmodule Fib2 do
  @seed [1, 0]

  def fib2(n) when n < 2 do
    Enum.reverse(@seed) |> Enum.take(n)
  end

  def fib2(n) when n >= 2 do
    fib2(@seed, n-2)
  end

  def fib2(acc, 0), do: Enum.reverse(acc)

  def fib2([first, second| _ ] = lst, n) do
    fib2([first+second | lst], n-1)
  end
end

ExUnit.start


defmodule RecursionTest do
  use ExUnit.Case

  import Fib

  test "Fib1" do
    assert fib(0) == []
    assert fib(1) == [0]
    assert fib(2) == [0, 1]
    assert fib(3) == [0, 1, 1]
    assert fib(4) == [0, 1, 1, 2]
    assert fib(5) == [0, 1, 1, 2, 3]
    assert fib(6) == [0, 1, 1, 2, 3, 5]
    assert fib(7) == [0, 1, 1, 2, 3, 5, 8]
  end

  import Fib2 

  test "Fib2" do
    assert fib2(0) == []
    assert fib2(1) == [0]
    assert fib2(2) == [0, 1]
    assert fib2(3) == [0, 1, 1]
    assert fib2(4) == [0, 1, 1, 2]
    assert fib2(5) == [0, 1, 1, 2, 3]
    assert fib2(6) == [0, 1, 1, 2, 3, 5]
    assert fib2(7) == [0, 1, 1, 2, 3, 5, 8]
  end

  test "benchmark" do
    {microsecs, _} = :timer.tc fn -> fib(10000) end
    IO.puts "First function took #{microsecs} ms."
    {microsecs, _} = :timer.tc fn -> fib2(10000) end
    IO.puts "Second function took #{microsecs} ms."
  end
end