; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=amdgcn -mcpu=gfx942 | FileCheck %s -check-prefix=GFX942
; RUN: llc < %s -mtriple=amdgcn -mcpu=gfx1200 | FileCheck %s -check-prefix=GFX12

declare <2 x half> @llvm.amdgcn.ds.fadd.v2f16(ptr addrspace(3) %ptr, <2 x half> %data, i32, i32, i1)
declare <2 x i16> @llvm.amdgcn.ds.fadd.v2bf16(ptr addrspace(3) %ptr, <2 x i16> %data)

define amdgpu_kernel void @flat_atomic_fadd_f32_noret_pat(ptr %ptr) {
; GFX942-LABEL: flat_atomic_fadd_f32_noret_pat:
; GFX942:       ; %bb.0:
; GFX942-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x24
; GFX942-NEXT:    v_mov_b32_e32 v2, 4.0
; GFX942-NEXT:    s_waitcnt lgkmcnt(0)
; GFX942-NEXT:    v_mov_b64_e32 v[0:1], s[0:1]
; GFX942-NEXT:    buffer_wbl2 sc0 sc1
; GFX942-NEXT:    flat_atomic_add_f32 v[0:1], v2 sc1
; GFX942-NEXT:    s_waitcnt vmcnt(0) lgkmcnt(0)
; GFX942-NEXT:    buffer_inv sc0 sc1
; GFX942-NEXT:    s_endpgm
;
; GFX12-LABEL: flat_atomic_fadd_f32_noret_pat:
; GFX12:       ; %bb.0:
; GFX12-NEXT:    s_load_b64 s[0:1], s[4:5], 0x24
; GFX12-NEXT:    v_mov_b32_e32 v2, 4.0
; GFX12-NEXT:    s_wait_kmcnt 0x0
; GFX12-NEXT:    v_dual_mov_b32 v0, s0 :: v_dual_mov_b32 v1, s1
; GFX12-NEXT:    global_wb scope:SCOPE_SYS
; GFX12-NEXT:    s_wait_storecnt 0x0
; GFX12-NEXT:    flat_atomic_add_f32 v[0:1], v2 scope:SCOPE_SYS
; GFX12-NEXT:    s_wait_storecnt_dscnt 0x0
; GFX12-NEXT:    global_inv scope:SCOPE_SYS
; GFX12-NEXT:    s_endpgm
  %ret = atomicrmw fadd ptr %ptr, float 4.0 seq_cst, !amdgpu.no.remote.memory !0
  ret void
}

