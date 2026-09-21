cask "filit" do
  version "0.1.6"
  sha256 "ba32d8fc01de8eed82e4e4eca0ba88c2d7ae50b6d4af843655fc80a6004a8df4"

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
