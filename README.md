# PhoenixBootstrap

![Static Badge](https://img.shields.io/badge/Elixir-1.17-blue?color=af9fb5) ![Static Badge](https://img.shields.io/badge/Phoenix_Framework-1.7.14-blue?color=ff645b) [![CI](https://github.com/anderkonzen/phoenix_bootstrap/actions/workflows/ci.yml/badge.svg)](https://github.com/anderkonzen/phoenix_bootstrap/actions/workflows/ci.yml) [![License: Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](http://unlicense.org/)

This is an opinionated [Phoenix](https://www.phoenixframework.org/) project that can be used as a starter template for your project.
It uses the default options of the `mix phx.new` command, with added libraries and CI.

The following are the defaults at the time the project was generated/updated:

  * [`postgres`](https://github.com/elixir-ecto/postgrex) for the DB adapter
  * [`bandit`](https://github.com/mtrudel/bandit) for HTTP adapter
  * assets configured ([`tailwind`](https://tailwindcss.com/) and [`esbuild`](https://esbuild.github.io/))
  * [Swoosh](https://hex.pm/packages/swoosh) mailer files
  * LiveView configured
  * not an umbrella project

## Libraries

The project contains the following libraries set up:

* [credo](https://hex.pm/packages/credo)
* [dialyxir](https://hex.pm/packages/dialyxir)
* [sobelow](https://hex.pm/packages/sobelow)
* [mix_audit](https://hex.pm/packages/mix_audit)

The libraries used in this project aim to add standardization, as well as enable security validations and static code analysis.

## CI

The CI pipeline uses all the aforementioned tools to check for security issues (both in code and dependencies), perform code static analysis, test and build.

The steps used in the CI are as follow:

- compilation (basically `mix deps.get, mix compile --warnings-as-errors --all-warnings`)
- linting and security, with `mix credo --strict`, `mix format --check-formatted` and `mix sobelow --config`
- dependencies audit, with `mix hex.audit`, `mix deps.audit`, `mix deps.unlock --check-unused`
- dialyzer
- test with `mix test --warnings-as-errors --raise`

The following mix aliases are available in the project: `mix ci`, `mix lint` and `mix deps_audit`.

## Release and Docker

The last step of the CI builds and publishes a Docker image to the Docker Hub registry.
The project is configured as a **release**, so the Dockerfile is optimized for such configuration.

It also uses the official Docker GitHub Actions and caching in order to make the image build step faster.

> [!NOTE]
> Two secrets (`DOCKERHUB_TOKEN` and `DOCKERHUB_USERNAME`) were added to the GitHub repo for the actions to work.
> You may need to change this configuration for it to work in your environment.

Check the [Actions](https://github.com/anderkonzen/phoenix_bootstrap/actions/workflows/ci.yml) page to see it in action.

## TODOs

* Add a way to easily rename the project (some alternatives [here](https://github.com/MainShayne233/rename) and [here](https://github.com/blackham/rename_elixir_app))

---

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
