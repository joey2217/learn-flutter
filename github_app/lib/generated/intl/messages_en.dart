// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "auto": MessageLookupByLibrary.simpleMessage("Auto"),
        "cancel": MessageLookupByLibrary.simpleMessage("cancel"),
        "home": MessageLookupByLibrary.simpleMessage("Github"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "logout": MessageLookupByLibrary.simpleMessage("logout"),
        "logoutTip": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to quit your current account?"),
        "noDescription":
            MessageLookupByLibrary.simpleMessage("No description yet !"),
        "noMore": MessageLookupByLibrary.simpleMessage("No more"),
        "password": MessageLookupByLibrary.simpleMessage("TOKEN"),
        "passwordRequired":
            MessageLookupByLibrary.simpleMessage("Password required!"),
        "setting": MessageLookupByLibrary.simpleMessage("Setting"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "title": MessageLookupByLibrary.simpleMessage("Flutter APP"),
        "userName": MessageLookupByLibrary.simpleMessage("User Name"),
        "userNameOrPasswordWrong": MessageLookupByLibrary.simpleMessage(
            "User name or password is not correct!"),
        "userNameRequired":
            MessageLookupByLibrary.simpleMessage("User name required!"),
        "yes": MessageLookupByLibrary.simpleMessage("yes")
      };
}
