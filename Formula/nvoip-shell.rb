class NvoipShell < Formula
  desc "Shell scripts for integrating with the Nvoip API v2"
  homepage "https://www.nvoip.com.br/"
  url "https://github.com/Nvoip/nvoip-shell/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2a100a3f5754f5d9cefdcdb709f136e56d33889a9cfa51b9e0fe9f015f1c1dc9"
  license "GPL-3.0-only"

  depends_on "curl"

  def install
    libexec.install "lib"
    libexec.install "examples"
    libexec.install "Scripts"
    bin.install_symlink libexec/"examples/create-access-token.sh" => "nvoip-create-access-token"
    bin.install_symlink libexec/"examples/get-balance.sh" => "nvoip-get-balance"
    bin.install_symlink libexec/"examples/send-sms.sh" => "nvoip-send-sms"
    bin.install_symlink libexec/"examples/create-call.sh" => "nvoip-create-call"
    bin.install_symlink libexec/"examples/send-otp.sh" => "nvoip-send-otp"
    bin.install_symlink libexec/"examples/check-otp.sh" => "nvoip-check-otp"
    bin.install_symlink libexec/"examples/list-whatsapp-templates.sh" => "nvoip-list-whatsapp-templates"
    bin.install_symlink libexec/"examples/send-whatsapp-template.sh" => "nvoip-send-whatsapp-template"
  end

  test do
    assert_path_exists libexec/"lib/nvoip.sh"
    assert_match "NVOIP", shell_output("grep -n NVOIP #{libexec}/lib/nvoip.sh")
  end
end
