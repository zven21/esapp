defmodule Esapp.EventRouter do
  @moduledoc false
  use Commanded.Commands.CompositeRouter

  router(Esapp.CMS.Router)
end
