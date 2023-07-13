{ pkgs ? import <nixpkgs> {} }:

let
  myAppEnv = pkgs.poetry2nix.mkPoetryEnv {
    python = pkgs.python311;
    projectDir = ./.;
    editablePackageSources = {
      my_python_nix_test = ./my_python_nix_test;
    };
    preferWheels = true;
  };
in myAppEnv.env.overrideAttrs (oldAttrs: {
  buildInputs = [
    # pkgs.poetry
    # (pkgs.poetry.override { python = pkgs.python311; })
  ];
  shellHook =
    ''
    ln -sfT $nativeBuildInputs ./venv
    '';
})
