import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AttendenceService extends ChangeNotifier{
  final SupabaseClient _supabase = Supabase.instance.client;
   AttendenceService ? attendenceService;

   String todayDate = DateFormat("dd MMMM yyyy").format(DateTime.now());

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}