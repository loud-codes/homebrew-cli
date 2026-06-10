class Loud < Formula
  desc "Terminal-first AI agent (LOUD) — self-hosted, cross-platform, permission-aware"
  homepage "https://loud.codes"
  url "https://github.com/loud-codes/loud-cli/archive/refs/heads/main.tar.gz"
  version "1.9.6"
  sha256 "69b4efca4529102c00a844d9c267d660ea70595a3cf4341f4b6e92730e179282"
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
