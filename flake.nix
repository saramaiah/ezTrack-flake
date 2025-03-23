{
  description = "A flake for running video analysis with ezTrack.";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = {
    self,
    nixpkgs,
  }:
    let
      supportedSystems = [
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      eachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f (import nixpkgs {inherit system;}));
    in {
      packages = eachSupportedSystem (pkgs: {
        python = pkgs.python313;
        jupyter = pkgs.jupyter-all;
        numpy = pkgs.python313Packages.numpy;
        scipy = pkgs.python313Packages.scipy;
        pandas = pkgs.python313Packages.pandas;
        opencv = pkgs.python313Packages.opencv4;
        holoviews = pkgs.python313Packages.holoviews;
        bokeh = pkgs.python313Packages.bokeh;
        pyviz-comms = pkgs.python313Packages.pyviz-comms;
        jinja2 = pkgs.python313Packages.jinja2;
        scikit-learn = pkgs.python313Packages.scikit-learn;
        matplotlib = pkgs.python313Packages.matplotlib;
        tqdm = pkgs.python313Packages.tqdm;
        pycryptodome = pkgs.python313Packages.pycryptodome;
      });
    };
}

