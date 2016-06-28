defmodule Interrogator do
   
  def get_name do
    IO.gets("What's your name?")
    |> String.strip
  end

  def get_cow_lover do
    IO.getn("Do you like cows? [Y|N]", 1)
  end

  def interrogate do
    name = get_name
    case String.downcase(get_cow_lover) do
      "y" -> 
        IO.puts "Great! Here's a cow for you #{name}"
      "n" -> 
        IO.puts "Oops, #{name}"
      _ -> 
        IO.puts "Only y/n."
    end
  end

  def cow_art do
    path = Path.expand("cow.txt", __DIR__)
    case File.read(path) do
      {:ok, art} -> art
      {:error, _} -> IO.puts "Error: File Not Found!"
    end
  end
end

ExUnit.start

defmodule InputOutputTest do
  use ExUnit.Case
  import String

  test "Checks if cow_art returns the string from the file." do
    art = Interrogator.cow_art
    assert strip(art) |> last == "d" 
  end
end
