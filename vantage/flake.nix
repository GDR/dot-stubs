{
  description = "Stub for GDR/vantage — declares option interfaces without implementation";

  inputs = { };

  outputs = { self, ... }: {
    nixosModules = {
      # Profiles
      infra-server = { lib, ... }:
        let inherit (lib) mkOption types mkEnableOption; in {
          options.services.vantage = {
            consul = {
              enable = mkEnableOption "Consul (stub)";
              mode = mkOption { type = types.str; default = ""; };
              datacenter = mkOption { type = types.str; default = ""; };
              enableUi = mkOption { type = types.bool; default = false; };
              gossipKeyFile = mkOption { type = types.nullOr types.path; default = null; };
            };
            nomad = {
              enable = mkEnableOption "Nomad (stub)";
              server = mkOption { type = types.bool; default = false; };
              client = mkOption { type = types.bool; default = false; };
              datacenter = mkOption { type = types.str; default = ""; };
              gossipKeyFile = mkOption { type = types.nullOr types.path; default = null; };
              vaultAddr = mkOption { type = types.nullOr types.str; default = null; };
            };
            vault = {
              enable = mkEnableOption "Vault (stub)";
              bindInterface = mkOption { type = types.str; default = "tailscale0"; };
              clusterAddr = mkOption { type = types.str; default = ""; };
              storageDir = mkOption { type = types.str; default = "/var/lib/vault/raft"; };
              enableUi = mkOption { type = types.bool; default = true; };
              gcpKms = {
                enable = mkOption { type = types.bool; default = false; };
                project = mkOption { type = types.str; default = ""; };
                region = mkOption { type = types.str; default = "global"; };
                keyRing = mkOption { type = types.str; default = "vault"; };
                cryptoKey = mkOption { type = types.str; default = "unseal"; };
                credentialsFile = mkOption { type = types.nullOr types.str; default = null; };
              };
            };
          };
        };
      infra-client = { lib, ... }:
        let inherit (lib) mkOption types mkEnableOption; in {
          options.services.vantage = {
            consul = {
              enable = mkEnableOption "Consul client (stub)";
              mode = mkOption { type = types.str; default = ""; };
              datacenter = mkOption { type = types.str; default = ""; };
              retryJoin = mkOption { type = types.listOf types.str; default = [ ]; };
              gossipKeyFile = mkOption { type = types.nullOr types.path; default = null; };
            };
            nomad = {
              enable = mkEnableOption "Nomad client (stub)";
              client = mkOption { type = types.bool; default = false; };
              datacenter = mkOption { type = types.str; default = ""; };
              serverJoin = mkOption { type = types.listOf types.str; default = [ ]; };
              gossipKeyFile = mkOption { type = types.nullOr types.path; default = null; };
              vaultAddr = mkOption { type = types.nullOr types.str; default = null; };
            };
          };
        };

      # DNS forwarding
      consul-dns = { lib, ... }:
        let inherit (lib) mkOption types mkEnableOption; in {
          options.services.vantage.consul-dns = {
            enable = mkEnableOption "Consul DNS (stub)";
            nameserver = mkOption { type = types.str; default = "127.0.0.1"; };
          };
        };

      # Remote builder
      remote-builder = { ... }: { };

      # Vault (standalone — also included in infra-server profile)
      vault = { lib, ... }:
        let inherit (lib) mkOption types mkEnableOption; in {
          options.services.vantage.vault = {
            enable = mkEnableOption "Vault (stub)";
            bindInterface = mkOption { type = types.str; default = "tailscale0"; };
            clusterAddr = mkOption { type = types.str; default = ""; };
            storageDir = mkOption { type = types.str; default = "/var/lib/vault/raft"; };
            enableUi = mkOption { type = types.bool; default = true; };
            gcpKms = {
              enable = mkOption { type = types.bool; default = false; };
              project = mkOption { type = types.str; default = ""; };
              region = mkOption { type = types.str; default = "global"; };
              keyRing = mkOption { type = types.str; default = "vault"; };
              cryptoKey = mkOption { type = types.str; default = "unseal"; };
              credentialsFile = mkOption { type = types.nullOr types.str; default = null; };
            };
          };
        };
    };

    darwinModules = {
      consul-dns = { lib, ... }:
        let inherit (lib) mkOption types mkEnableOption; in {
          options.services.vantage.consul-dns = {
            enable = mkEnableOption "Consul DNS (stub)";
            nameserver = mkOption { type = types.str; default = "127.0.0.1"; };
          };
        };
    };
  };
}
