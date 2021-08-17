import 'package:conversation_deck/Database/Models/DatabaseItem.dart';
import 'package:conversation_deck/Models/Deck.dart';
import 'package:conversation_deck/Models/Topic.dart';

class Builder {
  final Map<Type, dynamic Function(Map<String, dynamic>)> _constructors = {
    Deck: (Map<String, dynamic> map) => Deck.parse(map),
    Topic: (Map<String, dynamic> map) => Topic.parse(map),
  };
  static final Builder _instance = Builder._constructor();
  Builder._constructor();

  factory Builder() => _instance;

  T? make<T extends DatabaseItem>(Map<String, dynamic> arguments) {
    var constructor = _constructors[T];
    return constructor!(arguments) as T;
  }
}
