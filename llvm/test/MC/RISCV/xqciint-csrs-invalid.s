# Xqciint - Qualcomm uC Custom CSRs
# RUN: not llvm-mc -triple riscv32 -mattr=-experimental-xqciint < %s 2>&1 \
# RUN:         | FileCheck -check-prefixes=CHECK-FEATURE %s

csrrs t2, qc.mncause, zero
// CHECK-FEATURE: :[[@LINE-1]]:11: error: system register 'qc.mncause' requires 'experimental-xqciint' to be enabled

csrrs t2, qc.mclicip0, zero
// CHECK-FEATURE: :[[@LINE-1]]:11: error: system register 'qc.mclicip0' requires 'experimental-xqciint' to be enabled

csrrs t2, qc.mclicip1, zero
// CHECK-FEATURE: :[[@LINE-1]]:11: error: system register 'qc.mclicip1' requires 'experimental-xqciint' to be enabled

csrrs t2, qc.mclicip2, zero
// CHECK-FEATURE: :[[@LINE-1]]:11: error: system register 'qc.mclicip2' requires 'experimental-xqciint' to be enabled

csrrs t2, qc.mclicip3, zero
// CHECK-FEATURE: :[[@LINE-1]]:11: error: system register 'qc.mclicip3' requires 'experimental-xqciint' to be enabled

csrrs t2, qc.mclicip4, zero
// CHECK-FEATURE: :[[@LINE-1]]:11: error: system register 'qc.mclicip4' requires 'experimental-xqciint' to be enabled

csrrs t2, qc.mclicip5, zero
// CHECK-FEATURE: :[[@LINE-1]]:11: error: system register 'qc.mclicip5' requires 'experimental-xqciint' to be enabled

csrrs t2, qc.mclicip6, zero
// CHECK-FEATURE: :[[@LINE-1]]:11: error: system register 'qc.mclicip6' requires 'experimental-xqciint' to be enabled

csrrs t2, qc.mclicip7, zero
// CHECK-FEATURE: :[[@LINE-1]]:11: error: system register 'qc.mclicip7' requires 'experimental-xqciint' to be enabled

csrrs t2, qc.mclicie0, zero
// CHECK-FEATURE: :[[@LINE-1]]:11: error: system register 'qc.mclicie0' requires 'experimental-xqciint' to be enabled

csrrs t2, qc.mclicie1, zero
// CHECK-FEATURE: :[[@LINE-1]]:11: error: system register 'qc.mclicie1' requires 'experimental-xqciint' to be enabled

csrrs t2, qc.mclicie2, zero
// CHECK-FEATURE: :[[@LINE-1]]:11: error: system register 'qc.mclicie2' requires 'experimental-xqciint' to be enabled

csrrs t2, qc.mclicie3, zero
// CHECK-FEATURE: :[[@LINE-1]]:11: error: system register 'qc.mclicie3' requires 'experimental-xqciint' to be enabled

csrrs t2, qc.mclicie4, zero
// CHECK-FEATURE: :[[@LINE-1]]:11: error: system register 'qc.mclicie4' requires 'experimental-xqciint' to be enabled

csrrs t2, qc.mclicie5, zero
// CHECK-FEATURE: :[[@LINE-1]]:11: error: system register 'qc.mclicie5' requires 'experimental-xqciint' to be enabled

csrrs t2, qc.mclicie6, zero
// CHECK-FEATURE: :[[@LINE-1]]:11: error: system register 'qc.mclicie6' requires 'experimental-xqciint' to be enabled

csrrs t2, qc.mclicie7, zero
// CHECK-FEATURE: :[[@LINE-1]]:11: error: system register 'qc.mclicie7' requires 'experimental-xqciint' to be enabled
