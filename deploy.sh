#/bin/bash

BASEDIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
while [ -h "$BASEDIR/$0" ]; do
    DIR=$(dirname -- "$BASEDIR/$0")
    SYM=$(readlink $BASEDIR/$0)
    BASEDIR=$(cd $DIR && cd $(dirname -- "$SYM") && pwd)
done
cd "${BASEDIR}/.."

BUCKET="diy-lang.com"

aws s3 sync --profile "diy-lang.com" "${BASEDIR}/site/" "s3://$BUCKET" --region="eu-central-1" --delete
