{ pkgs, ... }:

{
  home.file."firefox-theme" = {
    target = ".mozilla/firefox/dtsf/chrome/firefox-theme";
    source = (fetchTarball "https://github.com/andreasgrafen/cascade/archive/master.tar.gz");
  };

  programs.firefox = {
    enable = true;
    profiles.dtsf = {
      bookmarks = [];
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        duckduckgo-privacy-essentials
        privacy-badger
        react-devtools
        vimium
        betterttv
        tab-session-manager
      ];
      settings = {
        "browser.startup.homepage" = "about:blank";
        "privacy.trackingprotection.enabled" = true;
        "browser.newtabpage.enabled" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.disableResetPrompt" = true;
        "browser.toolbars.bookmarks.visibility" = "never";
        "extensions.pocket.enabled" = false;
        # "privacy.clearOnShutdown.history" = true;
        "general.smoothScroll" = true;

        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.openpage" = false;
        "browser.urlbar.suggest.bookmark" = false;
        "browser.urlbar.suggest.addons" = false;
        "browser.urlbar.suggest.pocket" = false;
        "browser.urlbar.suggest.topsites" = false;
        "browser.urlbar.suggest.searches" = false;

        "signon.rememberSignons" = false;
        "signon.autofillForms" = false;

        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      search = {
        default = "DuckDuckGo";
        engines = {
          DuckDuckGo = {
            name = "DuckDuckGo";
            keyword = "ddg";
            search = "https://duckduckgo.com/?q={searchTerms}";
          };
        };
        force = true;
      };
      userChrome = ''
        @import url("firefox-theme/chrome/userChrome.css");
      '';
      userContent = ''
        /* @import url("firefox-theme/userContent.css"); */
      '';
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "firefox.desktop" ];
    "text/xml" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
}