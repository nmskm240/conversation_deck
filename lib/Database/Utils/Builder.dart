import 'package:conversation_deck/Database/Models/DatabaseItem.dart';
import 'package:conversation_deck/Models/Deck.dart';
import 'package:conversation_deck/Models/Time.dart';
import 'package:conversation_deck/Models/Topic.dart';
import 'package:conversation_deck/Models/TopicInfo.dart';

class Builder {
  final Map<Type, dynamic Function(Map<String, dynamic>)> _constructors = {
    Deck: (Map<String, dynamic> map) => Deck.parse(map),
    Topic: (Map<String, dynamic> map) => Topic.parse(map),
    TopicInfo: (Map<String, dynamic> map) => TopicInfo.parse(map),
    Time: (Map<String, dynamic> map) => Time.parse(map),
  };
  static final Builder _instance = Builder._constructor();
  Builder._constructor();

  factory Builder() => _instance;

  T? make<T extends DatabaseItem>(Map<String, dynamic> arguments) {
    var constructor = _constructors[T];
    return constructor!(arguments) as T;
  }
}
