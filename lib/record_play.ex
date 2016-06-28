ExUnit.start

defmodule User do
  defstruct email: nil, password: nil
end

defimpl String.Chars, for: User do
  def to_string(%User {email: email}) do
    email
  end
end

defmodule RecordTest do
  use ExUnit.Case

  defmodule ScopeTest do
    use ExUnit.Case

    require Record
    Record.defrecordp :person, first_name: nil, last_name: nil, age: nil

    test "defrecordp" do
      p = person(first_name: "lol", last_name: "lool", age: 5)
      assert p == {:person, "lol", "lool", 5}
    end
  end

  def sample do
    %User{email: "xyz@gmail.com", password: "loop"}
  end

  test "defstruct" do
    assert sample == %{__struct__: User, email: "xyz@gmail.com", password: "loop"}
  end

  test "property" do
    assert sample.email == "xyz@gmail.com"
  end

  test "update" do
    u = sample
    u2 = %User{u | email: "tim@example.com"}
    assert u2 == %User{email: "tim@example.com", password: "loop"}
    assert u == %User{email: "xyz@gmail.com", password: "loop"}
  end

  test "protocol" do
    assert to_string(sample) == "xyz@gmail.com"
  end
end