// Generated by gencpp from file controle/Plutchik.msg
// DO NOT EDIT!


#ifndef CONTROLE_MESSAGE_PLUTCHIK_H
#define CONTROLE_MESSAGE_PLUTCHIK_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace controle
{
template <class ContainerAllocator>
struct Plutchik_
{
  typedef Plutchik_<ContainerAllocator> Type;

  Plutchik_()
    : header()
    , joy_sadness(0)
    , surprise_anticipation(0)
    , anger_fear(0)
    , trust_disgust(0)  {
    }
  Plutchik_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , joy_sadness(0)
    , surprise_anticipation(0)
    , anger_fear(0)
    , trust_disgust(0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef int8_t _joy_sadness_type;
  _joy_sadness_type joy_sadness;

   typedef int8_t _surprise_anticipation_type;
  _surprise_anticipation_type surprise_anticipation;

   typedef int8_t _anger_fear_type;
  _anger_fear_type anger_fear;

   typedef int8_t _trust_disgust_type;
  _trust_disgust_type trust_disgust;





  typedef boost::shared_ptr< ::controle::Plutchik_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::controle::Plutchik_<ContainerAllocator> const> ConstPtr;

}; // struct Plutchik_

typedef ::controle::Plutchik_<std::allocator<void> > Plutchik;

typedef boost::shared_ptr< ::controle::Plutchik > PlutchikPtr;
typedef boost::shared_ptr< ::controle::Plutchik const> PlutchikConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::controle::Plutchik_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::controle::Plutchik_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::controle::Plutchik_<ContainerAllocator1> & lhs, const ::controle::Plutchik_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.joy_sadness == rhs.joy_sadness &&
    lhs.surprise_anticipation == rhs.surprise_anticipation &&
    lhs.anger_fear == rhs.anger_fear &&
    lhs.trust_disgust == rhs.trust_disgust;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::controle::Plutchik_<ContainerAllocator1> & lhs, const ::controle::Plutchik_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace controle

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::controle::Plutchik_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::controle::Plutchik_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::controle::Plutchik_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::controle::Plutchik_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::controle::Plutchik_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::controle::Plutchik_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::controle::Plutchik_<ContainerAllocator> >
{
  static const char* value()
  {
    return "3de017963cf6b074941410adf7783cb7";
  }

  static const char* value(const ::controle::Plutchik_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x3de017963cf6b074ULL;
  static const uint64_t static_value2 = 0x941410adf7783cb7ULL;
};

template<class ContainerAllocator>
struct DataType< ::controle::Plutchik_<ContainerAllocator> >
{
  static const char* value()
  {
    return "controle/Plutchik";
  }

  static const char* value(const ::controle::Plutchik_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::controle::Plutchik_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"int8 joy_sadness\n"
"int8 surprise_anticipation\n"
"int8 anger_fear\n"
"int8 trust_disgust\n"
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

  static const char* value(const ::controle::Plutchik_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::controle::Plutchik_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.joy_sadness);
      stream.next(m.surprise_anticipation);
      stream.next(m.anger_fear);
      stream.next(m.trust_disgust);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Plutchik_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::controle::Plutchik_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::controle::Plutchik_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "joy_sadness: ";
    Printer<int8_t>::stream(s, indent + "  ", v.joy_sadness);
    s << indent << "surprise_anticipation: ";
    Printer<int8_t>::stream(s, indent + "  ", v.surprise_anticipation);
    s << indent << "anger_fear: ";
    Printer<int8_t>::stream(s, indent + "  ", v.anger_fear);
    s << indent << "trust_disgust: ";
    Printer<int8_t>::stream(s, indent + "  ", v.trust_disgust);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CONTROLE_MESSAGE_PLUTCHIK_H