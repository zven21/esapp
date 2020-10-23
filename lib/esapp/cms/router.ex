defmodule Esapp.CMS.Router do
  @moduledoc false

  use Commanded.Commands.Router

  alias Esapp.CMS.{
    Commands.CreatePost,
    Commands.UpdatePost,
    Commands.DeletePost,
    Aggregate
  }

  identify(Aggregate, by: :title, prefix: "cms-post-")
  dispatch([CreatePost, UpdatePost, DeletePost], to: Aggregate)
end
