cask "geolibre" do
  version "1.4.0"

  on_arm do
    sha256 "89cabe84819c8949e5545eddc3a4e1bd6dde2d024ad8f05d853a238b8a9306ad"

    url "https://github.com/opengeos/GeoLibre/releases/download/v#{version}/GeoLibre.Desktop_#{version}_aarch64.dmg",
        verified: "github.com/opengeos/GeoLibre/"
  end
  on_intel do
    sha256 "8a8968182e4bcf7cca6caae4f0929386f189628f6905730d56d7533205016b14"

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
