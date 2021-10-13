// Generated by gencpp from file emotion_detection/Vector4d.msg
// DO NOT EDIT!


#ifndef EMOTION_DETECTION_MESSAGE_VECTOR4D_H
#define EMOTION_DETECTION_MESSAGE_VECTOR4D_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace emotion_detection
{
template <class ContainerAllocator>
struct Vector4d_
{
  typedef Vector4d_<ContainerAllocator> Type;

  Vector4d_()
    : header()
    , x(0.0)
    , y(0.0)
    , z(0.0)
    , w(0.0)  {
    }
  Vector4d_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , x(0.0)
    , y(0.0)
    , z(0.0)
    , w(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef double _x_type;
  _x_type x;

   typedef double _y_type;
  _y_type y;

   typedef double _z_type;
  _z_type z;

   typedef double _w_type;
  _w_type w;





  typedef boost::shared_ptr< ::emotion_detection::Vector4d_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::emotion_detection::Vector4d_<ContainerAllocator> const> ConstPtr;

}; // struct Vector4d_

typedef ::emotion_detection::Vector4d_<std::allocator<void> > Vector4d;

typedef boost::shared_ptr< ::emotion_detection::Vector4d > Vector4dPtr;
typedef boost::shared_ptr< ::emotion_detection::Vector4d const> Vector4dConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::emotion_detection::Vector4d_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::emotion_detection::Vector4d_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::emotion_detection::Vector4d_<ContainerAllocator1> & lhs, const ::emotion_detection::Vector4d_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.x == rhs.x &&
    lhs.y == rhs.y &&
    lhs.z == rhs.z &&
    lhs.w == rhs.w;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::emotion_detection::Vector4d_<ContainerAllocator1> & lhs, const ::emotion_detection::Vector4d_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace emotion_detection

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::emotion_detection::Vector4d_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::emotion_detection::Vector4d_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::emotion_detection::Vector4d_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::emotion_detection::Vector4d_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::emotion_detection::Vector4d_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::emotion_detection::Vector4d_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::emotion_detection::Vector4d_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4b732bf4f836c3b6fbdd39c091837af6";
  }

  static const char* value(const ::emotion_detection::Vector4d_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4b732bf4f836c3b6ULL;
  static const uint64_t static_value2 = 0xfbdd39c091837af6ULL;
};

template<class ContainerAllocator>
struct DataType< ::emotion_detection::Vector4d_<ContainerAllocator> >
{
  static const char* value()
  {
    return "emotion_detection/Vector4d";
  }

  static const char* value(const ::emotion_detection::Vector4d_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::emotion_detection::Vector4d_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header \n"
"float64 x   # It is used for Joy-Sadness dimension\n"
"float64 y   # It is used for Trust-Disgust dimension\n"
"float64 z   # It is used for Fear-Anger dimension\n"
"float64 w   # It is used for Surprise-Anticipation\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::emotion_detection::Vector4d_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::emotion_detection::Vector4d_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
      stream.next(m.w);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Vector4d_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::emotion_detection::Vector4d_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::emotion_detection::Vector4d_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "x: ";
    Printer<double>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<double>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<double>::stream(s, indent + "  ", v.z);
    s << indent << "w: ";
    Printer<double>::stream(s, indent + "  ", v.w);
  }
};

} // namespace message_operations
} // namespace ros

#endif // EMOTION_DETECTION_MESSAGE_VECTOR4D_H