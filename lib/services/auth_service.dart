import 'package:employe_attendence/services/db_service.dart';
import 'package:employe_attendence/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;
  // final DbService _dbService = DbService();


  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }


  Future registerEmployee(String email,String password,BuildContext context)async{
    try{
      setIsLoading = true;
      if(email == "" || password == ""){
        throw("All Feilds are required");
      }
      final AuthResponse response =
      await _supabase.auth.signUp(password: password , email: email);

      if (response != null){
        Utils.showSnacBar("Successfully registered ! ", context,
        color: Colors.green);
        await loginEmployee(email, password, context);
        Navigator.pop(context);
      }

    }catch (e){
      setIsLoading = false;
      Utils.showSnacBar(e.toString(), context,color: Colors.red);
    }
  }
  Future loginEmployee(String email,String password,BuildContext context) async{
    try{
      setIsLoading = true;
      if(email == "" || password == ""){
        throw("All Feilds are required");
      }
      final AuthResponse response = await _supabase.auth.signInWithPassword(password: password , email: email);
      setIsLoading = false;
    }catch (e){
      setIsLoading = false;
      Utils.showSnacBar(e.toString(), context,color: Colors.red);
    }
  }
  Future signOut() async{
    await _supabase.auth.signOut();
    notifyListeners();
  }
  User ? get currentUser => _supabase.auth.currentUser;
}