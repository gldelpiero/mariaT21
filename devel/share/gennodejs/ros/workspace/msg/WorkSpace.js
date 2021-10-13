// Auto-generated. Do not edit!

// (in-package workspace.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class WorkSpace {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.child_observation_distance = null;
      this.child_area = null;
      this.robot_bounds_proximity = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('child_observation_distance')) {
        this.child_observation_distance = initObj.child_observation_distance
      }
      else {
        this.child_observation_distance = 0.0;
      }
      if (initObj.hasOwnProperty('child_area')) {
        this.child_area = initObj.child_area
      }
      else {
        this.child_area = 0;
      }
      if (initObj.hasOwnProperty('robot_bounds_proximity')) {
        this.robot_bounds_proximity = initObj.robot_bounds_proximity
      }
      else {
        this.robot_bounds_proximity = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WorkSpace
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [child_observation_distance]
    bufferOffset = _serializer.float64(obj.child_observation_distance, buffer, bufferOffset);
    // Serialize message field [child_area]
    bufferOffset = _serializer.uint8(obj.child_area, buffer, bufferOffset);
    // Serialize message field [robot_bounds_proximity]
    bufferOffset = _serializer.float64(obj.robot_bounds_proximity, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WorkSpace
    let len;
    let data = new WorkSpace(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [child_observation_distance]
    data.child_observation_distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [child_area]
    data.child_area = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [robot_bounds_proximity]
    data.robot_bounds_proximity = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 17;
  }

  static datatype() {
    // Returns string type for a message object
    return 'workspace/WorkSpace';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e89ba90aefce0514a1a6081c2178f0d2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 CHILD_AREA_EXTERNAL = 0
    uint8 CHILD_AREA_OBSERVATION = 1
    uint8 CHILD_AREA_INTERACTION = 2
    
    Header  header
    float64 child_observation_distance
    uint8   child_area
    float64 robot_bounds_proximity
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WorkSpace(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.child_observation_distance !== undefined) {
      resolved.child_observation_distance = msg.child_observation_distance;
    }
    else {
      resolved.child_observation_distance = 0.0
    }

    if (msg.child_area !== undefined) {
      resolved.child_area = msg.child_area;
    }
    else {
      resolved.child_area = 0
    }

    if (msg.robot_bounds_proximity !== undefined) {
      resolved.robot_bounds_proximity = msg.robot_bounds_proximity;
    }
    else {
      resolved.robot_bounds_proximity = 0.0
    }

    return resolved;
    }
};

// Constants for message
WorkSpace.Constants = {
  CHILD_AREA_EXTERNAL: 0,
  CHILD_AREA_OBSERVATION: 1,
  CHILD_AREA_INTERACTION: 2,
}

module.exports = WorkSpace;
