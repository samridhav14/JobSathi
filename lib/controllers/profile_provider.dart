import 'package:flutter/material.dart';
import 'package:job_sathi/models/response/auth/profile_model.dart';
import 'package:job_sathi/services/helpers/auth_helper.dart';


class ProfileNotifier extends ChangeNotifier {
  Future<ProfileRes>? profile;
      getProfile()  {
       profile= AuthHelper.getProfile();
      }
}
