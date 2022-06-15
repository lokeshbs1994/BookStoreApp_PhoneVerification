import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:phone_verification/model/httpexception.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  final String? _token = _auth.currentUser?.getIdToken() as String?;
  final String? _userId = _auth.currentUser?.uid;

  String? get token {
    return _token;
  }

  String? get userId {
    return _userId;
  }
  get auth{
    return _auth;
  }
}
