with import <nixpkgs> {};


( let
    newPlotly = pkgs.python3Packages.buildPythonPackage rec {
      pname = "plotly";
      version = "4.6.0";

      src = pkgs.python3Packages.fetchPypi{
        inherit version; inherit pname;
        sha256 = "0br996lqbyq1prq9hhrzkgpicz5fgvxamzjrrpms20a2y1alkwv1";
      };

      buildInputs = with pkgs.python3Packages; [ decorator nbformat
                                                 pytz requests retrying six];
      doCheck = false;

    };

    newAltair = pkgs.python3Packages.buildPythonPackage rec {
      pname = "altair";
      version = "4.1.0";

      src = pkgs.python3Packages.fetchPypi{
        inherit version; inherit pname;
        sha256 = "0c99q5dy6f275yg1f137ird08wmwc1z8wmvjickkf2mvyka31p9y";
      };

      buildInputs = with pkgs.python3Packages; [
        entrypoints
        jinja2
        jsonschema
        numpy
        toolz
        pandas
      ];
      doCheck = false;

    };

    # ete3 = import ./requirements.nix { inherit pkgs; };

    ete3 = pkgs.python3Packages.buildPythonPackage rec {
      pname = "ete3";
      version = "3.1.1";

      src = pkgs.python3Packages.fetchPypi {
        inherit version; inherit pname;
        sha256 = "11f3p5zkgjvsxi8kbscsaf286qx7vywwdiqk9gdgndka955ks2l7";
      };

      buildInputs = with pkgs.python3Packages; [
        numpy
        pyqt5
        lxml
        six
        qt5.full
        qt5.qtx11extras
        qtcreator
      ];

      nativeBuildInputs = [ qt5.wrapQtAppsHook python3.pkgs.wrapPython ];

      doCheck = false;
     
    };

in pkgs.python3.buildEnv.override rec {
    extraLibs = with pkgs.python3Packages; [
	    matplotlib
      pandas
      jupyter
      scikitlearn
      newAltair
      # plotly
      newPlotly
      jupyterlab # Dev
      toolz # Needed by altair
      ete3
      spacy
      spacy_models.en_core_web_lg
      xorg.libxcb    # ETE3?
      pyqt5          # ETE3?
      qt5.full       # ETE3
      qtcreator      # ETE3
      qt5.qtx11extras # ETE3
    ];
  }).env
