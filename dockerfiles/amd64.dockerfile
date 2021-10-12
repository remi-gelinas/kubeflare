ARG RUST_IMAGE=docker.io/library/rust:1.55.0
ARG RUNTIME_IMAGE=gcr.io/distroless/cc

FROM $RUST_IMAGE as build
ARG TARGETARCH
WORKDIR /build
COPY Cargo.toml Cargo.lock ./ /build/
RUN --mount=type=cache,target=target \
    --mount=type=cache,from=rust:1.55.0,source=/usr/local/cargo,target=/usr/local/cargo \
    cargo build --locked --target=x86_64-unknown-linux-gnu --release --package=kubeflare-controller && \
    mv target/x86_64-unknown-linux-gnu/release/kubeflare-controller /tmp/

FROM $RUNTIME_IMAGE
COPY --from=build /tmp/kubeflare-controller /bin/
ENTRYPOINT ["/bin/kubeflare-controller"]