define amdgpu_kernel void @flat_atomic_fadd_f32_noret_pat_ieee(ptr %ptr) #0 {
; GFX942-LABEL: flat_atomic_fadd_f32_noret_pat_ieee:
; GFX942:       ; %bb.0:
; GFX942-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x24
; GFX942-NEXT:    v_mov_b32_e32 v2, 4.0
; GFX942-NEXT:    s_waitcnt lgkmcnt(0)
; GFX942-NEXT:    v_mov_b64_e32 v[0:1], s[0:1]
; GFX942-NEXT:    buffer_wbl2 sc0 sc1
; GFX942-NEXT:    flat_atomic_add_f32 v[0:1], v2 sc1
; GFX942-NEXT:    s_waitcnt vmcnt(0) lgkmcnt(0)
; GFX942-NEXT:    buffer_inv sc0 sc1
; GFX942-NEXT:    s_endpgm
;
; GFX12-LABEL: flat_atomic_fadd_f32_noret_pat_ieee:
; GFX12:       ; %bb.0:
; GFX12-NEXT:    s_load_b64 s[0:1], s[4:5], 0x24
; GFX12-NEXT:    v_mov_b32_e32 v2, 4.0
; GFX12-NEXT:    s_wait_kmcnt 0x0
; GFX12-NEXT:    v_dual_mov_b32 v0, s0 :: v_dual_mov_b32 v1, s1
; GFX12-NEXT:    global_wb scope:SCOPE_SYS
; GFX12-NEXT:    s_wait_storecnt 0x0
; GFX12-NEXT:    flat_atomic_add_f32 v[0:1], v2 scope:SCOPE_SYS
; GFX12-NEXT:    s_wait_storecnt_dscnt 0x0
; GFX12-NEXT:    global_inv scope:SCOPE_SYS
; GFX12-NEXT:    s_endpgm
  %ret = atomicrmw fadd ptr %ptr, float 4.0 seq_cst, !amdgpu.no.remote.memory !0
  ret void
}
define float @flat_atomic_fadd_f32_rtn_pat(ptr %ptr, float %data) {
; GFX942-LABEL: flat_atomic_fadd_f32_rtn_pat:
; GFX942:       ; %bb.0:
; GFX942-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX942-NEXT:    v_mov_b32_e32 v2, 4.0
; GFX942-NEXT:    buffer_wbl2 sc0 sc1
; GFX942-NEXT:    flat_atomic_add_f32 v0, v[0:1], v2 sc0 sc1
; GFX942-NEXT:    s_waitcnt vmcnt(0) lgkmcnt(0)
; GFX942-NEXT:    buffer_inv sc0 sc1
; GFX942-NEXT:    s_setpc_b64 s[30:31]
;
; GFX12-LABEL: flat_atomic_fadd_f32_rtn_pat:
; GFX12:       ; %bb.0:
; GFX12-NEXT:    s_wait_loadcnt_dscnt 0x0
; GFX12-NEXT:    s_wait_expcnt 0x0
; GFX12-NEXT:    s_wait_samplecnt 0x0
; GFX12-NEXT:    s_wait_bvhcnt 0x0
; GFX12-NEXT:    s_wait_kmcnt 0x0
; GFX12-NEXT:    v_mov_b32_e32 v2, 4.0
; GFX12-NEXT:    global_wb scope:SCOPE_SYS
; GFX12-NEXT:    s_wait_storecnt 0x0
; GFX12-NEXT:    flat_atomic_add_f32 v0, v[0:1], v2 th:TH_ATOMIC_RETURN scope:SCOPE_SYS
; GFX12-NEXT:    s_wait_loadcnt_dscnt 0x0
; GFX12-NEXT:    global_inv scope:SCOPE_SYS
; GFX12-NEXT:    s_wait_loadcnt 0x0
; GFX12-NEXT:    s_setpc_b64 s[30:31]
  %ret = atomicrmw fadd ptr %ptr, float 4.0 seq_cst, !amdgpu.no.remote.memory !0
  ret float %ret
}

define amdgpu_kernel void @local_atomic_fadd_v2f16_noret(ptr addrspace(3) %ptr, <2 x half> %data) {
; GFX942-LABEL: local_atomic_fadd_v2f16_noret:
; GFX942:       ; %bb.0:
; GFX942-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x24
; GFX942-NEXT:    s_waitcnt lgkmcnt(0)
; GFX942-NEXT:    v_mov_b32_e32 v0, s0
; GFX942-NEXT:    v_mov_b32_e32 v1, s1
; GFX942-NEXT:    ds_pk_add_f16 v0, v1
; GFX942-NEXT:    s_waitcnt lgkmcnt(0)
; GFX942-NEXT:    s_endpgm
;
; GFX12-LABEL: local_atomic_fadd_v2f16_noret:
; GFX12:       ; %bb.0:
; GFX12-NEXT:    s_load_b64 s[0:1], s[4:5], 0x24
; GFX12-NEXT:    s_wait_kmcnt 0x0
; GFX12-NEXT:    v_dual_mov_b32 v0, s0 :: v_dual_mov_b32 v1, s1
; GFX12-NEXT:    ds_pk_add_f16 v0, v1
; GFX12-NEXT:    s_wait_dscnt 0x0
; GFX12-NEXT:    global_inv scope:SCOPE_SE
; GFX12-NEXT:    s_endpgm
  %ret = call <2 x half> @llvm.amdgcn.ds.fadd.v2f16(ptr addrspace(3) %ptr, <2 x half> %data, i32 0, i32 0, i1 0)
  ret void
}

