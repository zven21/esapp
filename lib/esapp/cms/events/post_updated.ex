defmodule Esapp.CMS.Events.PostUpdated do
  @moduledoc """
  PostCreated event struct.
  """

  @type t :: %{id: Integer.t(), user_id: Integer.t(), title: String.t(), body: String.t()}

  @derive Jason.Encoder

  defstruct [:id, :user_id, :title, :body]
end
