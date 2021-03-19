{ pkgs, ... }:

{
  enable = true;
  profiles.default = {
    isDefault = true;
    settings = {
      "browser.tabs.closeWindowWithLastTab" = false;
      "dom.battery.enabled" = false;
      "geo.enabled" = false;
      "media.navigator.enabled" = false;
      "media.video_stats.enabled" = false;
      "privacy.donottrackheader.enabled" = true;
      "browser.search.region" = "";
      "privacy.trackingprotection.enabled" = true;
      "browser.safebrowsing.enabled" = false;
      "browser.safebrowsing.phishing.enabled" = false;
      "browser.safebrowsing.reportPhishURL" = "";
      "browser.safebrowsing.malware.enabled" = false;	
      "browser.safebrowsing.downloads.enabled" = false;
      "browser.safebrowsing.downloads.remote.url" = "";
      "browser.safebrowsing.provider.google.pver" = "";
      "browser.safebrowsing.provider.google.lists" = "";
      "browser.safebrowsing.provider.google.advisoryURL" = "";
      "browser.safebrowsing.provider.google.gethashURL" = "";
      "browser.safebrowsing.provider.google.reportMalwareMistakeURL" = "";
      "browser.safebrowsing.provider.google.reportPhishMistakeURL" = "";
      "browser.safebrowsing.provider.google.reportURL" = "";
      "browser.safebrowsing.provider.google.updateURL" = "";
      "browser.safebrowsing.provider.google4.dataSharing.enabled" = false;
      "browser.safebrowsing.provider.google4.pver" = "";
      "browser.safebrowsing.provider.google4.lists" = "";
      "browser.safebrowsing.provider.google4.dataSharingURL" = "";
      "browser.safebrowsing.provider.google4.gethashURL" = "";
      "browser.safebrowsing.provider.google4.advisoryURL" = "";
      "browser.safebrowsing.provider.google4.reportMalwareMistakeURL" = "";
      "browser.safebrowsing.provider.google4.reportPhishMistakeURL" = "";
      "browser.safebrowsing.provider.google4.reportURL" = "";
      "browser.safebrowsing.provider.google4.updateURL" = "";
      "browser.safebrowsing.provider.mozilla.pver" = "";
      "browser.safebrowsing.provider.mozilla.lists" = "";
      "browser.safebrowsing.provider.mozilla.gethashURL" = "";
      "browser.safebrowsing.provider.mozilla.updateURL" = "";
      "toolkit.telemetry.cachedClientID" = "";
      "toolkit.telemetry.server" = "";
      "browser.send_pings" = false;
      "network.cookie.lifetimePolicy" = 2;
      "network.predictor.enabled" = false;
      "extensions.pocket.api" = "";
      "extensions.pocket.enabled" = false;
      "extensions.pocket.site" = "";
      "extensions.pocket.oAuthConsumerKey" = "";
      "network.http.referer.spoofSource" = true;
    };
  };
  extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    ublock-origin
    vimium
  ];
}

