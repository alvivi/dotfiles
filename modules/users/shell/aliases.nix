{
  cat = "bat";
  dockerbash =
    "docker ps --format '{{.ID}}: {{.Image}} {{.Names}}' | peco | sed 's/: .*//g' | xargs -I{} -ot docker exec -ti {} /bin/bash";
  dockerkill =
    "docker ps --format '{{.ID}}: {{.Image}} {{.Names}}' | peco | sed 's/: .*//g' | xargs -I{} -ot docker kill {}";
  dockersh =
    "docker ps --format '{{.ID}}: {{.Image}} {{.Names}}' | peco | sed 's/: .*//g' | xargs -I{} -ot docker exec -ti {} /bin/sh";
  dockerstop =
    "docker ps --format '{{.ID}}: {{.Image}} {{.Names}}' | peco | sed 's/: .*//g' | xargs -I{} -ot docker stop {}";
  g = "git";
  ga = "git add";
  gai = "gsina | xargs git add";
  gaip = "gsina | xargs -o git add -p";
  gapa = "git add --patch --all";
  gb = "git branch";
  gbdi = "git branch | peco | xargs git branch -d";
  gc = "git commit";
  gco = "git checkout";
  gcoi =
    "git branch --all | peco | sed 's/remotes\\/origin\\///g' | xargs git checkout";
  ghcoi = "gh pr list | peco | awk '{ NF-=1; print $NF}' | xargs git checkout";
  gd = "git diff";
  gdi = "gsina | xargs -o git diff";
  gf = "git fetch --all";
  gfico = "gsina | xargs git checkout";
  gfire = "gsina | xargs git reset";
  ggc = "git branch | peco | xargs git branch --delete";
  ghl = "git stash list";
  ghp = "git stash pop";
  git = "noglob git";
  gl = "git log";
  gp = "git push";
  gpo = "git push origin";
  gpot = "git push origin --tags";
  gpuo =
    "git push -u origin --force-with-lease `git rev-parse --abbrev-ref HEAD`";
  gr = "git reset";
  grc = "git rev-list -n 1 HEAD --";
  gri = "gsina | git reset";
  gs = "git status";
  gull = "git pull";
}

