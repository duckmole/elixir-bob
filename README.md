# Bob

Bob coding dojo using process to send and receive message

## Coding

Launch the tests

  mix test --exclude pending

## Hot reload code

Start elixir console

  iex -S mix

In elixir console

  pid = Bob.start
  send pid, {self(), :version}
  receive do msg -> msg end

In bob.ex change version

In elixir console

  c("lib/bob.ex")
  send pid, {self(), :version}
  receive do msg -> msg end

The version does not change

Send update message

  send pid, {self(), :update}
  send pid, {self(), :version}
  receive do msg -> msg end

The new version is sent

## Cluster

Start node with a cookie

  iex --sname node --cookie secret_token -S mix

Test the connection
  :net_adm.ping(:node@computer1)

On remote node launch the command `:rpc.call(:"node@computer1", Bob, :start, [])`

  that's all