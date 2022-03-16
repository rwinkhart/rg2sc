#!/bin/bash

# This script packages rg2sc (from source) for Arch Linux.

echo -e '\n\nThe value entered in this field will only affect the version reported to the package manager. The latest source is used regardless.\n'
read -r -p "Version number: " version
read -r -p "Revision number: " revision

echo -e '\nOptions (please enter the number only):'
echo -e '\n1. GitHub Release Tag\n2. Local\n'
read -r -p "Source (for build scripts): " source

if [ "$source" == "1" ]; then
    source='https://github.com/rwinkhart/rg2sc/releases/download/v$pkgver/rg2sc-$pkgver.tar.xz'
else
    source=local://sshyp-"$version".tar.xz
fi


# Archive creation
echo -e '\nPackaging as generic...\n'
mkdir -p packages/archtemp/usr
cp -r bin packages/archtemp/usr/
cp -r share packages/archtemp/usr/
tar -C packages/archtemp -cvf packages/sshyp-"$version".tar.xz usr/
rm -rf packages/archtemp
sha512="$(sha512sum packages/sshyp-"$version".tar.xz | awk '{print $1;}')"
echo -e "\nsha512 sum:\n$sha512"
echo -e "\nGeneric packaging complete.\n"

# PKGBUILD creation
echo -e '\nGenerating PKGBUILD...'
echo "# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=rg2sc
pkgver="$version"
pkgrel="$revision"
pkgdesc='Converts ReplayGain ID3 tags to Apple Sound Check tags'
url='https://github.com/rwinkhart/rg2sc'
arch=('any')
license=('GPL2')
depends=(python python-mutagen)

source=(\""$source"\")
sha512sums=('"$sha512"')

package() {

    tar xf sshyp-"\"\$pkgver\"".tar.xz -C "\"\${pkgdir}\""

}
" > packages/PKGBUILD
    echo -e "\nPKGBUILD generated.\n"
