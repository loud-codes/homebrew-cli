class Loud < Formula
  desc "Terminal-first AI agent for builders (web dev, scraping, ops)"
  homepage "https://loud.codes"
  url "https://github.com/loud-codes/loud-cli/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  sha256 "cf775e25ea04d586f573869f0199cf714e2d95bbe85565a1b9376bf5ce6dbd30"
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

  test do
    assert_match "LOUD", shell_output("#{bin}/loud --help")
  end
end
