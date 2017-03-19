defmodule BobTest do
  use ExUnit.Case
  doctest Bob

  test "process is alive" do
    pid = Bob.start
    assert true == Process.alive?(pid)
  end

  test "quit bob" do
    pid = Bob.start()
    send pid, {self(), :quit}
    receive do
      msg -> assert :bye == msg
    after
      100 -> assert false
    end
    assert false == Process.alive?(pid)
  end

  test "send message and still alive" do
    pid = Bob.start()
    send pid, {self(), "Bonjour"}
    receive do
      msg -> assert "Ça va?" == msg
    after
      100 -> assert false
    end
    assert true == Process.alive?(pid)
  end

end
