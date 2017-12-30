#!/usr/bin/env bash

: ${PASSWORD:="password"}
: ${LDAPHOST:="ldap://localhost"}

ADMIN="cn=admin,dc=irrational,dc=io"

ldapadd -Q -Y EXTERNAL -H $LDAPHOST -f ldifs/memberof/memberof.ldif
ldapmodify -Q -Y EXTERNAL -H $LDAPHOST -f ldifs/memberof/refint1.ldif
ldapadd -Q -Y EXTERNAL -H $LDAPHOST -f ldifs/memberof/refint2.ldif
