cask "forgotthedongle" do
  version "1.0.1"
  sha256 "fcba1a996de5bac1f6e055cd936d5b66f0250c4cb1defce66cefeeefa2575b72"

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
