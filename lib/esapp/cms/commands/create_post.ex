defmodule Esapp.CMS.Commands.CreatePost do
  @moduledoc false

  @type t :: %{user_id: Integer.t(), title: String.t(), body: String.t()}

  defstruct [:user_id, :title, :body]
end
