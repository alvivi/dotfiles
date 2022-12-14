final: prev: {
  slack = prev.slack.overrideAttrs (prevAttrs: {
    installPhase = prevAttrs.installPhase + ''
      rm $out/bin/slack

      makeWrapper $out/lib/slack/slack $out/bin/slack \
        --prefix XDG_DATA_DIRS : $GSETTINGS_SCHEMAS_PATH \
        --suffix PATH : ${final.lib.makeBinPath [final.pkgs.xdg-utils]} \
        --add-flags "--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations"
    '';
  });
}
