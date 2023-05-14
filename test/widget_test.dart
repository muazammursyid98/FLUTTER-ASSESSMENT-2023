import 'dart:io';

import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_firebase/models/beers_model.dart';
import 'package:mvvm_firebase/services/beers_service.dart';
import 'package:http/http.dart' as http;

void main() {
  testWidgets('login with email and password', (WidgetTester tester) async {
    final auth = MockFirebaseAuth();

    const email = 'testing6@gmail.com';
    const password = '123123123';

    final userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    print(userCredential);
    final user = userCredential.user;
    print(user);

    expect(user, isNotNull);
    expect(user!.email!, 'Test User');
  });
}
