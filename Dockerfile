# We would rather use Alpine, but we want ARM64 and misses
# aarch64 musl binaries from the Rover project.
FROM debian:stable-slim as installer

COPY entrypoint.sh /entrypoint.sh
# install script needs curl or wget
RUN apt update && apt install -y curl;\
    curl -sSL https://rover.apollo.dev/nix/v0.18.1 | sh;\
    chmod +x /entrypoint.sh; 

ENV PATH="/root/.rover/bin:${PATH}"

ENTRYPOINT ["/entrypoint.sh"]