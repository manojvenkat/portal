defmodule Math do
  def square(x) do
    x * x
  end
end

defmodule SampleModule do
  def hello do
    IO.puts "Hello World"
  end

  def sum(x,y) do
  	IO.puts (x+y)
  end

  def print_list(list) when is_list(list) do
  	IO.inspect list
  end

  def loop_through([h | t]) do
    IO.inspect h
    loop_through t
  end

  def loop_through([]) do
    :ok
  end

  def diff_loop([]) do
    IO.puts "**"
  end

  def diff_loop(list) when is_list(list) do
    [h | t] = list
    IO.puts h
    diff_loop t
  end

  def diff_loop(int) do
    IO.puts int
  end

  def power_of_2(list, n) do
    Enum.map power_of_2(list, n-1), &Math.square/1
  end

  def power_of_2(list, 0) do
    IO.inspect list
    list
  end

	defp priv do
    :secret_info
  end

end
