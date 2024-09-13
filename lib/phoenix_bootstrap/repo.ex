defmodule PhoenixBootstrap.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_bootstrap,
    adapter: Ecto.Adapters.Postgres
end
