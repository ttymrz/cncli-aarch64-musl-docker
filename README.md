# cncli-aarch64-musl-docker
Docker image for compiling static cncli-aarch64-musl binary

## Getting Started

### Build Docker image

```bash
docker build -t cncli-musl-cross .
```

### Cargo build

clone cncli repository.
```bash
git clone https://github.com/cardano-community/cncli.git
cd cncli
git checkout <tag>
```

build

```bash
docker run --rm -it -v "$(pwd)":/home/rust/src cncli-musl-cross cargo build --release
```

If you run docker as root, you need to change owner of cncli repository befor Cargo build.

```bash
sudo chown -R root:root <path>/cncli/
```
