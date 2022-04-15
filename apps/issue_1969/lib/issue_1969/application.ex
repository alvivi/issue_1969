defmodule Issue1969.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: Issue1969.PubSub}
      # Start a worker by calling: Issue1969.Worker.start_link(arg)
      # {Issue1969.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Issue1969.Supervisor)
  end
end
