import 'package:rxdart/rxdart.dart';
import 'package:bloc_provider/bloc_provider.dart';

class EditorBloc implements Bloc {
  final _contentController = BehaviorSubject<String>.seeded('');

  BehaviorSubject<String> get content => _contentController;

  @override
  void dispose() async {
    await _contentController.close();
  }
}
