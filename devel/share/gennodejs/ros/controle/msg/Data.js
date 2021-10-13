// Auto-generated. Do not edit!

// (in-package controle.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Distance = require('./Distance.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.distance = null;
      this.angle = null;
      this.proxemic_zone = null;
      this.workspace_area = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = new Distance();
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0.0;
      }
      if (initObj.hasOwnProperty('proxemic_zone')) {
        this.proxemic_zone = initObj.proxemic_zone
      }
      else {
        this.proxemic_zone = 0;
      }
      if (initObj.hasOwnProperty('workspace_area')) {
        this.workspace_area = initObj.workspace_area
      }
      else {
        this.workspace_area = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Data
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [distance]
    bufferOffset = Distance.serialize(obj.distance, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = _serializer.float32(obj.angle, buffer, bufferOffset);
    // Serialize message field [proxemic_zone]
    bufferOffset = _serializer.uint8(obj.proxemic_zone, buffer, bufferOffset);
    // Serialize message field [workspace_area]
    bufferOffset = _serializer.uint8(obj.workspace_area, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Data
    let len;
    let data = new Data(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [distance]
    data.distance = Distance.deserialize(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [proxemic_zone]
    data.proxemic_zone = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [workspace_area]
    data.workspace_area = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 18;
  }

  static datatype() {
    // Returns string type for a message object
    return 'controle/Data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8e71096c455d398c228a2768f716cf97';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    controle/Distance distance
    float32 angle
    uint8 PROXEMIC_ZONE_PUBLIC = 0
    uint8 PROXEMIC_ZONE_SOCIAL_PUBLIC = 1
    uint8 PROXEMIC_ZONE_SOCIAL = 2
    uint8 PROXEMIC_ZONE_PERSONAL_SOCIAL = 3
    uint8 PROXEMIC_ZONE_PERSONAL = 4
    uint8 proxemic_zone
    uint8 WORKSPACE_AREA_EXTERNAL = 0
    uint8 WORKSPACE_AREA_OBSERVATION = 1
    uint8 WORKSPACE_AREA_INTERACTION = 2
    uint8 workspace_area
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
    
    ================================================================================
    MSG: controle/Distance
    float32 desired
    float32 observation
    float32 current
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Data(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.distance !== undefined) {
      resolved.distance = Distance.Resolve(msg.distance)
    }
    else {
      resolved.distance = new Distance()
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0.0
    }

    if (msg.proxemic_zone !== undefined) {
      resolved.proxemic_zone = msg.proxemic_zone;
    }
    else {
      resolved.proxemic_zone = 0
    }

    if (msg.workspace_area !== undefined) {
      resolved.workspace_area = msg.workspace_area;
    }
    else {
      resolved.workspace_area = 0
    }

    return resolved;
    }
};

// Constants for message
Data.Constants = {
  PROXEMIC_ZONE_PUBLIC: 0,
  PROXEMIC_ZONE_SOCIAL_PUBLIC: 1,
  PROXEMIC_ZONE_SOCIAL: 2,
  PROXEMIC_ZONE_PERSONAL_SOCIAL: 3,
  PROXEMIC_ZONE_PERSONAL: 4,
  WORKSPACE_AREA_EXTERNAL: 0,
  WORKSPACE_AREA_OBSERVATION: 1,
  WORKSPACE_AREA_INTERACTION: 2,
}

module.exports = Data;
