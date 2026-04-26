cask "shoo" do
  version "1.0.0"
  sha256 "529c0bf670b7bfc1937d1d17a7ddce4a913a20bea7dcca6715100f51b6d59a95"

  url "https://github.com/AR-1106/Shoo/releases/download/v#{version}/Shoo.dmg",
      verified: "github.com/AR-1106/Shoo/"
  name "Shoo"
  desc "Close and manage windows directly from Mission Control"
  homepage "https://github.com/AR-1106/Shoo"

  depends_on macos: ">= :ventura"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Shoo.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Shoo.app"]
  end

  caveats <<~EOS
    Shoo requires Accessibility permissions to function.
    After installation, grant access in:
      System Settings → Privacy & Security → Accessibility
  EOS

  zap trash: [
    "~/Library/Preferences/com.arjunr.Shoo.plist",
  ]
end
