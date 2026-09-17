cask "da-miniplayer" do
  version "1.0.0"
  sha256 "12f5b77458c4d1d474523a622122959e10b83e87bf08ab814d2a0b7ba36812c0"

  url "https://github.com/peds24/dA-spotify-miniplayer/releases/download/v#{version}/DAMiniPlayer-v#{version}.zip"
  name "DA Mini Player"
  desc "Floating, always-on-top Spotify mini player for macOS"
  homepage "https://github.com/peds24/dA-spotify-miniplayer"

  depends_on macos: ">= :ventura"

  app "DAMiniPlayer.app"

  postflight do
    # Alpha build, ad-hoc signed (no paid Apple Developer identity yet) — clear
    # the quarantine flag Homebrew's download sets, or Gatekeeper blocks the
    # first launch with "cannot be opened because it is from an unidentified
    # developer."
    system_command "/usr/bin/xattr",
                    args: ["-dr", "com.apple.quarantine", "#{appdir}/DAMiniPlayer.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.pedro.da-miniplayer.plist",
  ]
end
