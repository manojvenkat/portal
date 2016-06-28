ExUnit.start

defmodule MapTest do
  use ExUnit.Case

  def sample do
    %{foo: "bar", loo: "poop"}
  end 

  test "[]" do
    assert sample[:foo] == "bar"
    assert sample[:loo] == "poop"
    assert sample[:non_existent] == nil
  end

  test "Map.get" do
    assert Map.get(sample, :foo) == "bar"
    assert Map.get(sample, :loo) == "poop"
    assert Map.get(sample, :non_existent) == nil
  end

  test "." do
    assert sample.foo == "bar"
    assert sample.loo == "poop"
    assert_raise KeyError, fn -> 
      sample.non_existent
    end
  end

  test "Map.fetch" do
    {:ok, val} = Map.fetch sample, :foo
    assert val == "bar"
    :error = Map.fetch(sample, :non_existent)
  end

  test "Map.put" do
    assert Map.put(sample, :foo, "bob") == %{foo: "bob", loo: "poop"}
    assert Map.put(sample, :food, "donut") == %{foo: "bar", loo: "poop", food: "donut"}
  end

  test "Map.values" do
    assert Enum.sort(Map.values(sample)) == ["bar", "poop"]
  end
end