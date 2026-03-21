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
