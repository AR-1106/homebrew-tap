cask "filit" do
  version "0.1.0"
  sha256 "8dd778def6dec577fe9c91c8aaa9493f19000a871674b39fa1c966501aeabea5"

  url "https://github.com/AR-1106/filit/releases/download/v#{version}/Filit-#{version}.zip",
      verified: "github.com/AR-1106/filit/"
  name "Filit"
  desc "Smart paste for macOS powered by TypeSafe"
  homepage "https://github.com/AR-1106/filit"

  depends_on macos: ">= :sonoma"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Filit.app"

  # Ad-hoc signed builds trip Gatekeeper quarantine; clear it after install
  # (same approach as other unsigned apps in this tap). Not a substitute for
  # Apple notarization — required for official homebrew/cask.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Filit.app"]
  end

  caveats <<~EOS
    Filit needs Accessibility permission to read fields and paste.
    Grant access in:
      System Settings → Privacy & Security → Accessibility

    Add your TypeSafe API key in Filit → Settings.

    This build is ad-hoc signed (not Apple-notarized). The cask clears
    quarantine after install so Gatekeeper should not block first launch.
  EOS

  zap trash: [
    "~/Library/Application Support/Filit",
    "~/Library/Preferences/com.filit.app.plist",
  ]
end
