class Bart < Formula
  desc "Image-reconstruction toolbox for computational MRI"
  homepage "https://mrirecon.github.io/bart/"
  version "0.4.03"
  url "https://github.com/mrirecon/bart/archive/v#{version}.tar.gz"

  option "with-cuda", "Do GPU computing with CUDA"
  option "with-serial", "Do serial computing by turning off OpenMP"

  depends_on "fftw"
  depends_on "gcc@8"
  depends_on "openblas"
  depends_on "libpng"

  def install
    ENV["CC"] = "gcc-8"
    ENV["MACPORTS"] = "0"
    ENV["CUDA"] = "1" if build.with? "cuda"
    ENV["OMP"] = "1" if build.with? "serial"
    system "make"
    bin.install "bart"
  end
end
