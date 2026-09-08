checksum = "sha512:6b767b5aa2687f0091efdb6edf7770f84ddfc92e81d210d535276f859e9b6c709e0f5db324bfa546cdb11fedfe346d34f8cdb6ffc86fe8a8a6534aac0c435ad1"

# pkgsrc publishes no package set for this release at all: there is no `9.5`
# directory to redirect to a branch for the same ABI, the way `9.4` and earlier
# have, so the repository the installer derives from the release version is a
# 404. Point at the same quarterly branch the other 9.x images install from.
package_repository = "http://cdn.NetBSD.org/pub/pkgsrc/packages/NetBSD/x86_64/9.0_2026Q1/All"
