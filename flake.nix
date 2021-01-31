{
  description = "Substrate telemetry backend";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/release-20.09;

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };

      rustPlatform.buildRustPackage {
        pname = "substrate-telemetry-backend";
        version = "0.2.1";

        src = ./backend;

        nativeBuildInputs = [ pkg-config ];
        buildInputs = [ openssl ];

        cargoSha256 = "sha256-GczrMtSYNT979Tzup/92CoTJmNT8Pvy8O7syAu8EQPE=";

        # https://github.com/asymmetric/substrate-telemetry/runs/1773146154?check_suite_focus=true#step:5:493
        doCheck = false;
      };
  };
}
