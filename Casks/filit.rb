cask "filit" do
  version "0.1.0"
  sha256 "40b2ed6886b3860af93e67d080145d8127471dce777086debb11cdb5e4985160"

  url "https://github.com/AR-1106/filit/releases/download/v#{version}/Filit-#{version}.zip"
  name "Filit"
  desc "Smart paste powered by TypeSafe"
  homepage "https://github.com/AR-1106/filit"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Filit.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-cr", "{{appdir}}/Filit.app"],
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Filit",
    "~/Library/Preferences/com.filit.app.plist",
  ]

  caveats <<~EOS
    Filit needs Accessibility permission to read fields and paste.
    Grant access in:
      System Settings → Privacy & Security → Accessibility

    Add your TypeSafe API key in Filit → Settings.
  EOS
end
