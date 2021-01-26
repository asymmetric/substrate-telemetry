{
  description = "Substrate telemetry backend";

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };

      rustPlatform.buildRustPackage {
        pname = "substrate-telemetry";
        version = "0.2.1";

        src = self;

        buildInputs = [ openssl ];

        cargoSha256 = lib.fakeSha256;
      };
  };
}
