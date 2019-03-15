{ pkgs ? (import <nixpkgs> {}), source ? ./., version ? "dev" }:

with pkgs;

stdenv.mkDerivation {
  name = "lhapdf-wrapper-test-${version}";
  src = lib.cleanSource source;
  nativeBuildInputs = [ lhapdf ];
  buildInputs = [ lhapdf.pdf_sets.NNPDF23_lo_as_0130_qed ];

  installPhase = ''
    mkdir -p $out/{bin,lib}
    cp -a testrun_lhapdf $out/bin
    cp -a lhapdfWrapper.a $out/lib
  '';
}
