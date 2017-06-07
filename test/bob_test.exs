defmodule BobTest do
  use ExUnit.Case
  doctest Bob

  def send_to_bob(msg, expected) do
    pid = Bob.start()
    send pid, {self(), msg}
    receive do
      msg -> assert expected == msg
    after
      100 -> assert false, "Bob do not answer !"
    end
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

  test "process is alive" do
    pid = Bob.start
    assert true == Process.alive?(pid)
  end

  test "get version" do
    send_to_bob :version, 1
  end

  @tag :pending
  test "stating something" do
    send_to_bob "Tom-ay-to, tom-aaaah-to.", "Whatever."
  end

  @tag :pending
  test "shouting" do
    send_to_bob "WATCH OUT!", "Whoa, chill out!"
  end

  @tag :pending
  test "asking a question" do
    send_to_bob "Does this cryogenic chamber make me look fat?", "Sure."
  end

  @tag :pending
  test "talking forcefully" do
    send_to_bob "Let's go make out behind the gym!", "Whatever."
  end

  @tag :pending
  test "talking in capitals" do
    send_to_bob "This Isn't Shouting!", "Whatever."
  end

  @tag :pending
  test "asking in capitals" do
    send_to_bob "THIS ISN'T SHOUTING?", "Sure."
  end

  @tag :pending
  test "shouting numbers" do
    send_to_bob "1, 2, 3 GO!", "Whoa, chill out!"
  end

  @tag :pending
  test "shouting with special characters" do
    send_to_bob "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!", "Whoa, chill out!"
  end

  @tag :pending
  test "shouting with no exclamation mark" do
    send_to_bob "I HATE YOU", "Whoa, chill out!"
  end

  @tag :pending
  test "statement containing question mark" do
    send_to_bob "Ending with ? means a question.", "Whatever."
  end

  @tag :pending
  test "silence" do
    send_to_bob "", "Fine. Be that way!"
  end

  @tag :pending
  test "prolonged silence" do
    send_to_bob "  ", "Fine. Be that way!"
  end

  @tag :pending
  test "only numbers" do
    send_to_bob "1, 2, 3", "Whatever."
  end

  @tag :pending
  test "question with numbers" do
    send_to_bob "4?", "Sure."
  end

  @tag :pending
  test "shouting in Russian" do
    send_to_bob "УХОДИ", "Whoa, chill out!"
  end

end
