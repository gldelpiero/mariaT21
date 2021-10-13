Header header

# Is there a child?
bool detected

# If there is a child, contains the angle between the sensor and the child
# otherwise, contains 0
# angle is in (-180, 180] degrees
float64 angle

# If there is a child, contains the distance between the sensor and the child [in meters]
# otherwise, contains 0
# distance is in meters
float64 distance

# If there is a child, contais the global position of the child
# otherwise, contains (0, 0, 0)
general_functions/Position  child_position