defmodule PhoenixBootstrapWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use PhoenixBootstrapWeb, :controller` and
  `use PhoenixBootstrapWeb, :live_view`.
  """
  use PhoenixBootstrapWeb, :html

  embed_templates "layouts/*"
end
