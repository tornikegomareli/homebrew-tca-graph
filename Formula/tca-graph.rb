class TcaGraph < Formula
  desc "Visualize and lint TCA Swift codebases"
  homepage "https://github.com/tornikegomareli/tca-graph"
  url "https://github.com/tornikegomareli/tca-graph/releases/download/0.5.3/tca-graph-0.5.3-macos-arm64.tar.gz"
  sha256 "9f711d2e0c76bf82d5814a26a996a93d6c4acaf3ffdff6ecf4a584cb10d7db67"
  version "0.5.3"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    # Binary plus its SPM resource bundle. Bundle.module finds the viewer when
    # the .bundle stays adjacent to the binary, so we install both into bin/.
    bin.install "bin/tca-graph"
    if File.directory?("bin/tca-graph_TCAGraphCLI.bundle")
      bin.install "bin/tca-graph_TCAGraphCLI.bundle"
    end
    # Conventional Homebrew share/ path is also populated as a fallback that
    # findViewerDist consults if Bundle.module returns nothing.
    if File.directory?("share/tca-graph/viewer")
      (share/"tca-graph").install "share/tca-graph/viewer"
    end
  end

  test do
    output = shell_output("#{bin}/tca-graph 2>&1", 1)
    assert_match "tca-graph", output
  end
end
