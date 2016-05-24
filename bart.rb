class Bart < Formula
  desc "Image-reconstruction toolbox for computational MRI"
  homepage "https://mrirecon.github.io/bart/"
  version "0.3.01"
  url "https://github.com/mrirecon/bart/archive/v#{version}.tar.gz"
  sha256 "3c34b28ce3151f7f1ffe23b16fb0014123668b22e316b842e32ec125a079d09a"

  option "with-cuda", "Do GPU computing with CUDA"
  option "with-serial", "Do serial computing by turning off OpenMP"

  depends_on "fftw"
  depends_on "gcc"
  depends_on "homebrew/science/openblas"
  depends_on "homebrew/versions/libpng12"

  def install
    ENV["CC"] = "gcc-5"
    ENV["MACPORTS"] = "0"
    ENV["CUDA"] = "1" if build.with? "cuda"
    ENV["OMP"] = "0" if build.with? "serial"
    system "make"
    bin.install "bart"
  end
end
