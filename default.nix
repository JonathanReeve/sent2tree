with import <nixpkgs> {};


( let

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

    ete3 = callPackage ./ete3.nix { };

in pkgs.python3.buildEnv.override rec {
    extraLibs = with pkgs.python3Packages; [
      pandas
      newAltair
      # altair
      plotly
      ete3
      spacy
      spacy_models.en_core_web_lg
      pipenv
    ];
  }).env
