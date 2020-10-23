defmodule Esapp.CMS.Projectors.Post do
  @moduledoc false

  alias Esapp.CMS.{
    Events.PostCreated,
    Events.PostUpdated,
    Events.PostDeleted,
    Schemas.Post
  }

  alias Esapp.CMS

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

  project(
    %PostUpdated{id: post_id, user_id: user_id, title: title, body: body},
    _meta,
    fn multi ->
      rs = post_id |> CMS.get_post!() |> CMS.change_post(%{user_id: user_id, title: title, body: body})

      Ecto.Multi.update(
        multi,
        :update_post_projection,
        rs
      )
    end
  )

  project(
    %PostDeleted{id: post_id, title: title},
    _meta,
    fn multi ->
      rs = post_id |> CMS.get_post!()

      Ecto.Multi.delete(
        multi,
        :delete_post_projection,
        rs
      )
    end
  )
end
