#!/bin/bash
#sha256sum -> FIPS-180-2 -> mode: 1400
hashcat -m1400 --benchmark --optimized-kernel-enable
