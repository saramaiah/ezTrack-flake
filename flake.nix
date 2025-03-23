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
        python = pkgs.python39;
        jupyter = pkgs.python3.9-jupyter;
        numpy = pkgs.python3.9-numpy;
        scipy = pkgs.python3.9-scipy;
        pandas = pkgs.python3.9-pandas;
        opencv = pkgs.python3.9-opencv4;
        holoviews = pkgs.python3.9-holoviews;
        bokeh = pkgs.python3.9-bokeh;
        pyviz-comms = pkgs.python3.9-pyviz-comms;
        jinja2 = pkgs.python3.9-jinja2;
        scikit-learn = pkgs.python3.9-scikit-learn;
        matplotlib = pkgs.python3.9-matplotlib;
        tqdm = pkgs.python3.9-tqdm;
      });
    };
}

