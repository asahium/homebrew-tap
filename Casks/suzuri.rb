cask "suzuri" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.7.0"
  sha256 arm:   "3cbdfb1c861419966509747c0e1dc56712fc3123bf63b2071ed04748ca48c917",
         intel: "4d5622e30d215136e9cac25764ee823cd899c0a428d95d7c74dfc3fb1c41eb7f"

  url "https://github.com/harrywang/suzuri/releases/download/suzuri-v#{version}/suzuri-#{arch}.dmg"
  name "Suzuri"
  desc "Writing environment built on Zed (Markdown, LaTeX, Typst, Zotero)"
  homepage "https://suzuri.ai/"

  livecheck do
    url :url
    regex(/^suzuri[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Suzuri.app"

  zap trash: [
    "~/Library/Application Support/Suzuri",
    "~/Library/Caches/app.suzuri.Suzuri",
    "~/Library/HTTPStorages/app.suzuri.Suzuri",
    "~/Library/Preferences/app.suzuri.Suzuri.plist",
    "~/Library/Saved Application State/app.suzuri.Suzuri.savedState",
  ]
end
