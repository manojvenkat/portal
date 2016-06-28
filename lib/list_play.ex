ExUnit.start

defmodule ListTest do
  use ExUnit.Case

  def sample do
    ["1", "2", "3"]
  end

  test "sigil" do
    assert sample == ~w(1 2 3)
  end

  test "head" do
    [head | _] = sample
    assert head == "1"
  end

  test "tail" do
    [_ |  tail] = sample
    assert tail == ["2", "3"]
  end

  test "last item" do
    assert List.last(sample) == "3"
  end

  test "delete item" do
    assert List.delete(sample, "1") == ["2", "3"]
    assert List.delete([1,2,3], 1) == [2,3]
  end

  test "List.fold" do
    list = [20, 10, 5, 2.5]
    sum = List.foldr list, 0, &(&1 + &2)
    assert sum == 37.5
  end

  test "Enum.reduce" do
    list = [20, 10, 5, 2.5]
    sum = Enum.reduce list, 0, &(&1 + &2)
    assert sum == 37.5
  end

  test "wrap" do
    assert List.wrap(sample) == sample
    assert List.wrap(1) == [1]
    assert List.wrap([]) == []
    assert List.wrap(nil) == []
  end

  test "Enum.filter_map" do
    sample_new = ["Tim", "Mac"]
    some = Enum.filter_map sample_new, &(String.first(&1) >= "M"), &(&1 <> " Morgan")
    assert some == ["Tim Morgan", "Mac Morgan"]
  end
end
