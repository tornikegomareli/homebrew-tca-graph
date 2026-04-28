class TcaGraph < Formula
  desc "Visualize and lint TCA Swift codebases"
  homepage "https://github.com/tornikegomareli/tca-graph"
  url "https://github.com/tornikegomareli/tca-graph/releases/download/0.5.2/tca-graph-0.5.2-macos-arm64.tar.gz"
  sha256 "2bf0c122e2245d97e9eccc38bfa07b74358d2d7461e829f0e7ebb00ba598fc1b"
  version "0.5.2"
  license :cannot_represent

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
