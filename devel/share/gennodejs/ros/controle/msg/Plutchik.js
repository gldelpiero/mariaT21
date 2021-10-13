// Auto-generated. Do not edit!

// (in-package controle.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Plutchik {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.joy_sadness = null;
      this.surprise_anticipation = null;
      this.anger_fear = null;
      this.trust_disgust = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('joy_sadness')) {
        this.joy_sadness = initObj.joy_sadness
      }
      else {
        this.joy_sadness = 0;
      }
      if (initObj.hasOwnProperty('surprise_anticipation')) {
        this.surprise_anticipation = initObj.surprise_anticipation
      }
      else {
        this.surprise_anticipation = 0;
      }
      if (initObj.hasOwnProperty('anger_fear')) {
        this.anger_fear = initObj.anger_fear
      }
      else {
        this.anger_fear = 0;
      }
      if (initObj.hasOwnProperty('trust_disgust')) {
        this.trust_disgust = initObj.trust_disgust
      }
      else {
        this.trust_disgust = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Plutchik
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [joy_sadness]
    bufferOffset = _serializer.int8(obj.joy_sadness, buffer, bufferOffset);
    // Serialize message field [surprise_anticipation]
    bufferOffset = _serializer.int8(obj.surprise_anticipation, buffer, bufferOffset);
    // Serialize message field [anger_fear]
    bufferOffset = _serializer.int8(obj.anger_fear, buffer, bufferOffset);
    // Serialize message field [trust_disgust]
    bufferOffset = _serializer.int8(obj.trust_disgust, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Plutchik
    let len;
    let data = new Plutchik(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [joy_sadness]
    data.joy_sadness = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [surprise_anticipation]
    data.surprise_anticipation = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [anger_fear]
    data.anger_fear = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [trust_disgust]
    data.trust_disgust = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'controle/Plutchik';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3de017963cf6b074941410adf7783cb7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    int8 joy_sadness
    int8 surprise_anticipation
    int8 anger_fear
    int8 trust_disgust
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
    const resolved = new Plutchik(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.joy_sadness !== undefined) {
      resolved.joy_sadness = msg.joy_sadness;
    }
    else {
      resolved.joy_sadness = 0
    }

    if (msg.surprise_anticipation !== undefined) {
      resolved.surprise_anticipation = msg.surprise_anticipation;
    }
    else {
      resolved.surprise_anticipation = 0
    }

    if (msg.anger_fear !== undefined) {
      resolved.anger_fear = msg.anger_fear;
    }
    else {
      resolved.anger_fear = 0
    }

    if (msg.trust_disgust !== undefined) {
      resolved.trust_disgust = msg.trust_disgust;
    }
    else {
      resolved.trust_disgust = 0
    }

    return resolved;
    }
};

module.exports = Plutchik;
