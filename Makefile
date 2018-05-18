.PHONY: test
##################################################################
#### Development Commands
##################################################################

start:
	MIX_ENV=dev mix phx.server

routes:
	MIX_ENV=dev mix phx.routes

test:
	MIX_ENV=test mix test

test.file:
	MIX_ENV=test mix test ${file}

release:
	MIX_ENV=prod mix do compile, phx.digest, release --env=prod

credo:
	MIX_ENV=dev mix credo

coverage:
	MIX_ENV=test mix coveralls.html

coverage.show:
	command -v sensible-browser &> /dev/null \
	&& sensible-browser ./src/cover/excoveralls.html \
	|| open ./src/cover/excoveralls.html

ecto.migrate:
	MIX_ENV=dev mix ecto.migrate

ecto.reset:
	MIX_ENV=dev mix ecto.reset
setup:
	MIX_ENV=dev mix do local.hex, local.phoenix, deps.get, deps.compile \
	cp env .env
