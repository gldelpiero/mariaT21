// Generated by gencpp from file controle/ChangeMode.msg
// DO NOT EDIT!


#ifndef CONTROLE_MESSAGE_CHANGEMODE_H
#define CONTROLE_MESSAGE_CHANGEMODE_H

#include <ros/service_traits.h>


#include <controle/ChangeModeRequest.h>
#include <controle/ChangeModeResponse.h>


namespace controle
{

struct ChangeMode
{

typedef ChangeModeRequest Request;
typedef ChangeModeResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct ChangeMode
} // namespace controle


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::controle::ChangeMode > {
  static const char* value()
  {
    return "6355e26f776c047b791d9822fff786f9";
  }

  static const char* value(const ::controle::ChangeMode&) { return value(); }
};

template<>
struct DataType< ::controle::ChangeMode > {
  static const char* value()
  {
    return "controle/ChangeMode";
  }

  static const char* value(const ::controle::ChangeMode&) { return value(); }
};


// service_traits::MD5Sum< ::controle::ChangeModeRequest> should match
// service_traits::MD5Sum< ::controle::ChangeMode >
template<>
struct MD5Sum< ::controle::ChangeModeRequest>
{
  static const char* value()
  {
    return MD5Sum< ::controle::ChangeMode >::value();
  }
  static const char* value(const ::controle::ChangeModeRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::controle::ChangeModeRequest> should match
// service_traits::DataType< ::controle::ChangeMode >
template<>
struct DataType< ::controle::ChangeModeRequest>
{
  static const char* value()
  {
    return DataType< ::controle::ChangeMode >::value();
  }
  static const char* value(const ::controle::ChangeModeRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::controle::ChangeModeResponse> should match
// service_traits::MD5Sum< ::controle::ChangeMode >
template<>
struct MD5Sum< ::controle::ChangeModeResponse>
{
  static const char* value()
  {
    return MD5Sum< ::controle::ChangeMode >::value();
  }
  static const char* value(const ::controle::ChangeModeResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::controle::ChangeModeResponse> should match
// service_traits::DataType< ::controle::ChangeMode >
template<>
struct DataType< ::controle::ChangeModeResponse>
{
  static const char* value()
  {
    return DataType< ::controle::ChangeMode >::value();
  }
  static const char* value(const ::controle::ChangeModeResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // CONTROLE_MESSAGE_CHANGEMODE_H
