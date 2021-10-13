# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from controle/Data.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import controle.msg
import std_msgs.msg

class Data(genpy.Message):
  _md5sum = "8e71096c455d398c228a2768f716cf97"
  _type = "controle/Data"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """Header header
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
float32 current"""
  # Pseudo-constants
  PROXEMIC_ZONE_PUBLIC = 0
  PROXEMIC_ZONE_SOCIAL_PUBLIC = 1
  PROXEMIC_ZONE_SOCIAL = 2
  PROXEMIC_ZONE_PERSONAL_SOCIAL = 3
  PROXEMIC_ZONE_PERSONAL = 4
  WORKSPACE_AREA_EXTERNAL = 0
  WORKSPACE_AREA_OBSERVATION = 1
  WORKSPACE_AREA_INTERACTION = 2

  __slots__ = ['header','distance','angle','proxemic_zone','workspace_area']
  _slot_types = ['std_msgs/Header','controle/Distance','float32','uint8','uint8']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,distance,angle,proxemic_zone,workspace_area

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Data, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.distance is None:
        self.distance = controle.msg.Distance()
      if self.angle is None:
        self.angle = 0.
      if self.proxemic_zone is None:
        self.proxemic_zone = 0
      if self.workspace_area is None:
        self.workspace_area = 0
    else:
      self.header = std_msgs.msg.Header()
      self.distance = controle.msg.Distance()
      self.angle = 0.
      self.proxemic_zone = 0
      self.workspace_area = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_4f2B().pack(_x.distance.desired, _x.distance.observation, _x.distance.current, _x.angle, _x.proxemic_zone, _x.workspace_area))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.distance is None:
        self.distance = controle.msg.Distance()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 18
      (_x.distance.desired, _x.distance.observation, _x.distance.current, _x.angle, _x.proxemic_zone, _x.workspace_area,) = _get_struct_4f2B().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_4f2B().pack(_x.distance.desired, _x.distance.observation, _x.distance.current, _x.angle, _x.proxemic_zone, _x.workspace_area))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.distance is None:
        self.distance = controle.msg.Distance()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 18
      (_x.distance.desired, _x.distance.observation, _x.distance.current, _x.angle, _x.proxemic_zone, _x.workspace_area,) = _get_struct_4f2B().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_4f2B = None
def _get_struct_4f2B():
    global _struct_4f2B
    if _struct_4f2B is None:
        _struct_4f2B = struct.Struct("<4f2B")
    return _struct_4f2B
