// Auto-generated. Do not edit!

// (in-package operation_modes.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class OperationModes {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.code = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('code')) {
        this.code = initObj.code
      }
      else {
        this.code = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OperationModes
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [code]
    bufferOffset = _serializer.uint8(obj.code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OperationModes
    let len;
    let data = new OperationModes(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [code]
    data.code = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'operation_modes/OperationModes';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '974ab5f9fea522ccc10c633de9ff6821';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    uint8 OPERATION_MODE_STOP = 0
    uint8 OPERATION_MODE_PRESENT = 1
    uint8 OPERATION_MODE_ROTATE_360 = 2
    uint8 OPERATION_MODE_STAY_CLOSE = 3
    uint8 OPERATION_MODE_STAY_AWAY = 4
    uint8 OPERATION_MODE_FOLLOW = 5
    
    uint8 OPERATION_MODE_GO_TO_ORIGIN = 9
    
    uint8 OPERATION_MODE_RIGHT_HAND = 14
    uint8 OPERATION_MODE_LEFT_HAND = 15
    
    uint8 OPERATION_MODE_SAVE_LOG = 89
    
    uint8 code
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
    const resolved = new OperationModes(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.code !== undefined) {
      resolved.code = msg.code;
    }
    else {
      resolved.code = 0
    }

    return resolved;
    }
};

// Constants for message
OperationModes.Constants = {
  OPERATION_MODE_STOP: 0,
  OPERATION_MODE_PRESENT: 1,
  OPERATION_MODE_ROTATE_360: 2,
  OPERATION_MODE_STAY_CLOSE: 3,
  OPERATION_MODE_STAY_AWAY: 4,
  OPERATION_MODE_FOLLOW: 5,
  OPERATION_MODE_GO_TO_ORIGIN: 9,
  OPERATION_MODE_RIGHT_HAND: 14,
  OPERATION_MODE_LEFT_HAND: 15,
  OPERATION_MODE_SAVE_LOG: 89,
}

module.exports = OperationModes;
