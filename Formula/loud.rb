class Loud < Formula
  desc "Terminal-first AI agent (LOUD) — self-hosted, cross-platform, permission-aware"
  homepage "https://loud.codes"
  url "https://github.com/loud-codes/loud-cli/archive/refs/heads/main.tar.gz"
  version "1.9.4"
  sha256 "6bc7bcb973f5703f0be0687d0c9539a86c1ef17bdccbe30182c2d98778f7afdb"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = libexec/"venv"
    system Formula["python@3.12"].opt_bin/"python3.12", "-m", "venv", venv
    system venv/"bin/pip", "install", "--quiet", "--upgrade", "pip", "httpx"
    system venv/"bin/pip", "install", "--quiet", "scrapling[fetchers]"

    libexec.install "cli/loud.py"

    (bin/"loud").write <<~SH
      #!/bin/bash
      exec "#{venv}/bin/python3" "#{libexec}/loud.py" "$@"
    SH
    chmod 0755, bin/"loud"
  end

  test do
    assert_match "loud", shell_output("#{bin}/loud --version")
  end
end
