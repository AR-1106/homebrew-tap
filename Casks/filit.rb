cask "filit" do
  version "0.1.2"
  sha256 "a751815db8cc365c48a26df931304e5b6131d664678c874818fa2bfc5faf8f62"

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
