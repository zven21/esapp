defmodule Esapp.CMS.Projectors.Post do
  @moduledoc false

  alias Esapp.CMS.{
    Events.PostCreated,
    Schemas.Post
  }

  use Commanded.Projections.Ecto,
    application: Esapp.EventApp,
    repo: Esapp.Repo,
    name: "cms_post_projection",
    consistency: :strong

  project(
    %PostCreated{user_id: user_id, title: title, body: body},
    _meta,
    fn multi ->
      post = %Post{
        user_id: user_id,
        title: title,
        body: body
      }

      Ecto.Multi.insert(
        multi,
        :create_post_projection,
        post
      )
    end
  )
end
