defmodule Esapp.CMS do
  @moduledoc """
  The CMS context.
  """

  import Ecto.Query, warn: false

  alias Esapp.Repo
  alias Esapp.EventApp
  alias Esapp.CMS.Commands.{CreatePost, UpdatePost}

  alias Esapp.CMS.Schemas.Post

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_posts do
    Repo.all(Post)
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post!(id), do: Repo.get!(Post, id)

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(%{"user_id" => user_id, "title" => title, "body" => body}) do
    with :ok <-
           EventApp.dispatch(
             %CreatePost{user_id: String.to_integer(user_id), title: title, body: body},
             consistency: :strong
           ) do
      {:ok, Repo.get_by(Post, %{title: title})}
    else
      _ -> {:error, :app_event_error}
    end
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(%{field: new_value})
      {:ok, %Post{}}

      iex> update_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(attrs) do
    post_id = Map.get(attrs, "id") |> String.to_integer()

    with :ok <- Esapp.EventApp.dispatch(%UpdatePost{}, consistency: :strong) do
      {:ok, Repo.get!(Post, post_id)}
    else
      _ -> {:error, :app_update_event_error}
    end

    # with :ok <- EventApp.dispatch(%UpdatePost{id: String.to_integer(post_id), title: title, body: body, user_id: String.to_integer(user_id)}, consistency: :strong) do
    #   {:ok, Repo.get!(Post, String.to_integer(post_id))}
    # else
    #   _ -> {:error, :app_update_event_error}
    # end

    # post
    # |> Post.changeset(attrs)
    # |> Repo.update()
  end

  @doc """
  Deletes a post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{data: %Post{}}

  """
  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end
end
