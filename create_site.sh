#!/usr/bin/env bash
echo "Generating GitHub pages site from markdown"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR" || exit

echo " - Cleaning up site directory and copying spec-publisher site..."
git clean -f specification/ 


if [ -d _site ]
then
  echo " - Removing old _site directory contents"
  rm -rf _site/*
fi

echo " - copying files to site directory..."
# Copy spec-publisher artifacts to the site
cp -rf spec-publisher/site/* spec-publisher/res/md/figs site/
# Copy remaining project collaterel to the site
cp -rf profile archive examples specification/media site/

echo " - spec-publisher: generating requirement tables, appendices, etc."
mvn package -f spec-publisher/pom.xml
java -jar ./spec-publisher/target/mets-profile-processor-0.1.0-SNAPSHOT.jar -f ./specification.yaml -o doc/site profile/E-ARK-DIP-v2-2-0.xml

echo " - MARKDOWN-PP: generating site page with TOC..."
cd doc/site || exit
bash "$SCRIPT_DIR/spec-publisher/scripts/create-venv.sh"
command -v markdown-pp >/dev/null 2>&1 || {
  tmpdir=$(dirname "$(mktemp -u)")
  source "$tmpdir/.venv-markdown/bin/activate"
}
markdown-pp body.md -o body_toc.md

echo " - MARKDOWN-PP: Processing postface markdown"
cd "$SCRIPT_DIR/specification/postface/" || exit
markdown-pp postface.md -o "$SCRIPT_DIR/doc/site/postface.md" -e tableofcontents

echo " - MARKDOWN-PP: generating final site index markdown in site/index.md"
cd "$SCRIPT_DIR/doc/site" || exit
markdown-pp SITE.md -o ../../site/index.md
