
import 'package:employe_attendence/constants/constants.dart';

class AttendenceModel{
  final String id;
  final String date;
  final String checkIn;
  final String? checkOut;
  final String createAt;

  AttendenceModel ({
  required this.id,
  required this.date,
  required this.checkIn,
   this.checkOut,
  required this.createAt,});

  factory AttendenceModel.fromjson(Map<String,dynamic> data){
    return AttendenceModel(
        id: data['employee_id'],
        date: data['date'],
        checkIn: data['check_In'],
        checkOut: data['check_Out'],
        createAt: DateTime.parse(data['created_at']).toIso8601String());
  }
}