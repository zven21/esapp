defmodule Esapp.CMS.Aggregate do
  @moduledoc """
  """

  defstruct [:state]

  alias Esapp.CMS.{
    Commands.CreatePost,
    Events.PostCreated
  }

  def execute(_, %CreatePost{} = cmd) do
    %{cmd | __struct__: PostCreated}
  end

  def apply(state, %PostCreated{}) do
    state
  end
end
