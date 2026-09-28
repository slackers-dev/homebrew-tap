cask "forgotthedongle" do
  version "1.1"
  sha256 "ec5a88c57b8bff7be42c7e6dc0f1aa48ad180fe10adfce68e9441cb820cc3d22"

  url "https://github.com/slackers-dev/homebrew-tap/releases/download/v#{version}/ForgotTheDongle-#{version}.dmg"
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
