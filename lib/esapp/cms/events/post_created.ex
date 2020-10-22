defmodule Esapp.CMS.Events.PostCreated do
  @moduledoc """
  PostCreated event struct.
  """

  @type t :: %{user_id: Integer.t(), title: String.t(), body: String.t()}

  @derive Jason.Encoder

  defstruct [:user_id, :title, :body]
end
