{
  description = "Substrate telemetry backend";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/release-20.09;

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };

      rustPlatform.buildRustPackage {
        pname = "substrate-telemetry-backend";
        version = "0.2.1";

        src = ./.;

        buildInputs = [ openssl ];

        cargoSha256 = "sha256-yeU8PemuBTxU7O60eFQs3Nx6OdS/ALvRqDfWNtmVK7c";
      };
  };
}
