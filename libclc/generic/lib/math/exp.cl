//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include <clc/clc.h>
#include <clc/clcmacro.h>
#include <clc/math/math.h>

_CLC_OVERLOAD _CLC_DEF float exp(float x) {

    // Reduce x
    const float ln2HI = 0x1.62e300p-1f;
    const float ln2LO = 0x1.2fefa2p-17f;
    const float invln2 = 0x1.715476p+0f;

    float fhalF = x < 0.0f ? -0.5f : 0.5f;
    int p  = mad(x, invln2, fhalF);
    float fp = (float)p;
    float hi = mad(fp, -ln2HI, x); // t*ln2HI is exact here
    float lo = -fp*ln2LO;

    // Evaluate poly
    float t = hi + lo;
    float tt  = t*t;
    float v = mad(tt,
                  -mad(tt,
                       mad(tt,
                           mad(tt,
                               mad(tt, 0x1.637698p-25f, -0x1.bbd41cp-20f),
                               0x1.1566aap-14f),
                           -0x1.6c16c2p-9f),
                       0x1.555556p-3f),
                  t);

    float y = 1.0f - (((-lo) - MATH_DIVIDE(t * v, 2.0f - v)) - hi);

    // Scale by 2^p
    float r =  as_float(as_int(y) + (p << 23));

    const float ulim =  0x1.62e430p+6f; // ln(largest_normal) = 88.72283905206835305366
    const float llim = -0x1.5d589ep+6f; // ln(smallest_normal) = -87.33654475055310898657

    r = x < llim ? 0.0f : r;
    r = x < ulim ? r : as_float(0x7f800000);
    return isnan(x) ? x : r;
}

_CLC_UNARY_VECTORIZE(_CLC_OVERLOAD _CLC_DEF, float, exp, float)

#ifdef cl_khr_fp64

#include "exp_helper.h"

#pragma OPENCL EXTENSION cl_khr_fp64 : enable

_CLC_OVERLOAD _CLC_DEF double exp(double x) {

    const double X_MIN = -0x1.74910d52d3051p+9; // -1075*ln(2)
    const double X_MAX = 0x1.62e42fefa39efp+9; // 1024*ln(2)
    const double R_64_BY_LOG2 = 0x1.71547652b82fep+6; // 64/ln(2)
    const double R_LOG2_BY_64_LD = 0x1.62e42fefa0000p-7; // head ln(2)/64
    const double R_LOG2_BY_64_TL = 0x1.cf79abc9e3b39p-46; // tail ln(2)/64

    int n = convert_int(x * R_64_BY_LOG2);
    double r = fma(-R_LOG2_BY_64_TL, (double)n, fma(-R_LOG2_BY_64_LD, (double)n, x));
    return __clc_exp_helper(x, X_MIN, X_MAX, r, n);
}

_CLC_UNARY_VECTORIZE(_CLC_OVERLOAD _CLC_DEF, double, exp, double)

#endif

#ifdef cl_khr_fp16

#pragma OPENCL EXTENSION cl_khr_fp16 : enable

_CLC_DEFINE_UNARY_BUILTIN_FP16(exp)

#endif
