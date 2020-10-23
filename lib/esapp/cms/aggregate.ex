defmodule Esapp.CMS.Aggregate do
  @moduledoc """
  """

  defstruct [:state]

  alias Esapp.CMS.{
    Commands.CreatePost,
    Commands.UpdatePost,
    Commands.DeletePost,
    Events.PostCreated,
    Events.PostUpdated,
    Events.PostDeleted,
  }

  def execute(_, %CreatePost{} = cmd) do
    %{cmd | __struct__: PostCreated}
  end

  def execute(_, %UpdatePost{} = cmd) do
    %{cmd | __struct__: PostUpdated}
  end

  def execute(_, %DeletePost{} = cmd) do
    %{cmd | __struct__: PostUpdated}
  end

  def apply(state, %PostCreated{}) do
    state
  end

  def apply(state, %PostUpdated{}) do
    state
  end

  def apply(state, %PostDeleted{}) do
    state
  end
end
