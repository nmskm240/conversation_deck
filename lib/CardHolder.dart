import 'TalkCard.dart';

abstract class CardHolder {
  List<TalkCard> cards = [];

  CardHolder.fromJson(Map<String, dynamic> json) : cards = json["cards"];

  Map<String, dynamic> toJson() => {"cards": cards};
}
