#!/usr/bin/env bash
set -e

: ${PASSWORD:="password"}
: ${LDAPHOST:="ldap://localhost"}
: ${ADMIN:="cn=admin,dc=irrational,dc=io"}

# Add the People group
ldapadd -x -D $ADMIN -H $LDAPHOST -w $PASSWORD -f ldifs/groups/p.ldif

# Add all the users in the users/ folder
for file in ldifs/users/*.ldif; do
    ldapadd -x -D $ADMIN -H $LDAPHOST -w $PASSWORD -f $file
done

# Add the Groups group
ldapadd -x -D $ADMIN -H $LDAPHOST -w $PASSWORD -f ldifs/groups/g.ldif
