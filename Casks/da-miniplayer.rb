cask "da-miniplayer" do
  version "1.1.1"
  sha256 "0ee2e9939e41e001ace14d8e66472455e5cccdd1f6b4d9f01ac67aec93917f16"

  url "https://github.com/peds24/dA-spotify-miniplayer/releases/download/v#{version}/DAMiniPlayer-v#{version}.zip"
  name "DA Mini Player"
  desc "Floating, always-on-top Spotify mini player for macOS"
  homepage "https://github.com/peds24/dA-spotify-miniplayer"

  depends_on macos: :ventura

  app "DAMiniPlayer.app"

  postflight_steps do
    # Alpha build, ad-hoc signed (no paid Apple Developer identity yet) — clear
    # the quarantine flag Homebrew's download sets, or Gatekeeper blocks the
    # first launch with "cannot be opened because it is from an unidentified
    # developer."
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/DAMiniPlayer.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.pedro.da-miniplayer.plist",
  ]
end
