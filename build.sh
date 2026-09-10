#!/bin/sh
# Erzeugt aus index.html (Artifact-Fassung ohne Rahmen-Tags) die eigenstaendige
# Fassung docs/index.html, die GitHub Pages ausliefert.
#
#   ./build.sh   nach jeder Aenderung an index.html ausfuehren
#
set -e
cd "$(dirname "$0")"
mkdir -p docs
{
  echo '<!doctype html>'
  echo '<html lang="de">'
  echo '<head>'
  echo '<meta name="color-scheme" content="light dark">'
  awk 'NR==1,/^<\/style>$/' index.html
  echo '</head>'
  echo '<body>'
  awk '/^<\/style>$/{gefunden=1;next} gefunden' index.html
  echo '</body>'
  echo '</html>'
} > docs/index.html
echo "docs/index.html erzeugt ($(wc -c < docs/index.html) Bytes)"
