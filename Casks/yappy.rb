# Homebrew cask for Yappy. Lives in the tap repository (slackers-dev/homebrew-tap,
# as Casks/yappy.rb); release.sh fills in version and sha256.
#
#   brew install --cask slackers-dev/tap/yappy
cask "yappy" do
  version "0.1"
  sha256 "ffa63b0eee1c30112bd1d52ddcf28e82c509db1cd81820d08ec740e6557f5a81"

  url "https://github.com/slackers-dev/yappy/releases/download/v#{version}/Yappy-#{version}.zip"
  name "Yappy"
  desc "Menu bar app that reads selected text and Claude Code announcements aloud"
  homepage "https://github.com/slackers-dev/yappy"

  depends_on macos: :sonoma

  app "Yappy.app"

  uninstall quit: "dev.slackers.yappy"

  zap trash: [
    "~/Library/Application Support/Yappy",
    "~/Library/Preferences/dev.slackers.yappy.plist",
  ]

  caveats <<~EOS
    Yappy needs two permissions in System Settings → Privacy & Security:
    Accessibility (to read the selected text) and Screen Recording (to read a
    screen area). It asks on first launch; quit and reopen Yappy afterwards.
  EOS
end
