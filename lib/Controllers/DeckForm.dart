import 'package:conversation_deck/Controllers/DatabaseForm.dart';
import 'package:conversation_deck/Controllers/States/DeckFormState.dart';
import 'package:conversation_deck/Models/Deck.dart';

class DeckForm extends DatabaseForm<Deck> {
    DeckForm({Deck? deck}){
    state = DeckFormState(deck);
  }
}