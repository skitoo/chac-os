################################################################################
#
# erlang-p1-stringprep
#
################################################################################

ERLANG_P1_STRINGPREP_VERSION = 9e9e0f8
ERLANG_P1_STRINGPREP_SITE = $(call github,processone,stringprep,$(ERLANG_P1_STRINGPREP_VERSION))
ERLANG_P1_STRINGPREP_LICENSE = TCL
ERLANG_P1_STRINGPREP_LICENSE_FILES = LICENSE.TCL

$(eval $(rebar-package))
