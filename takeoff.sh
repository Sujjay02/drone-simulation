echo "arming"
ros2 service call /$UAV_NAME/hw_api/arming std_srvs/srv/SetBool '{"data": true}'

sleep 1.0

echo "toggling offboard"
ros2 service call /$UAV_NAME/offboard std_srvs/srv/Trigger '{}'

sleep 1.0

# ----------------------------------------------------
# *** NEW: The actual takeoff command- added service calls***
# ----------------------------------------------------
echo "commanding takeoff to 1.5m"
ros2 service call /$UAV_NAME/control_manager/takeoff mrs_msgs/srv/Vec4 "{goal: {x: 0.0, y: 0.0, z: 1.5, yaw: 0.0}}"