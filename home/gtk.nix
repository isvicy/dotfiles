{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Red-Darkest-Solid";
    };
    font.name = "Inter";
    font.size = 10;
  };

  home.pointerCursor = {
    name = "Quintom_Snow";
    package = pkgs.quintom-cursor-theme;
    size = 24;
    gtk.enable = true;
  };
}