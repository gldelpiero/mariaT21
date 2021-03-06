// Generated by gencpp from file controle/Emotion.msg
// DO NOT EDIT!


#ifndef CONTROLE_MESSAGE_EMOTION_H
#define CONTROLE_MESSAGE_EMOTION_H


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
struct Emotion_
{
  typedef Emotion_<ContainerAllocator> Type;

  Emotion_()
    : header()
    , code(0)
    , percentage(0)
    , pleasure(0)
    , arousal(0)
    , dominance(0)  {
    }
  Emotion_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , code(0)
    , percentage(0)
    , pleasure(0)
    , arousal(0)
    , dominance(0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint8_t _code_type;
  _code_type code;

   typedef uint8_t _percentage_type;
  _percentage_type percentage;

   typedef int8_t _pleasure_type;
  _pleasure_type pleasure;

   typedef int8_t _arousal_type;
  _arousal_type arousal;

   typedef int8_t _dominance_type;
  _dominance_type dominance;



// reducing the odds to have name collisions with Windows.h 
#if defined(_WIN32) && defined(EMOTION_ANGER)
  #undef EMOTION_ANGER
#endif
#if defined(_WIN32) && defined(EMOTION_DISGUST)
  #undef EMOTION_DISGUST
#endif
#if defined(_WIN32) && defined(EMOTION_FEAR)
  #undef EMOTION_FEAR
#endif
#if defined(_WIN32) && defined(EMOTION_HAPPINESS)
  #undef EMOTION_HAPPINESS
#endif
#if defined(_WIN32) && defined(EMOTION_SADNESS)
  #undef EMOTION_SADNESS
#endif
#if defined(_WIN32) && defined(EMOTION_SUSPRISE)
  #undef EMOTION_SUSPRISE
#endif
#if defined(_WIN32) && defined(EMOTION_TRUST)
  #undef EMOTION_TRUST
#endif
#if defined(_WIN32) && defined(EMOTION_ANTICIPATION)
  #undef EMOTION_ANTICIPATION
#endif

  enum {
    EMOTION_ANGER = 0u,
    EMOTION_DISGUST = 1u,
    EMOTION_FEAR = 2u,
    EMOTION_HAPPINESS = 3u,
    EMOTION_SADNESS = 4u,
    EMOTION_SUSPRISE = 5u,
    EMOTION_TRUST = 6u,
    EMOTION_ANTICIPATION = 7u,
  };


  typedef boost::shared_ptr< ::controle::Emotion_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::controle::Emotion_<ContainerAllocator> const> ConstPtr;

}; // struct Emotion_

typedef ::controle::Emotion_<std::allocator<void> > Emotion;

typedef boost::shared_ptr< ::controle::Emotion > EmotionPtr;
typedef boost::shared_ptr< ::controle::Emotion const> EmotionConstPtr;

// constants requiring out of line definition

   

   

   

   

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::controle::Emotion_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::controle::Emotion_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::controle::Emotion_<ContainerAllocator1> & lhs, const ::controle::Emotion_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.code == rhs.code &&
    lhs.percentage == rhs.percentage &&
    lhs.pleasure == rhs.pleasure &&
    lhs.arousal == rhs.arousal &&
    lhs.dominance == rhs.dominance;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::controle::Emotion_<ContainerAllocator1> & lhs, const ::controle::Emotion_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace controle

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::controle::Emotion_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::controle::Emotion_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::controle::Emotion_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::controle::Emotion_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::controle::Emotion_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::controle::Emotion_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::controle::Emotion_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6710c8ff5d9ca3e0bda8d2c2af186861";
  }

  static const char* value(const ::controle::Emotion_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6710c8ff5d9ca3e0ULL;
  static const uint64_t static_value2 = 0xbda8d2c2af186861ULL;
};

template<class ContainerAllocator>
struct DataType< ::controle::Emotion_<ContainerAllocator> >
{
  static const char* value()
  {
    return "controle/Emotion";
  }

  static const char* value(const ::controle::Emotion_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::controle::Emotion_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"uint8 EMOTION_ANGER = 0\n"
"uint8 EMOTION_DISGUST = 1\n"
"uint8 EMOTION_FEAR = 2\n"
"uint8 EMOTION_HAPPINESS = 3\n"
"uint8 EMOTION_SADNESS = 4\n"
"uint8 EMOTION_SUSPRISE = 5\n"
"uint8 EMOTION_TRUST = 6\n"
"uint8 EMOTION_ANTICIPATION = 7\n"
"uint8 code\n"
"uint8 percentage\n"
"\n"
"int8 pleasure\n"
"int8 arousal\n"
"int8 dominance\n"
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

  static const char* value(const ::controle::Emotion_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::controle::Emotion_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.code);
      stream.next(m.percentage);
      stream.next(m.pleasure);
      stream.next(m.arousal);
      stream.next(m.dominance);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Emotion_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::controle::Emotion_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::controle::Emotion_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "code: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.code);
    s << indent << "percentage: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.percentage);
    s << indent << "pleasure: ";
    Printer<int8_t>::stream(s, indent + "  ", v.pleasure);
    s << indent << "arousal: ";
    Printer<int8_t>::stream(s, indent + "  ", v.arousal);
    s << indent << "dominance: ";
    Printer<int8_t>::stream(s, indent + "  ", v.dominance);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CONTROLE_MESSAGE_EMOTION_H
