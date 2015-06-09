#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.


AC_PREREQ(2.52)

AC_INIT([apertium-en-it], [0.1.0], [joregan@gmail.com])
AM_INIT_AUTOMAKE([apertium-en-it], [0.1.0], no-define)
AC_PROG_LN_S
AC_PROG_AWK
AC_CONFIG_HEADER([config])

AC_PATH_PROG([LEXTOR], [apertium-gen-lextormono], [false], [$PATH$PATH_SEPARATOR$with_lextor/bin])
AS_IF([test x$LEXTOR = xfalse], [AC_MSG_ERROR([You don't have lextor installed. You can either install the old version 3.2 of apertium, or try apertium-eng-ita which "works" with new versions of apertium.])])

m4_define([required_apertium_version], [3.2.0])
PKG_CHECK_MODULES(APERTIUM,   apertium >= required_apertium_version, [], [PKG_CHECK_MODULES(APERTIUM,   apertium-3.2 >= required_apertium_version)])

if test $APERTIUM_VER = 10;
then MODES="";
else MODES="modes";
fi

AC_SUBST(MODES)

  
AC_OUTPUT([Makefile])
