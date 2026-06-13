cask "geolibre" do
  version "1.2.0"

  on_arm do
    sha256 "2e13686606883035b398bc3eca0acf32e71faecb53999d5110783f13fea491cc"

    url "https://github.com/opengeos/GeoLibre/releases/download/v#{version}/GeoLibre.Desktop_#{version}_aarch64.dmg",
        verified: "github.com/opengeos/GeoLibre/"
  end
  on_intel do
    sha256 "d0acb2e5415ac84d2a233a043474326dd81189e7fc838925e27b5dcc977d19f4"

    url "https://github.com/opengeos/GeoLibre/releases/download/v#{version}/GeoLibre.Desktop_#{version}_x64.dmg",
        verified: "github.com/opengeos/GeoLibre/"
  end

  name "GeoLibre Desktop"
  desc "Lightweight, cloud-native GIS platform"
  homepage "https://geolibre.app/"

  # The DMGs are ad-hoc signed but not notarized, so install with
  # `--no-quarantine` to avoid the Gatekeeper "damaged" prompt.
  app "GeoLibre Desktop.app"

  zap trash: [
    "~/Library/Application Support/org.geolibre.desktop",
    "~/Library/Caches/org.geolibre.desktop",
    "~/Library/Preferences/org.geolibre.desktop.plist",
    "~/Library/Saved Application State/org.geolibre.desktop.savedState",
    "~/Library/WebKit/org.geolibre.desktop",
  ]
end
