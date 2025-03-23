{
  description = "A flake for running video analysis with ezTrack.";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
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
        python = pkgs.python39;
        jupyter = pkgs.python39Packages.jupyter;
        numpy = pkgs.python39Packages.numpy;
        scipy = pkgs.python39Packages.scipy;
        pandas = pkgs.python39Packages.pandas;
        opencv = pkgs.python39Packages.opencv4;
        holoviews = pkgs.python39Packages.holoviews;
        bokeh = pkgs.python39Packages.bokeh;
        pyviz-comms = pkgs.python39Packages.pyviz-comms;
        jinja2 = pkgs.python39Packages.jinja2;
        scikit-learn = pkgs.python39Packages.scikit-learn;
        matplotlib = pkgs.python39Packages.matplotlib;
        tqdm = pkgs.python39Packages.tqdm;
      });
    };
}

