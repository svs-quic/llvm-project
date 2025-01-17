; RUN: llc -mtriple=hexagon < %s | FileCheck %s

; Check that this testcase compiles successfully.
; Because l2fetch has mayLoad/mayStore flags on it, the packetizer
; was tricked into thinking that it's a store. The v65-specific
; code dealing with mem_shuff allowed it to be packetized together
; with the load.

; CHECK: l2fetch

target triple = "hexagon"

@g0 = external global [32768 x i8], align 8
@g1 = external local_unnamed_addr global [15 x ptr], align 8

; Function Attrs: nounwind
define void @f0() local_unnamed_addr #0 {
b0:
  %ext = sext i8 ptrtoint (ptr getelementptr inbounds ([32768 x i8], ptr @g0, i32 0, i32 10000) to i8) to i32
  %and = and i32 %ext, -65536
  %ptr = inttoptr i32 %and to ptr
  store ptr %ptr, ptr getelementptr inbounds ([15 x ptr], ptr @g1, i32 0, i32 1), align 4
  store ptr %ptr, ptr getelementptr inbounds ([15 x ptr], ptr @g1, i32 0, i32 6), align 8
  tail call void @f1()
  %v0 = load ptr, ptr @g1, align 8
  tail call void @llvm.hexagon.Y5.l2fetch(ptr %v0, i64 -9223372036854775808)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.hexagon.Y5.l2fetch(ptr, i64) #1

; Function Attrs: nounwind
declare void @f1() #1

attributes #0 = { nounwind "target-cpu"="hexagonv65" }
attributes #1 = { nounwind }
