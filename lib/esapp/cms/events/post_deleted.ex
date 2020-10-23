defmodule Esapp.CMS.Events.PostDeleted do
  @moduledoc """
  PostCreated event struct.
  """

  @type t :: %{id: Integer.t(), title: String.t()}

  @derive Jason.Encoder

  defstruct [:id, :title]
end
