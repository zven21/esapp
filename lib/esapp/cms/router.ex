defmodule Esapp.CMS.Router do
  @moduledoc false

  use Commanded.Commands.Router

  alias Esapp.CMS.{
    Commands.CreatePost,
    Aggregate
  }

  identify(Aggregate, by: :title, prefix: "cms-post-")
  dispatch([CreatePost], to: Aggregate)
end
