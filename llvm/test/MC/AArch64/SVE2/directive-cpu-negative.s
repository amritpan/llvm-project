// RUN: not llvm-mc -triple aarch64 -filetype asm -o - %s 2>&1 | FileCheck %s

.cpu generic+sve2
.cpu generic+nosve2
tbx z0.b, z1.b, z2.b
// CHECK: error: instruction requires: sve2 or sme
// CHECK-NEXT: tbx z0.b, z1.b, z2.b

.cpu generic+sve2-aes
.cpu generic+nosve2-aes
aesd z23.b, z23.b, z13.b
// CHECK: error: instruction requires: sve2-aes
// CHECK-NEXT: aesd z23.b, z23.b, z13.b

.cpu generic+sve2-sm4
.cpu generic+nosve2-sm4
sm4e z0.s, z0.s, z0.s
// CHECK: error: instruction requires: sve2-sm4
// CHECK-NEXT: sm4e z0.s, z0.s, z0.s

.cpu generic+sve2-sha3
.cpu generic+nosve2-sha3
rax1 z0.d, z0.d, z0.d
// CHECK: error: instruction requires: sve2-sha3
// CHECK-NEXT: rax1 z0.d, z0.d, z0.d

.cpu generic+sve2-bitperm
.cpu generic+nosve2-bitperm
bgrp z21.s, z10.s, z21.s
// CHECK: error: instruction requires: sve2-bitperm
// CHECK-NEXT: bgrp z21.s, z10.s, z21.s

.cpu generic+sve-bfscale
.cpu generic+nosve-bfscale
bfscale z0.h, p0/m, z0.h, z0.h
// CHECK: error: instruction requires: sve-bfscale
// CHECK-NEXT: bfscale z0.h, p0/m, z0.h, z0.h