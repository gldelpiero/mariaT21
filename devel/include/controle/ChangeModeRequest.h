// Generated by gencpp from file controle/ChangeModeRequest.msg
// DO NOT EDIT!


#ifndef CONTROLE_MESSAGE_CHANGEMODEREQUEST_H
#define CONTROLE_MESSAGE_CHANGEMODEREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace controle
{
template <class ContainerAllocator>
struct ChangeModeRequest_
{
  typedef ChangeModeRequest_<ContainerAllocator> Type;

  ChangeModeRequest_()
    : mode(0)  {
    }
  ChangeModeRequest_(const ContainerAllocator& _alloc)
    : mode(0)  {
  (void)_alloc;
    }



   typedef uint8_t _mode_type;
  _mode_type mode;





  typedef boost::shared_ptr< ::controle::ChangeModeRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::controle::ChangeModeRequest_<ContainerAllocator> const> ConstPtr;

}; // struct ChangeModeRequest_

typedef ::controle::ChangeModeRequest_<std::allocator<void> > ChangeModeRequest;

typedef boost::shared_ptr< ::controle::ChangeModeRequest > ChangeModeRequestPtr;
typedef boost::shared_ptr< ::controle::ChangeModeRequest const> ChangeModeRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::controle::ChangeModeRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::controle::ChangeModeRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::controle::ChangeModeRequest_<ContainerAllocator1> & lhs, const ::controle::ChangeModeRequest_<ContainerAllocator2> & rhs)
{
  return lhs.mode == rhs.mode;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::controle::ChangeModeRequest_<ContainerAllocator1> & lhs, const ::controle::ChangeModeRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace controle

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::controle::ChangeModeRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::controle::ChangeModeRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::controle::ChangeModeRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::controle::ChangeModeRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::controle::ChangeModeRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::controle::ChangeModeRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::controle::ChangeModeRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "89b81386720be1cd0ce7a3953fcd1b19";
  }

  static const char* value(const ::controle::ChangeModeRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x89b81386720be1cdULL;
  static const uint64_t static_value2 = 0x0ce7a3953fcd1b19ULL;
};

template<class ContainerAllocator>
struct DataType< ::controle::ChangeModeRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "controle/ChangeModeRequest";
  }

  static const char* value(const ::controle::ChangeModeRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::controle::ChangeModeRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 mode\n"
;
  }

  static const char* value(const ::controle::ChangeModeRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::controle::ChangeModeRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.mode);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ChangeModeRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::controle::ChangeModeRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::controle::ChangeModeRequest_<ContainerAllocator>& v)
  {
    s << indent << "mode: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.mode);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CONTROLE_MESSAGE_CHANGEMODEREQUEST_H
