cask "kveikur" do
  version "0.2.0"
  sha256 "f40a4eea7ab4502031143ff03caf554934b87ccfcf78da11c7b7617501d03caa"

  url "https://github.com/asahium/kveikur/releases/download/v#{version}/Kveikur-#{version}.dmg"
  name "Kveikur"
  desc "Music player for folder-based libraries with vim keys and bit-perfect playback"
  homepage "https://asahium.github.io/kveikur/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "Kveikur.app"

  # The app is ad-hoc signed, not notarized; without this Gatekeeper refuses to open it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Kveikur.app"]
  end

  zap trash: [
    "~/Library/Application Support/Kveikur",
    "~/Library/Caches/dev.kveikur.player",
    "~/Library/Logs/Kveikur",
    "~/Library/Preferences/dev.kveikur.player.plist",
  ]
end
