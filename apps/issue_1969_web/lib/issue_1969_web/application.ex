defmodule Issue1969Web.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Issue1969Web.Telemetry,
      # Start the Endpoint (http/https)
      Issue1969Web.Endpoint
      # Start a worker by calling: Issue1969Web.Worker.start_link(arg)
      # {Issue1969Web.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Issue1969Web.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Issue1969Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
