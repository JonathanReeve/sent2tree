{ pkgs, lib, stdenv }:

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
        pyqt5
        xcffib
      ];


      nativeBuildInputs = with pkgs; [
        xorg.libxcb
        # qt5Full
        qt5.full
        qtcreator
        qt5.wrapQtAppsHook
      ];

      nativeInputs = [ pkgs.qt5.wrapQtAppsHook ];

      doCheck = false;

      # Not sure if this is correct
      passthru = {
        qt = pkgs.qt5.full;
      };

}