define <2 x half> @local_atomic_fadd_v2f16_rtn(ptr addrspace(3) %ptr, <2 x half> %data) {
; GFX942-LABEL: local_atomic_fadd_v2f16_rtn:
; GFX942:       ; %bb.0:
; GFX942-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX942-NEXT:    ds_pk_add_rtn_f16 v0, v0, v1
; GFX942-NEXT:    s_waitcnt lgkmcnt(0)
; GFX942-NEXT:    s_setpc_b64 s[30:31]
;
; GFX12-LABEL: local_atomic_fadd_v2f16_rtn:
; GFX12:       ; %bb.0:
; GFX12-NEXT:    s_wait_loadcnt_dscnt 0x0
; GFX12-NEXT:    s_wait_expcnt 0x0
; GFX12-NEXT:    s_wait_samplecnt 0x0
; GFX12-NEXT:    s_wait_bvhcnt 0x0
; GFX12-NEXT:    s_wait_kmcnt 0x0
; GFX12-NEXT:    s_wait_storecnt 0x0
; GFX12-NEXT:    ds_pk_add_rtn_f16 v0, v0, v1
; GFX12-NEXT:    s_wait_dscnt 0x0
; GFX12-NEXT:    global_inv scope:SCOPE_SE
; GFX12-NEXT:    s_wait_loadcnt 0x0
; GFX12-NEXT:    s_setpc_b64 s[30:31]
  %ret = call <2 x half> @llvm.amdgcn.ds.fadd.v2f16(ptr addrspace(3) %ptr, <2 x half> %data, i32 0, i32 0, i1 0)
  ret <2 x half> %ret
}

define amdgpu_kernel void @local_atomic_fadd_v2bf16_noret(ptr addrspace(3) %ptr, <2 x i16> %data) {
; GFX942-LABEL: local_atomic_fadd_v2bf16_noret:
; GFX942:       ; %bb.0:
; GFX942-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x24
; GFX942-NEXT:    s_waitcnt lgkmcnt(0)
; GFX942-NEXT:    v_mov_b32_e32 v0, s0
; GFX942-NEXT:    v_mov_b32_e32 v1, s1
; GFX942-NEXT:    ds_pk_add_bf16 v0, v1
; GFX942-NEXT:    s_waitcnt lgkmcnt(0)
; GFX942-NEXT:    s_endpgm
;
; GFX12-LABEL: local_atomic_fadd_v2bf16_noret:
; GFX12:       ; %bb.0:
; GFX12-NEXT:    s_load_b64 s[0:1], s[4:5], 0x24
; GFX12-NEXT:    s_wait_kmcnt 0x0
; GFX12-NEXT:    v_dual_mov_b32 v0, s0 :: v_dual_mov_b32 v1, s1
; GFX12-NEXT:    ds_pk_add_bf16 v0, v1
; GFX12-NEXT:    s_wait_dscnt 0x0
; GFX12-NEXT:    global_inv scope:SCOPE_SE
; GFX12-NEXT:    s_endpgm
  %ret = call <2 x i16> @llvm.amdgcn.ds.fadd.v2bf16(ptr addrspace(3) %ptr, <2 x i16> %data)
  ret void
}

define <2 x i16> @local_atomic_fadd_v2bf16_rtn(ptr addrspace(3) %ptr, <2 x i16> %data) {
; GFX942-LABEL: local_atomic_fadd_v2bf16_rtn:
; GFX942:       ; %bb.0:
; GFX942-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX942-NEXT:    ds_pk_add_rtn_bf16 v0, v0, v1
; GFX942-NEXT:    s_waitcnt lgkmcnt(0)
; GFX942-NEXT:    s_setpc_b64 s[30:31]
;
; GFX12-LABEL: local_atomic_fadd_v2bf16_rtn:
; GFX12:       ; %bb.0:
; GFX12-NEXT:    s_wait_loadcnt_dscnt 0x0
; GFX12-NEXT:    s_wait_expcnt 0x0
; GFX12-NEXT:    s_wait_samplecnt 0x0
; GFX12-NEXT:    s_wait_bvhcnt 0x0
; GFX12-NEXT:    s_wait_kmcnt 0x0
; GFX12-NEXT:    s_wait_storecnt 0x0
; GFX12-NEXT:    ds_pk_add_rtn_bf16 v0, v0, v1
; GFX12-NEXT:    s_wait_dscnt 0x0
; GFX12-NEXT:    global_inv scope:SCOPE_SE
; GFX12-NEXT:    s_wait_loadcnt 0x0
; GFX12-NEXT:    s_setpc_b64 s[30:31]
  %ret = call <2 x i16> @llvm.amdgcn.ds.fadd.v2bf16(ptr addrspace(3) %ptr, <2 x i16> %data)
  ret <2 x i16> %ret
}

attributes #0 = { "denormal-fp-math-f32"="ieee,ieee" }

!0 = !{}
