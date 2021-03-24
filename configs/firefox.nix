{ pkgs, ... }:

{
  enable = true;
  profiles.default = {
    isDefault = true;
    settings = {
      # Privacy
      "dom.battery.enabled" = false;
      "geo.enabled" = false;
      "media.navigator.enabled" = false;
      "media.video_stats.enabled" = false;
      "privacy.donottrackheader.enabled" = true;
      "privacy.trackingprotection.enabled" = true;
      "browser.search.region" = "";
      "services.sync.prefs.sync.extensions.activeThemeID" = false;
      "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsored" = false;
      "services.sync.prefs.sync.browser.newtabpage.activity-stream.feeds.section.highlights" = false;
      "services.sync.prefs.sync.browser.newtabpage.activity-stream.feeds.section.topstories" = false;
      "services.sync.prefs.sync.browser.newtabpage.activity-stream.feeds.topsites" = false;
      "services.sync.prefs.sync.browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
      "network.cookie.lifetimePolicy" = 2;
      "network.predictor.enabled" = false;
      "network.http.referer.spoofSource" = true;
      
      # Safebrowsing
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

      # Telemetry
      "toolkit.telemetry.cachedClientID" = "";
      "toolkit.telemetry.enabled" = false;
      "toolkit.telemetry.server" = "";
      "toolkit.telemetry.unified" = false;
      "toolkit.telemetry.updatePing.enabled" = false;
      "toolkit.telemetry.bhrPing.enabled" = false;
      "toolkit.telemetry.firstShutdownPing.enabled" = false;
      "toolkit.telemetry.newProfilePing.enabled" = false;
      "toolkit.telemetry.archive.enabled" = false;
      "toolkit.telemetry.shutdownPingSender.enabled" = false;
      "datareporting.healthreport.uploadEnabled" = false;
      "datareporting.policy.dataSubmissionEnabled" = false;
      "browser.send_pings" = false;
      "browser.ping-centre.telemetry" = false;
      "browser.newtabpage.activity-stream.feeds.telemetry" = false;
      "browser.newtabpage.activity-stream.telemetry.structuredIngestion.endpoint" = "";

      # Pocket
      "extensions.pocket.api" = "";
      "extensions.pocket.enabled" = false;
      "extensions.pocket.site" = "";
      "extensions.pocket.oAuthConsumerKey" = "";
      "extensions.pocket.onSaveRecs" = false;
      "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
      "browser.newtabpage.activity-stream.discoverystream.config" = "";
      "browser.newtabpage.activity-stream.discoverystream.endpointSpocsClear" = "";
      "browser.newtabpage.activity-stream.discoverystream.endpoints" = "";
      "services.sync.prefs.sync.browser.newtabpage.activity-stream.section.highlights.includePocket" = false;

      # UI
      "browser.tabs.loadBookmarksInTabs" = true;
      "browser.newtabpage.activity-stream.discoverystream.enabled" = false;
      "browser.newtabpage.activity-stream.showSponsored" = false;
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
      "browser.newtabpage.activity-stream.feeds.system.topsites" = false;
      "browser.newtabpage.activity-stream.feeds.topsites" = false;
      "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
      "browser.newtabpage.activity-stream.feeds.system.topstories" = false;
      "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
    };
  };
  extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    ublock-origin
  ];
}

