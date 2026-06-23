cask "geolibre" do
  version "1.7.0"

  on_arm do
    sha256 "6d5ed6d035efcc48452252e2b4af6a2be394a536da47d72c363974582acb3d44"

    url "https://github.com/opengeos/GeoLibre/releases/download/v#{version}/GeoLibre.Desktop_#{version}_aarch64.dmg",
        verified: "github.com/opengeos/GeoLibre/"
  end
  on_intel do
    sha256 "bf7cba076fc96161da9315969b4052306dea89f6457d9ed07b8f3e4ed97d2faf"

    url "https://github.com/opengeos/GeoLibre/releases/download/v#{version}/GeoLibre.Desktop_#{version}_x64.dmg",
        verified: "github.com/opengeos/GeoLibre/"
  end

  name "GeoLibre Desktop"
  desc "Lightweight, cloud-native GIS platform"
  homepage "https://geolibre.app/"

  app "GeoLibre Desktop.app"

  zap trash: [
    "~/Library/Application Support/org.geolibre.desktop",
    "~/Library/Caches/org.geolibre.desktop",
    "~/Library/Preferences/org.geolibre.desktop.plist",
    "~/Library/Saved Application State/org.geolibre.desktop.savedState",
    "~/Library/WebKit/org.geolibre.desktop",
  ]
end
