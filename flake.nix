{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/21.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { flake-utils, nixpkgs, self }:
    flake-utils.lib.eachDefaultSystem (system: {
      packages = with nixpkgs.legacyPackages."${system}"; rec {
        erlang_24 = erlang.overrideAttrs (oldAttrs: rec {
          name = "erlang-${version}";
          version = "24.3.3";

          src = fetchFromGitHub {
            owner = "erlang";
            repo = "otp";
            rev = "OTP-${version}";
            sha256 = "06f4g71d9k225mca8smcpgjc4f820lmb9dywswyqrygqabq2ffwm";
          };

          configureFlags = oldAttrs.configureFlags
            ++ [ "--with-ssl=${lib.getOutput "out" openssl}" ]
            ++ [ "--with-ssl-incl=${lib.getDev openssl}" ];
        });

        elixir_1_13 = elixir.overrideAttrs (oldAttrs: rec {
          name = "elixir-${version}";
          version = "1.13.4";

          buildInputs = [ erlang_24 ];

          src = fetchFromGitHub {
            owner = "elixir-lang";
            repo = "elixir";
            rev = "v${version}";
            sha256 = "1z19hwnv7czmg3p56hdk935gqxig3x7z78yxckh8fs1kdkmslqn4";
          };

          nativeBuildInputs = oldAttrs.nativeBuildInputs or [ ]
            ++ [ makeWrapper ];
        });
      };

      devShell = with nixpkgs.legacyPackages."${system}";
        mkShell {
          buildInputs = with self.packages."${system}"; [
            elixir_1_13
            erlang_24
          ];
        };
    });
}
