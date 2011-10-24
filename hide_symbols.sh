#!/bin/bash -e
#
# Copyright (c) 2011 The Chromium Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# This script is used to modify libvpx assembly source files to add
# PRIVATE directive for global symbols.
# Run this script after source/libvpx has been replaced with the latest
# source.

find source/libvpx -type f -name '*.asm' | xargs -i sed -i -E 's/^\s*global\s+sym\(([a-zA-Z][a-zA-Z0-9_]*)\)\s*$/global sym(\1) PRIVATE/' {}
