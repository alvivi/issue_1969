defmodule Issue1969Web.Example do
  @moduledoc false

  use Issue1969Web, :component

  @spec example(map()) :: Rendered.t()
  def example(assigns) do
    ~H"""
    <ul class="list"></ul>
    """
  end
end
