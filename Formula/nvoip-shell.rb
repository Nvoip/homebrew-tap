class NvoipShell < Formula
  desc "Shell scripts for integrating with the Nvoip API v3"
  homepage "https://www.nvoip.com.br/"
  # Immutable source reviewed in NN-5547; no tag/release is created by this PR.
  url "https://github.com/Nvoip/nvoip-shell/archive/71352c5bb548b241db218ca0a61691087794ba3d.tar.gz"
  version "1.0.0"
  sha256 "f52a4d6fbee984ba864f86a5e927a40ced95aa5357fe6f020ac87a5a08ec7671"
  license "GPL-3.0-only"

  depends_on "curl"

  def install
    libexec.install "lib"
    libexec.install "examples"
    libexec.install "Scripts"
    %w[
      create-access-token get-balance send-sms create-call send-otp check-otp
      list-whatsapp-templates send-whatsapp-template
    ].each do |name|
      command = bin/"nvoip-#{name}"
      command.write <<~SH
        #!/bin/sh
        exec /bin/sh "#{libexec}/examples/#{name}.sh" "$@"
      SH
      command.chmod 0755
    end
  end

  test do
    assert_path_exists libexec/"lib/nvoip.sh"
    assert_match "https://api.nvoip.com.br/v3", (libexec/"lib/nvoip.sh").read
    (testpath/"curl").write <<~EOS
      #!/bin/sh
      printf '%s\\n' "$@"
    EOS
    chmod 0755, testpath/"curl"
    with_env(PATH: "#{testpath}:#{ENV.fetch("PATH")}", NVOIP_ACCESS_TOKEN: "dummy") do
      output = shell_output("#{bin}/nvoip-get-balance")
      assert_match "https://api.nvoip.com.br/v3/balance", output
      assert_match "Authorization: Bearer dummy", output
    end
  end
end
