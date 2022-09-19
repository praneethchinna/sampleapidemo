import 'package:clean_framework/clean_framework.dart';

class HeadlinesViewModel extends ViewModel{
final String email;
final String password;
final bool requestSubmitted;
final bool hasError;

HeadlinesViewModel({required this.email,required this.password,required this.requestSubmitted,
required this.hasError});

@override
  List<Object?> get props => [email, password, requestSubmitted, hasError];

}