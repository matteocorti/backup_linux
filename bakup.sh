#!/bin/sh

# directories to backup
DIR="/root \
/etc \
/home \
/var/lib/imap \
/var/lib/mailman \
/var/lib/mysql \
/var/log \
/var/spool/imap \
/var/www"

EXCLUDES="--exclude=/var/lib/imap/socket/lmtp \
--exclude=/var/lib/mysql/mysql.sock \
--exclude=/var/lib/imap/proc \
--exclude=/var/log \
--exclude=/home/nobody/ \
--exclude=/home/spamassassin/.spamassassin/bayes_journal \
--exclude=/var/spool/imap/*/user/*/Drafts/* \
--exclude=/var/spool/imap/**.NEW"

# the name of the backup machine
BSERVER=casa.corti.li
BUSER=corti
BDIR=/Volumes/External/corti.li

# new.ethz.ch
BSERVER=new.corti.li
BUSER=corti
BDIR=/mnt/volume/corti.li


########################################################################

OPTS="--force \
--ignore-errors \
--delete \
$EXCLUDES \
--archive \
--compress \
--partial \
--relative"

# verbose
# OPTS="$OPTS -v"

rsync --rsh 'ssh -x ' "$OPTS" "$DIR" $BUSER@$BSERVER:$BDIR
