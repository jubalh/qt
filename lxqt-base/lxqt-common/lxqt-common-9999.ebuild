# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit cmake-utils

DESCRIPTION="LXQt common resources"
HOMEPAGE="http://lxqt.org/"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://git.lxde.org/git/lxde/${PN}.git"
else
	SRC_URI="http://downloads.lxqt.org/lxqt/${PV}/${P}.tar.xz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="LGPL-2.1+"
SLOT="0"

DEPEND="~lxqt-base/liblxqt-${PV}"
RDEPEND="${DEPEND}"
PDEPEND="~lxqt-base/lxqt-session-${PV}"

src_install() {
	cmake-utils_src_install
	dodir "/etc/X11/Sessions"
	dosym  "/usr/bin/startlxqt" "/etc/X11/Sessions/lxqt"
}
