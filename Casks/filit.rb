cask "filit" do
  version "0.1.0"
  sha256 "bad71e65e60061a7cde7c5bf1513d846c577b9f2fe81d6287ba95987e4d8e20f"

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
    Open Filit from Applications or Spotlight. The welcome window
    walks through Accessibility and your TypeSafe API key.
  EOS
end
