cask "filit" do
  version "0.1.4"
  sha256 "3524f3569c7c8a80b2194bfedf644bce45de8e2cfb6f0fc4b86a452bb118d306"

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
        args:         ["-cr", "{appdir}/Filit.app"],
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
