defmodule Bob do
  @moduledoc """
  Documentation for Bob.
  """

  def start do
    spawn fn -> loop() end
  end

  def loop do
    receive do
      {pid, :quit} -> send pid, :bye
      {pid, _} ->
        send pid, "Ça va?"
        loop()
    end
  end


end
