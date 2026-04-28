class TcaGraph < Formula
  desc "Visualize and lint TCA Swift codebases"
  homepage "https://github.com/tornikegomareli/tca-graph"
  url "https://github.com/tornikegomareli/tca-graph/releases/download/0.5.1/tca-graph-0.5.1-macos-arm64.tar.gz"
  sha256 "8425d7c74da4490334ab578de1ae5ff03ddf5cdef400583a25401a1a66ad6774"
  version "0.5.1"
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
