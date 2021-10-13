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

class Emotion {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.code = null;
      this.percentage = null;
      this.pleasure = null;
      this.arousal = null;
      this.dominance = null;
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
      if (initObj.hasOwnProperty('percentage')) {
        this.percentage = initObj.percentage
      }
      else {
        this.percentage = 0;
      }
      if (initObj.hasOwnProperty('pleasure')) {
        this.pleasure = initObj.pleasure
      }
      else {
        this.pleasure = 0;
      }
      if (initObj.hasOwnProperty('arousal')) {
        this.arousal = initObj.arousal
      }
      else {
        this.arousal = 0;
      }
      if (initObj.hasOwnProperty('dominance')) {
        this.dominance = initObj.dominance
      }
      else {
        this.dominance = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Emotion
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [code]
    bufferOffset = _serializer.uint8(obj.code, buffer, bufferOffset);
    // Serialize message field [percentage]
    bufferOffset = _serializer.uint8(obj.percentage, buffer, bufferOffset);
    // Serialize message field [pleasure]
    bufferOffset = _serializer.int8(obj.pleasure, buffer, bufferOffset);
    // Serialize message field [arousal]
    bufferOffset = _serializer.int8(obj.arousal, buffer, bufferOffset);
    // Serialize message field [dominance]
    bufferOffset = _serializer.int8(obj.dominance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Emotion
    let len;
    let data = new Emotion(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [code]
    data.code = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [percentage]
    data.percentage = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [pleasure]
    data.pleasure = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [arousal]
    data.arousal = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [dominance]
    data.dominance = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'controle/Emotion';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6710c8ff5d9ca3e0bda8d2c2af186861';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    uint8 EMOTION_ANGER = 0
    uint8 EMOTION_DISGUST = 1
    uint8 EMOTION_FEAR = 2
    uint8 EMOTION_HAPPINESS = 3
    uint8 EMOTION_SADNESS = 4
    uint8 EMOTION_SUSPRISE = 5
    uint8 EMOTION_TRUST = 6
    uint8 EMOTION_ANTICIPATION = 7
    uint8 code
    uint8 percentage
    
    int8 pleasure
    int8 arousal
    int8 dominance
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
    const resolved = new Emotion(null);
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

    if (msg.percentage !== undefined) {
      resolved.percentage = msg.percentage;
    }
    else {
      resolved.percentage = 0
    }

    if (msg.pleasure !== undefined) {
      resolved.pleasure = msg.pleasure;
    }
    else {
      resolved.pleasure = 0
    }

    if (msg.arousal !== undefined) {
      resolved.arousal = msg.arousal;
    }
    else {
      resolved.arousal = 0
    }

    if (msg.dominance !== undefined) {
      resolved.dominance = msg.dominance;
    }
    else {
      resolved.dominance = 0
    }

    return resolved;
    }
};

// Constants for message
Emotion.Constants = {
  EMOTION_ANGER: 0,
  EMOTION_DISGUST: 1,
  EMOTION_FEAR: 2,
  EMOTION_HAPPINESS: 3,
  EMOTION_SADNESS: 4,
  EMOTION_SUSPRISE: 5,
  EMOTION_TRUST: 6,
  EMOTION_ANTICIPATION: 7,
}

module.exports = Emotion;
