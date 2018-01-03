#!/usr/bin/env bash
set -e

: ${PASSWORD:="password"}
: ${LDAPHOST:="ldap://localhost:389"}
: ${ADMIN:="cn=admin,dc=irrational,dc=io"}

ldapadd -Q -Y EXTERNAL -D $ADMIN -H $LDAPHOST -w $PASSWORD -f ldifs/memberof/memberof.ldif
ldapmodify -Q -Y EXTERNAL -D $ADMIN -H $LDAPHOST -w $PASSWORD -f ldifs/memberof/refint1.ldif
ldapadd -Q -Y EXTERNAL -D $ADMIN -H $LDAPHOST -w $PASSWORD -f ldifs/memberof/refint2.ldif
