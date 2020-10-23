defmodule Esapp.CMS.Commands.DeletePost do
  @moduledoc false

  @type t :: %{id: Integer.t(), title: String.t()}

  defstruct [:id, :title]
end
