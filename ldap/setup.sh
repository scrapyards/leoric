#!/usr/bin/env bash
set -xe

: ${PASSWORD:="password"}
: ${LDAPHOST:="ldap://localhost"}

ADMIN="cn=admin,dc=irrational,dc=io"

# Add the People group
ldapadd -x -D $ADMIN -H $LDAPHOST -W -f ldifs/groups/p.ldif

# Add all the users in the users/ folder
for file in ldifs/users/*.ldif; do
    ldapadd -x -D $ADMIN -H $LDAPHOST -W -f $file
done

# Add the Groups group
ldapadd -x -D $ADMIN -H $LDAPHOST -W -f ldifs/groups/g.ldif
