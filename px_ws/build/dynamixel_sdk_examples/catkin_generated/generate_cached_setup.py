# -*- coding: utf-8 -*-
from __future__ import print_function

import os
import stat
import sys

# find the import for catkin's python package - either from source space or from an installed underlay
if os.path.exists(os.path.join('/usr/local/Caskroom/miniforge/base/envs/ros-noetic-tools/share/catkin/cmake', 'catkinConfig.cmake.in')):
    sys.path.insert(0, os.path.join('/usr/local/Caskroom/miniforge/base/envs/ros-noetic-tools/share/catkin/cmake', '..', 'python'))
try:
    from catkin.environment_cache import generate_environment_script
except ImportError:
    # search for catkin package in all workspaces and prepend to path
    for workspace in '/Users/amoralesma/Documents/UN/robotica/labs/labrob-4/px_ws/devel;/usr/local/Caskroom/miniforge/base/envs/ros-noetic-tools'.split(';'):
        python_path = os.path.join(workspace, 'lib/python3.9/site-packages')
        if os.path.isdir(os.path.join(python_path, 'catkin')):
            sys.path.insert(0, python_path)
            break
    from catkin.environment_cache import generate_environment_script

code = generate_environment_script('/Users/amoralesma/Documents/UN/robotica/labs/labrob-4/px_ws/devel/.private/dynamixel_sdk_examples/env.sh')

output_filename = '/Users/amoralesma/Documents/UN/robotica/labs/labrob-4/px_ws/build/dynamixel_sdk_examples/catkin_generated/setup_cached.sh'
with open(output_filename, 'w') as f:
    # print('Generate script for cached setup "%s"' % output_filename)
    f.write('\n'.join(code))

mode = os.stat(output_filename).st_mode
os.chmod(output_filename, mode | stat.S_IXUSR)