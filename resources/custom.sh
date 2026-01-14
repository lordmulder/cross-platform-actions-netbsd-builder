#!/bin/sh

set -exu

export RUSTUP_HOME=/opt/rust/rustup
export CARGO_HOME=/opt/rust/cargo

# Add your additional provisioning here for custom VM images.
/usr/sbin/pkg_add -u
/usr/sbin/pkg_add git curl clang

mkdir -p /opt/sysroot/i386

curl -sSf https://cdn.netbsd.org/pub/NetBSD/NetBSD-10.1/i386/binary/sets/base.tgz | tar -C /opt/sysroot/i386 -xzf - lib usr/lib
curl -sSf https://cdn.netbsd.org/pub/NetBSD/NetBSD-10.1/i386/binary/sets/comp.tgz | tar -C /opt/sysroot/i386 -xzf - usr/lib
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain 1.92.0

 /opt/rust/cargo/bin/rustup component add rust-src

echo '#!/bin/sh' > /opt/rust/cargo/env
echo 'export PATH="/opt/rust/cargo/bin:$PATH"' >> /opt/rust/cargo/env
echo 'export RUSTUP_HOME=/opt/rust/rustup' >> /opt/rust/cargo/env
