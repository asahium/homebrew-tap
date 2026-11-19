cask "inni" do
  version "0.1.0"
  sha256 "d304fb5f9e45a6fce9fff4327677dbd1b90afb0aa87b1ac881e1b27c1d0786a8"

  url "https://github.com/asahium/inni/releases/download/v#{version}/Inni-#{version}.dmg"
  name "Inni"
  desc "Anki-compatible flashcards with AnkiWeb sync"
  homepage "https://asahium.github.io/inni/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Inni.app"

  # The app is ad-hoc signed, not notarized; without this Gatekeeper refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "Inni.app"],
                          chdir: "Inni.app/..", writable_paths: ["Inni.app"], writable_base: :appdir
  end

  zap trash: [
    "~/Library/Application Support/Inni",
    "~/Library/Caches/dev.inni.app",
    "~/Library/Preferences/dev.inni.app.plist",
  ]
end
