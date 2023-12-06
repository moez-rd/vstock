import 'package:flutter/widgets.dart';
import 'package:vstock/viewmodels/app/app_bloc.dart';
import 'package:vstock/views/auth/login/login_page.dart';
import 'package:vstock/views/master_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [MasterPage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
