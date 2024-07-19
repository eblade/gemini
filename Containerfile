FROM rust:slim-bookworm

LABEL maintainer="johan@egneblad.se"

RUN cargo install agate

CMD ["agate", "--content", "/content", "--addr", "0.0.0.0:1965", "--hostname", "johan.egneblad.se", "--certs", "/certs", "--serve-secret", "--lang", "en-US"]

# podman build -t gemini .
# podman run --volume ./certs:/certs --volume ./content:/content --publish 1965:1965 --name johan_gemini gemini
# (add :z to the mounts to run on an selinux system)
