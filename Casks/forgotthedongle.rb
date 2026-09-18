cask "forgotthedongle" do
  version "1.0"
  sha256 "4dbd1f512da224032e83e02b6fe6c801dd7c66324f678868f4431b225b6eea89"

  url "https://github.com/slackers-dev/homebrew-tap/releases/download/v#{version}/ForgotTheDongle-#{version}.dmg",
      verified: "github.com/slackers-dev/homebrew-tap/"
  name "ForgotTheDongle"
  desc "Use your iPhone as a mouse, trackpad or presenter remote"
  homepage "https://forgotthedongle.slackers.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "ForgotTheDongle.app"

  uninstall quit: "ch.forgotthedongle.mac"

  zap trash: [
    "~/Library/Preferences/ch.forgotthedongle.mac.plist",
    "~/Library/Saved Application State/ch.forgotthedongle.mac.savedState",
  ]

  caveats <<~EOS
    #{token} moves the pointer, so macOS asks for Accessibility access on first launch:
      System Settings > Privacy & Security > Accessibility
  EOS
end
