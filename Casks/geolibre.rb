cask "geolibre" do
  version "3.2.0"

  on_arm do
    sha256 "edc7155b37bb149f30f01c76c37eff14964628976d875102865be5d1ef3b7102"

    url "https://github.com/opengeos/GeoLibre/releases/download/v#{version}/GeoLibre.Desktop_#{version}_aarch64.dmg",
        verified: "github.com/opengeos/GeoLibre/"
  end
  on_intel do
    sha256 "8c44b4c22b1d5ce526cd06621b7161140b7f4ebb8134df4a91b33958f103b363"

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
