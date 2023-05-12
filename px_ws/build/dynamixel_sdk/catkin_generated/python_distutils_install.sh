#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/Users/amoralesma/Documents/UN/robotica/labs/labrob-4/px_ws/src/dynamixel_sdk"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/Users/amoralesma/Documents/UN/robotica/labs/labrob-4/px_ws/install/lib/python3.9/site-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/Users/amoralesma/Documents/UN/robotica/labs/labrob-4/px_ws/install/lib/python3.9/site-packages:/Users/amoralesma/Documents/UN/robotica/labs/labrob-4/px_ws/build/dynamixel_sdk/lib/python3.9/site-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/Users/amoralesma/Documents/UN/robotica/labs/labrob-4/px_ws/build/dynamixel_sdk" \
    "/usr/local/Caskroom/miniforge/base/envs/ros-noetic-tools/bin/python3.9" \
    "/Users/amoralesma/Documents/UN/robotica/labs/labrob-4/px_ws/src/dynamixel_sdk/setup.py" \
     \
    build --build-base "/Users/amoralesma/Documents/UN/robotica/labs/labrob-4/px_ws/build/dynamixel_sdk" \
    install \
    --root="${DESTDIR-/}" \
     --prefix="/Users/amoralesma/Documents/UN/robotica/labs/labrob-4/px_ws/install" --install-scripts="/Users/amoralesma/Documents/UN/robotica/labs/labrob-4/px_ws/install/bin"
