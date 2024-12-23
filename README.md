# PhoenixBootstrap

![Static Badge](https://img.shields.io/badge/Elixir-1.18-blue?color=af9fb5) ![Static Badge](https://img.shields.io/badge/Phoenix_Framework-1.7.18-blue?color=ff645b) [![CI](https://github.com/anderkonzen/phoenix_bootstrap/actions/workflows/ci.yml/badge.svg)](https://github.com/anderkonzen/phoenix_bootstrap/actions/workflows/ci.yml) [![License: Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](http://unlicense.org/)

This is an opinionated [Phoenix](https://www.phoenixframework.org/) project that can be used as a starter template for your project.
It uses the default options of the `mix phx.new` command, with added libraries and CI.

The following are the defaults at the time the project was generated/updated:

  * [`postgres`](https://github.com/elixir-ecto/postgrex) for the DB adapter
  * [`bandit`](https://github.com/mtrudel/bandit) for HTTP adapter
  * assets configured ([`tailwind`](https://tailwindcss.com/) and [`esbuild`](https://esbuild.github.io/))
  * [Swoosh](https://hex.pm/packages/swoosh) mailer files
  * LiveView configured
  * not an umbrella project

## How to use

Clone the repo:

```shell
git clone git@github.com:anderkonzen/phoenix_bootstrap.git
```

Change directory and run the commands:

```shell
cd phoenix_bootstrap
mix setup
iex -S mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Dependencies

The project contains the following dependencies set up:

* [credo](https://hex.pm/packages/credo)
* [dialyxir](https://hex.pm/packages/dialyxir)
* [sobelow](https://hex.pm/packages/sobelow)
* [mix_audit](https://hex.pm/packages/mix_audit)

The above dependencies/libraries aim to add standardization, as well as enable security validations and static code analysis.

_Note: if you want to make checks on the project's documentation, I recommend checking the [Doctor](https://hex.pm/packages/doctor) package._

## CI

The CI pipeline uses all the aforementioned tools to check for security issues (both in code and dependencies), perform code static analysis, test and build.

The steps used in the CI are as follow:

- compilation (basically `mix deps.get, mix compile --warnings-as-errors --all-warnings`)
- linting and security, with `mix credo --strict`, `mix format --check-formatted` and `mix sobelow --config`
- dependencies audit, with `mix hex.audit`, `mix deps.audit`, `mix deps.unlock --check-unused`
- dialyzer
- tests with `mix test --warnings-as-errors --raise` (they are [partitioned](https://hexdocs.pm/mix/1.17.3/Mix.Tasks.Test.html#module-operating-system-process-partitioning))

The following mix aliases are available in the project: `mix ci`, `mix lint` and `mix deps_audit`.

> [!NOTE]
> You will find a _somewhat_ complex CI pipeline with reusable workflows and composite actions.
> This is on purpose and it aims to show you how can you achieve such customized flow, ie.,
> version matrix, partitioned tests with unified coverage data, etc.

## Release and Docker

The last step of the CI builds and publishes a Docker image to the Docker Hub registry.
The project is configured as a **release**, so the Dockerfile is optimized for such configuration.

It also uses the official Docker GitHub Actions and caching in order to make the image build step faster.

> [!NOTE]
> Two secrets (`DOCKERHUB_TOKEN` and `DOCKERHUB_USERNAME`) were added to the GitHub repo for the actions to work.
> You may need to change this configuration for it to work in your environment.

Check the [Actions](https://github.com/anderkonzen/phoenix_bootstrap/actions/workflows/ci.yml) page to see it in action.

## Other things you can try

Other than the tools already mentioned, the following tools are suggestions I believe can improve the overall devex:

* https://github.com/randycoulman/mix_test_interactive

## TODOs

* Add a way to easily rename the project (some alternatives [here](https://github.com/MainShayne233/rename) and [here](https://github.com/blackham/rename_elixir_app))
