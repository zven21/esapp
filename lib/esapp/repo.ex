defmodule Esapp.Repo do
  use Ecto.Repo,
    otp_app: :esapp,
    adapter: Ecto.Adapters.Postgres
end
