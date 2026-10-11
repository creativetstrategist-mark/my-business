#!/usr/bin/env bash
# Swap the empty client-quote avatar slots for the real photos.
# Run from the repo root once assets/clients/{luka,paige,andy}.jpg exist.
set -euo pipefail
cd "$(dirname "$0")/.."

missing=0
for f in luka paige andy; do
  [ -f "assets/clients/$f.jpg" ] || { echo "missing: assets/clients/$f.jpg"; missing=1; }
done
[ "$missing" -eq 0 ] || { echo "Add the photos first — see assets/clients/README.md"; exit 1; }

python3 - <<'PY'
import re
p='masterclass.html'
s=open(p,encoding='utf-8').read()
who={'Luka Maric':'luka','Paige Decker':'paige','Andy Reymond':'andy'}
n=0
for name,slug in who.items():
    old=('            <span class="av" aria-hidden="true"></span>\n'
         '            <div>\n'
         f'              <p class="who-name">{name}</p>')
    new=(f'            <img class="av-img" src="assets/clients/{slug}.jpg" width="160" height="160"\n'
         '                 loading="lazy" decoding="async" alt="">\n'
         '            <div>\n'
         f'              <p class="who-name">{name}</p>')
    if old in s:
        s=s.replace(old,new); n+=1
    elif f'assets/clients/{slug}.jpg' in s:
        print(f'  {name}: already wired')
    else:
        raise SystemExit(f'could not find the slot for {name}')
open(p,'w',encoding='utf-8').write(s)
print(f'wired {n} photo(s) into masterclass.html')
PY

echo "Now regenerate the Systeme.io blocks so they carry the photos inlined."
