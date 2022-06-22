# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Meta ebuild for Budgie Desktop with all official releases plus budgie-extras"
HOMEPAGE="https://github.com/BuddiesOfBudgie/budgie-desktop"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"

RDEPEND="
	>=gnome-extra/budgie-screensaver-5.0.1
	>=gnome-extra/budgie-desktop-10.6.1
	>=gnome-extra/budgie-desktop-view-1.2
	>=gnome-extra/budgie-control-center-1.0.1
	>=gnome-extra/budgie-extras-1.4.0-r1
"
