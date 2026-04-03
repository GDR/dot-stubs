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
              tls = {
                enable               = mkEnableOption "Consul TLS (stub)";
                caFile               = mkOption { type = types.str; default = "/run/certs/consul/ca.pem"; };
                certFile             = mkOption { type = types.str; default = "/run/certs/consul/cert.pem"; };
                keyFile              = mkOption { type = types.str; default = "/run/certs/consul/key.pem"; };
                verifyIncoming       = mkOption { type = types.bool; default = true; };
                verifyOutgoing       = mkOption { type = types.bool; default = true; };
                verifyServerHostname = mkOption { type = types.bool; default = true; };
              };
            };
            nomad = {
              enable = mkEnableOption "Nomad (stub)";
              server = mkOption { type = types.bool; default = false; };
              client = mkOption { type = types.bool; default = false; };
              datacenter = mkOption { type = types.str; default = ""; };
              gossipKeyFile = mkOption { type = types.nullOr types.path; default = null; };
              vaultAddr = mkOption { type = types.nullOr types.str; default = null; };
              tls = {
                enable               = mkEnableOption "Nomad TLS (stub)";
                caFile               = mkOption { type = types.str; default = "/run/certs/nomad/ca.pem"; };
                certFile             = mkOption { type = types.str; default = "/run/certs/nomad/cert.pem"; };
                keyFile              = mkOption { type = types.str; default = "/run/certs/nomad/key.pem"; };
                httpTls              = mkOption { type = types.bool; default = true; };
                rpcTls               = mkOption { type = types.bool; default = true; };
                verifyServerHostname = mkOption { type = types.bool; default = true; };
              };
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
              tls = {
                enable   = mkEnableOption "Vault TLS (stub)";
                certFile = mkOption { type = types.str; default = "/run/certs/vault/cert.pem"; };
                keyFile  = mkOption { type = types.str; default = "/run/certs/vault/key.pem"; };
                caFile   = mkOption { type = types.str; default = "/run/certs/vault/ca.pem"; };
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
              tls = {
                enable               = mkEnableOption "Consul TLS (stub)";
                caFile               = mkOption { type = types.str; default = "/run/certs/consul/ca.pem"; };
                certFile             = mkOption { type = types.str; default = "/run/certs/consul/cert.pem"; };
                keyFile              = mkOption { type = types.str; default = "/run/certs/consul/key.pem"; };
                verifyIncoming       = mkOption { type = types.bool; default = true; };
                verifyOutgoing       = mkOption { type = types.bool; default = true; };
                verifyServerHostname = mkOption { type = types.bool; default = true; };
              };
            };
            nomad = {
              enable = mkEnableOption "Nomad client (stub)";
              client = mkOption { type = types.bool; default = false; };
              datacenter = mkOption { type = types.str; default = ""; };
              serverJoin = mkOption { type = types.listOf types.str; default = [ ]; };
              gossipKeyFile = mkOption { type = types.nullOr types.path; default = null; };
              vaultAddr = mkOption { type = types.nullOr types.str; default = null; };
              tls = {
                enable               = mkEnableOption "Nomad TLS (stub)";
                caFile               = mkOption { type = types.str; default = "/run/certs/nomad/ca.pem"; };
                certFile             = mkOption { type = types.str; default = "/run/certs/nomad/cert.pem"; };
                keyFile              = mkOption { type = types.str; default = "/run/certs/nomad/key.pem"; };
                httpTls              = mkOption { type = types.bool; default = true; };
                rpcTls               = mkOption { type = types.bool; default = true; };
                verifyServerHostname = mkOption { type = types.bool; default = true; };
              };
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
            serviceAddr = mkOption { type = types.str; default = ""; };
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
            tls = {
              enable   = mkEnableOption "Vault TLS (stub)";
              certFile = mkOption { type = types.str; default = "/run/certs/vault/cert.pem"; };
              keyFile  = mkOption { type = types.str; default = "/run/certs/vault/key.pem"; };
              caFile   = mkOption { type = types.str; default = "/run/certs/vault/ca.pem"; };
            };
          };
        };

      # Vault Agent — mTLS cert delivery sidecar
      vault-agent = { lib, ... }:
        let inherit (lib) mkOption types mkEnableOption; in {
          options.services.vantage.vault-agent = {
            enable              = mkEnableOption "Vault Agent (stub)";
            vaultAddr           = mkOption { type = types.str; default = ""; };
            appRoleId           = mkOption { type = types.str; default = ""; };
            appRoleSecretIdFile = mkOption { type = types.str; default = ""; };
            tlsDir              = mkOption { type = types.str; default = "/run/certs"; };
            certTTL             = mkOption { type = types.str; default = "24h"; };
            consulCert          = mkOption { type = types.bool; default = false; };
            nomadCert           = mkOption { type = types.bool; default = false; };
            vaultCert           = mkOption { type = types.bool; default = false; };
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
