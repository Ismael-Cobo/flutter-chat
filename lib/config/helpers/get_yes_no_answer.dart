import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infraestructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();
  Future<Message> getMessage() async {
    final response = await _dio.get("https://yesno.wtf/api");

    final newPepeMessage = YesNoModel.fromJsonMap(response.data);

    return newPepeMessage.toMessageEntity();
  }
}
