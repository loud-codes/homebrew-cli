class Loud < Formula
  desc "Terminal-first AI agent (LOUD) — self-hosted, cross-platform, permission-aware"
  homepage "https://loud.codes"
  url "https://github.com/loud-codes/loud-cli/archive/refs/heads/main.tar.gz"
  version "1.1.2"
  sha256 "925d2909130d057d2b35d6340ee38baa72a2196bc67c9a1cf25825b1f6c4203d"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = libexec/"venv"
    system Formula["python@3.12"].opt_bin/"python3.12", "-m", "venv", venv
    system venv/"bin/pip", "install", "--quiet", "--upgrade", "pip"
    system venv/"bin/pip", "install", "--quiet", "httpx"

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

      Docs: https://loud.codes
    EOS
  end

  test do
    assert_match "loud", shell_output("#{bin}/loud --version")
  end
end
