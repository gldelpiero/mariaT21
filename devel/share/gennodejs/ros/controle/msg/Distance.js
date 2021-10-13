// Auto-generated. Do not edit!

// (in-package controle.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Distance {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.desired = null;
      this.observation = null;
      this.current = null;
    }
    else {
      if (initObj.hasOwnProperty('desired')) {
        this.desired = initObj.desired
      }
      else {
        this.desired = 0.0;
      }
      if (initObj.hasOwnProperty('observation')) {
        this.observation = initObj.observation
      }
      else {
        this.observation = 0.0;
      }
      if (initObj.hasOwnProperty('current')) {
        this.current = initObj.current
      }
      else {
        this.current = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Distance
    // Serialize message field [desired]
    bufferOffset = _serializer.float32(obj.desired, buffer, bufferOffset);
    // Serialize message field [observation]
    bufferOffset = _serializer.float32(obj.observation, buffer, bufferOffset);
    // Serialize message field [current]
    bufferOffset = _serializer.float32(obj.current, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Distance
    let len;
    let data = new Distance(null);
    // Deserialize message field [desired]
    data.desired = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [observation]
    data.observation = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [current]
    data.current = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'controle/Distance';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4895d7c7873380c6167cc39276347c1e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new Distance(null);
    if (msg.desired !== undefined) {
      resolved.desired = msg.desired;
    }
    else {
      resolved.desired = 0.0
    }

    if (msg.observation !== undefined) {
      resolved.observation = msg.observation;
    }
    else {
      resolved.observation = 0.0
    }

    if (msg.current !== undefined) {
      resolved.current = msg.current;
    }
    else {
      resolved.current = 0.0
    }

    return resolved;
    }
};

module.exports = Distance;
