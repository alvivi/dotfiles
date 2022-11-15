# BUG: github.com/NixOS/nixpkgs/issues/126681
# Workaround: systemctl restart interception-tools.service

{ pkgs, ... }: {
  console.useXkbConfig = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  services.interception-tools = {
    enable = true;
    plugins = [ pkgs.interception-tools-plugins.caps2esc ];
    udevmonConfig = ''
      - JOB: "${pkgs.interception-tools}/bin/intercept -g $DEVNODE | ${pkgs.interception-tools-plugins.caps2esc}/bin/caps2esc | ${pkgs.interception-tools}/bin/uinput -d $DEVNODE"
        DEVICE:
          EVENTS:
            EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
    '';
  };
}
