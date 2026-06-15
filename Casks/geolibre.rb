cask "geolibre" do
  version "1.3.0"

  on_arm do
    sha256 "e1b43febfef2842b3a8a6c13be786e2d5a111d733de0da01d0294abd749cd6ff"

    url "https://github.com/opengeos/GeoLibre/releases/download/v#{version}/GeoLibre.Desktop_#{version}_aarch64.dmg",
        verified: "github.com/opengeos/GeoLibre/"
  end
  on_intel do
    sha256 "c33d4ff6b98603e28c9c4c2cd600452285dc2614717dda8102cf9684917249fd"

    url "https://github.com/opengeos/GeoLibre/releases/download/v#{version}/GeoLibre.Desktop_#{version}_x64.dmg",
        verified: "github.com/opengeos/GeoLibre/"
  end

  name "GeoLibre Desktop"
  desc "Lightweight, cloud-native GIS platform"
  homepage "https://geolibre.app/"

  app "GeoLibre Desktop.app"

  # The DMGs are ad-hoc signed but not notarized by Apple, so macOS Gatekeeper
  # blocks them with a "damaged" prompt. Homebrew removed the --no-quarantine
  # flag in 5.1, so the user must strip the quarantine attribute by hand.
  caveats <<~EOS
    GeoLibre Desktop is not notarized by Apple. Before first launch, remove the
    quarantine attribute (repeat this after every upgrade):

      xattr -dr com.apple.quarantine "/Applications/GeoLibre Desktop.app"
  EOS

  zap trash: [
    "~/Library/Application Support/org.geolibre.desktop",
    "~/Library/Caches/org.geolibre.desktop",
    "~/Library/Preferences/org.geolibre.desktop.plist",
    "~/Library/Saved Application State/org.geolibre.desktop.savedState",
    "~/Library/WebKit/org.geolibre.desktop",
  ]
end
