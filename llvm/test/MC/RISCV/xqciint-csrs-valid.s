# Xqciint - Qualcomm uC Custom CSRs
# RUN: llvm-mc %s -triple=riscv32 -mattr=+experimental-xqciint -riscv-no-aliases -show-encoding \
# RUN:     | FileCheck -check-prefixes=CHECK-ENC  %s
# RUN: llvm-mc -filetype=obj -triple riscv32 -mattr=+experimental-xqciint < %s \
# RUN:     | llvm-objdump --mattr=+experimental-xqciint -M no-aliases -d - \
# RUN:     | FileCheck -check-prefix=CHECK-INST %s

csrrs t2, qc.mncause, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x20,0x7c]
// CHECK-INST: csrrs    t2, qc.mncause, zero
csrrs t2, 0x7C2, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x20,0x7c]
// CHECK-INST: csrrs    t2, qc.mncause, zero

csrrs t2, qc.mclicip0, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x00,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicip0, zero
csrrs t2, 0x7F0, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x00,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicip0, zero

csrrs t2, qc.mclicip1, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x10,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicip1, zero
csrrs t2, 0x7F1, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x10,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicip1, zero

csrrs t2, qc.mclicip2, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x20,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicip2, zero
csrrs t2, 0x7F2, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x20,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicip2, zero

csrrs t2, qc.mclicip3, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x30,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicip3, zero
csrrs t2, 0x7F3, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x30,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicip3, zero

csrrs t2, qc.mclicip4, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x40,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicip4, zero
csrrs t2, 0x7F4, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x40,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicip4, zero

csrrs t2, qc.mclicip5, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x50,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicip5, zero
csrrs t2, 0x7F5, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x50,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicip5, zero

csrrs t2, qc.mclicip6, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x60,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicip6, zero
csrrs t2, 0x7F6, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x60,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicip6, zero

csrrs t2, qc.mclicip7, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x70,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicip7, zero
csrrs t2, 0x7F7, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x70,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicip7, zero

csrrs t2, qc.mclicie0, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x80,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicie0, zero
csrrs t2, 0x7F8, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x80,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicie0, zero

csrrs t2, qc.mclicie1, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x90,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicie1, zero
csrrs t2, 0x7F9, zero
// CHECK-ENC: encoding: [0xf3,0x23,0x90,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicie1, zero

csrrs t2, qc.mclicie2, zero
// CHECK-ENC: encoding: [0xf3,0x23,0xa0,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicie2, zero
csrrs t2, 0x7FA, zero
// CHECK-ENC: encoding: [0xf3,0x23,0xa0,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicie2, zero

csrrs t2, qc.mclicie3, zero
// CHECK-ENC: encoding: [0xf3,0x23,0xb0,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicie3, zero
csrrs t2, 0x7FB, zero
// CHECK-ENC: encoding: [0xf3,0x23,0xb0,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicie3, zero

csrrs t2, qc.mclicie4, zero
// CHECK-ENC: encoding: [0xf3,0x23,0xc0,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicie4, zero
csrrs t2, 0x7FC, zero
// CHECK-ENC: encoding: [0xf3,0x23,0xc0,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicie4, zero

csrrs t2, qc.mclicie5, zero
// CHECK-ENC: encoding: [0xf3,0x23,0xd0,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicie5, zero
csrrs t2, 0x7FD, zero
// CHECK-ENC: encoding: [0xf3,0x23,0xd0,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicie5, zero

csrrs t2, qc.mclicie6, zero
// CHECK-ENC: encoding: [0xf3,0x23,0xe0,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicie6, zero
csrrs t2, 0x7FE, zero
// CHECK-ENC: encoding: [0xf3,0x23,0xe0,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicie6, zero

csrrs t2, qc.mclicie7, zero
// CHECK-ENC: encoding: [0xf3,0x23,0xf0,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicie7, zero
csrrs t2, 0x7FF, zero
// CHECK-ENC: encoding: [0xf3,0x23,0xf0,0x7f]
// CHECK-INST: csrrs    t2, qc.mclicie7, zero
