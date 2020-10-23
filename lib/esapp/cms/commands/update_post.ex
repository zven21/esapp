defmodule Esapp.CMS.Commands.UpdatePost do
  @moduledoc false

  @type t :: %{id: Integer.t(),  user_id: Integer.t(), title: String.t(), body: String.t()}

  defstruct [:id, :user_id, :title, :body]
end
