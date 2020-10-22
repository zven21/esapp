defmodule Esapp.EventApp do
  @moduledoc false

  use Commanded.Application,
    otp_app: :esapp,
    event_store: [
      adapter: Commanded.EventStore.Adapters.EventStore,
      event_store: Esapp.EventStore
    ]

  router(Esapp.EventRouter)
end
