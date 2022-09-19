import 'package:clean_framework/clean_framework_defaults.dart';

class HeadlinesResponse extends JsonResponseModel{
final bool? isRegistered;

@override
HeadlinesResponse.fromJson(Map<String,dynamic> json)
:isRegistered=json['registered']??false;


  @override
  // TODO: implement props
  List<Object?> get props => [isRegistered  ];

}