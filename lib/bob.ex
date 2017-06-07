defmodule Bob do
  @moduledoc """
  Documentation for Bob.
  """

  def version do
    1
  end

  def start do
    spawn fn -> loop() end
  end

  def loop do
    receive do
      {pid, :quit} -> send pid, :bye
    end
  end


end
