PROJECT = emqx_stomp
PROJECT_DESCRIPTION = EMQ X Stomp Protocol Plugin
PROJECT_VERSION = 3.0

DEPS = clique
dep_clique = git https://github.com/emqtt/clique

BUILD_DEPS = emqx cuttlefish
dep_emqx = git https://github.com/emqtt/emqttd emqx30
dep_cuttlefish = git https://github.com/emqtt/cuttlefish

TEST_DEPS = emqx_ct_helplers
dep_emqx_ct_helplers = git git@github.com:emqx/emqx_ct_helpers

NO_AUTOPATCH = cuttlefish

ERLC_OPTS += +debug_info
ERLC_OPTS += +'{parse_transform, lager_transform}'

COVER = true

include erlang.mk

app:: rebar.config

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emqx_stomp.conf -i priv/emqx_stomp.schema -d data
