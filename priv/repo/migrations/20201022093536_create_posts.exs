defmodule Esapp.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :string
      add :user_id, :integer

      timestamps()
    end

    create unique_index(:posts, [:title])
  end
end
