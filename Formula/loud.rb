class Loud < Formula
  desc "Terminal-first AI agent (LOUD) — self-hosted, cross-platform, permission-aware"
  homepage "https://loud.codes"
  url "https://github.com/loud-codes/loud-cli/archive/refs/heads/main.tar.gz"
  version "1.6.12"
  sha256 "a16849f1770a6bc40b9cffd1b7e34d927f4eea1c7652cb370375287da9a9ce05"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = libexec/"venv"
    system Formula["python@3.12"].opt_bin/"python3.12", "-m", "venv", venv
    system venv/"bin/pip", "install", "--quiet", "--upgrade", "pip"
    system venv/"bin/pip", "install", "--quiet", "httpx"
    # Full GUI / browser / voice bundle — part of LOUD core, not optional.
    system venv/"bin/pip", "install", "--quiet",
           "playwright", "sounddevice", "numpy",
           "pyautogui", "pillow", "mss"
    # Scrapling: native scraper bundle (basic + stealth + dynamic). Pulls
    # lxml + curl_cffi + patchright + browserforge.
    system venv/"bin/pip", "install", "--quiet", "scrapling[fetchers]"
    # Chromium for playwright. Tolerated failure — user can `loud setup gui`
    # later if the network hiccups during brew install.
    system venv/"bin/python3", "-m", "playwright", "install", "chromium" rescue nil

    libexec.install Dir["cli/*"]

    (bin/"loud").write <<~SHIM
      #!/usr/bin/env bash
      exec "#{venv}/bin/python3" "#{libexec}/loud.py" "$@"
    SHIM
    chmod 0755, bin/"loud"
  end

  def caveats
    <<~EOS
      LOUD is invite-only while in private beta. After install:

        loud login       # use your LOUD username + password
        loud             # interactive REPL
        loud update      # self-update to the latest release

      First time LOUD wants to control the browser, mic, or take a screenshot,
      macOS will ask for Accessibility / Microphone / Screen Recording
      permission — grant it once in System Settings → Privacy.

      Docs: https://loud.codes
    EOS
  end

  test do
    assert_match "loud", shell_output("#{bin}/loud --version")
  end
end
