class Wiremd < Formula
  desc "Text-first UI design tool - Create wireframes using Markdown"
  homepage "https://github.com/akonan/wiremd"
  url "https://registry.npmjs.org/wiremd/-/wiremd-0.1.5.tgz"
  sha256 "38b8f216e9e7998394a088f4fbcf77acbfdb08d4df892d5ac7540476c8c9c9ee"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # Test that the command runs and shows version
    assert_match "wiremd", shell_output("#{bin}/wiremd --version")

    # Create a test markdown file
    (testpath/"test.md").write <<~EOS
      # Test Wireframe

      ## Button
      [Click Me]
    EOS

    # Generate HTML
    system bin/"wiremd", "test.md", "-o", "test.html"
    assert_predicate testpath/"test.html", :exist?
  end
end
