TERMUX_PKG_VERSION=1.6.4
TERMUX_PKG_BUILD_REVISION=1
TERMUX_PKG_HOMEPAGE=http://www.gnu.org/software/libgcrypt/
TERMUX_PKG_DESCRIPTION="General purpose cryptographic library based on the code from GnuPG"
TERMUX_PKG_SRCURL=ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_DEPENDS="libgpg-error"
LDFLAGS="$LDFLAGS -llog" # libgcrypt uses syslog, which we redirect to android logging

termux_step_pre_configure () {
	if [ $TERMUX_ARCH = "i686" ]; then
		# Fix i686 android build, also in https://bugzilla.gnome.org/show_bug.cgi?id=724050
		TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --disable-asm"
	fi
}
