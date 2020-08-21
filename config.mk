include /usr/include/gmsl

#
# OS identifiers
#

OS_BUG_REPORT_URL     = https://forums.bunsenlabs.org/viewforum.php?id = 14
OS_CODENAME           = Lithium
OS_CODENAME_LOWERCASE = $(call lc,$(OS_CODENAME))
OS_COLOR              = 0;34
OS_HOMEPAGE           = https://www.bunsenlabs.org
OS_ID                 = $(call lc,$(OS_PRETTY_ID))
OS_ID_LIKE            = debian
OS_LONGNAME           = $(OS_NAME) $(OS_VERSION_ID) ($(OS_CODENAME))
OS_NAME               = BunsenLabs GNU/Linux
OS_PRETTY_ID          = BunsenLabs
OS_PRIVACY_POLICY_URL = https://www.bunsenlabs.org/legal.html
OS_SUPPORT_URL        = https://forums.bunsenlabs.org
OS_VERSION            = $(OS_CODENAME) ($(OS_VERSION_ID))
OS_VERSION_ID         = 10.5

define OS_RELEASE_FILE
ANSI_COLOR="$(OS_COLOR)"
BUG_REPORT_URL="$(OS_BUG_REPORT_URL)"
HOME_URL="$(OS_HOMEPAGE)"
ID="$(OS_ID)"
ID_LIKE="$(OS_ID_LIKE)"
NAME="$(OS_NAME)"
PRETTY_NAME="$(OS_LONGNAME)"
PRIVACY_POLICY_URL="$(OS_PRIVACY_POLICY_URL)"
SUPPORT_URL="$(OS_SUPPORT_URL)"
VERSION="$(OS_VERSION_ID) ($(OS_CODENAME))"
VERSION_CODENAME="$(OS_CODENAME_LOWERCASE)"
VERSION_ID="$(OS_VERSION_ID)"
endef
export OS_RELEASE_FILE
OS_RELEASE_FILE_TARGET = os-release.bunsen

RELEASE_FILE_TARGETS = $(OS_RELEASE_FILE_TARGET)

#
# man page generator
#
MANPAGE_SOURCES = $(wildcard *.mkd)
MANPAGE_TARGETS = $(patsubst %.mkd,%.gz,$(MANPAGE_SOURCES))
mancat = $(subst .,,$(suffix $(patsubst %.gz,%,$(1))))
