include /usr/include/gmsl

#
# OS identifiers
#

OS_CODENAME       = Helium
OS_VERSION_ID     = 9.7
OS_VERSION        = $(OS_CODENAME) ($(OS_VERSION_ID))
OS_COLOR          = 0;34
OS_BUG_REPORT_URL = https://forums.bunsenlabs.org/viewforum.php?id=14
OS_HOMEPAGE       = https://www.bunsenlabs.org
OS_SUPPORT_URL    = https://forums.bunsenlabs.org
OS_PRETTY_ID      = BunsenLabs
OS_ID             = $(call lc,$(OS_PRETTY_ID))
OS_ID_LIKE        = debian
OS_NAME           = BunsenLabs GNU/Linux
OS_LONGNAME       = $(OS_NAME) $(OS_VERSION_ID) ($(OS_CODENAME))

define OS_RELEASE_FILE
ANSI_COLOR="$(OS_COLOR)"
BUG_REPORT_URL="$(OS_BUG_REPORT_URL)"
HOME_URL="$(OS_HOMEPAGE)"
ID="$(OS_ID)"
ID_LIKE="$(OS_ID_LIKE)"
NAME="$(OS_NAME)"
PRETTY_NAME="$(OS_LONGNAME)"
SUPPORT_URL="$(OS_SUPPORT_URL)"
VERSION="$(OS_VERSION_ID) ($(OS_CODENAME))"
VERSION_ID="$(OS_VERSION_ID)"
endef
export OS_RELEASE_FILE
OS_RELEASE_FILE_TARGET = os-release.bunsen

define LSB_RELEASE_FILE
DISTRIB_ID="$(OS_PRETTY_ID)"
DISTRIB_DESCRIPTION="$(OS_LONGNAME)"
DISTRIB_RELEASE="$(OS_VERSION_ID)"
DISTRIB_CODENAME="$(call lc,$(OS_CODENAME))"
endef
export LSB_RELEASE_FILE
LSB_RELEASE_FILE_TARGET = lsb-release.bunsen

RELEASE_FILE_TARGETS = $(LSB_RELEASE_FILE_TARGET) $(OS_RELEASE_FILE_TARGET)

#
# man page generator
#
MANPAGE_SOURCES = $(wildcard *.mkd)
MANPAGE_TARGETS = $(patsubst %.mkd,%.gz,$(MANPAGE_SOURCES))
mancat = $(subst .,,$(suffix $(patsubst %.gz,%,$(1))))
