#!/bin/bash

# Copyright (c) 2020 The FedVision Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# export Environment Variables
#   PYTHONPATH  Python default search path for module files, add Fedvision, PaddleFL, PaddleDetection
#   FEDVISION_PYTHON_EXECUTABLE python executable path, such as python | python3 | venv/bin/python

DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)"
PROJECT_BASE=$(dirname "${DIR}")
unset PYTHONPATH

DEPS_DIR="${PROJECT_BASE}/deps"
if [ -d "${DEPS_DIR}" ]; then
  # development layout
  export PYTHONPATH="${PROJECT_BASE}:${DEPS_DIR}/PaddleDetection:${DEPS_DIR}/PaddleFL/python:${PYTHONPATH}"
else
  export PYTHONPATH="${PROJECT_BASE}:${PYTHONPATH}"
fi

if [ -z "${FEDVISION_PYTHON_EXECUTABLE}" ]; then
  export FEDVISION_PYTHON_EXECUTABLE=
fi
