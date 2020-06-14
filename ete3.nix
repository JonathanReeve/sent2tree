{ pkgs, lib }:

pkgs.python3Packages.buildPythonPackage rec {

      pname = "ete3";
      version = "3.1.1";

      src = pkgs.python3Packages.fetchPypi {
        inherit version; inherit pname;
        sha256 = "11f3p5zkgjvsxi8kbscsaf286qx7vywwdiqk9gdgndka955ks2l7";
      };

      propagatedBuildInputs = with pkgs.python3Packages; [
        numpy
        lxml
        six
        pyqt4
        pyqt4.qt
        pyqt5
      ];


      nativeBuildInputs = with pkgs; [
        qt48Full
        xorg.libxcb
        qt4
        qt5.full
      ];

      doCheck = false;
      ignoreCollisions = true;

      # Not sure if this is correct
      passthru = {
        qt = pkgs.qt5.full;
      };

}
