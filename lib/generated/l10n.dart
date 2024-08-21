// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Search`
  String get kSearchString {
    return Intl.message(
      'Search',
      name: 'kSearchString',
      desc: '',
      args: [],
    );
  }

  /// `Nearby Pharmacies`
  String get kNearestString {
    return Intl.message(
      'Nearby Pharmacies',
      name: 'kNearestString',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get kCategory {
    return Intl.message(
      'Categories',
      name: 'kCategory',
      desc: '',
      args: [],
    );
  }

  /// `50% Offers`
  String get kOffer50 {
    return Intl.message(
      '50% Offers',
      name: 'kOffer50',
      desc: '',
      args: [],
    );
  }

  /// `Conversations`
  String get kConversations {
    return Intl.message(
      'Conversations',
      name: 'kConversations',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Cart`
  String get kBuyCart {
    return Intl.message(
      'Shopping Cart',
      name: 'kBuyCart',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get kPaymentString {
    return Intl.message(
      'Payment',
      name: 'kPaymentString',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get kNextString {
    return Intl.message(
      'Next',
      name: 'kNextString',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get kBackString {
    return Intl.message(
      'Back',
      name: 'kBackString',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get kName {
    return Intl.message(
      'Name',
      name: 'kName',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get kNotifications {
    return Intl.message(
      'Notifications',
      name: 'kNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get kAddress {
    return Intl.message(
      'Address',
      name: 'kAddress',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get kPhone {
    return Intl.message(
      'Phone Number',
      name: 'kPhone',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get kCreateAccount {
    return Intl.message(
      'Create Account',
      name: 'kCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get kEmail {
    return Intl.message(
      'Email',
      name: 'kEmail',
      desc: '',
      args: [],
    );
  }

  /// `Governorate`
  String get kGovernorate {
    return Intl.message(
      'Governorate',
      name: 'kGovernorate',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get kCity {
    return Intl.message(
      'City',
      name: 'kCity',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery`
  String get kPaymentInRecive {
    return Intl.message(
      'Cash on Delivery',
      name: 'kPaymentInRecive',
      desc: '',
      args: [],
    );
  }

  /// `Pay by Visa`
  String get kPaymentByVisa {
    return Intl.message(
      'Pay by Visa',
      name: 'kPaymentByVisa',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get kSetting {
    return Intl.message(
      'Settings',
      name: 'kSetting',
      desc: '',
      args: [],
    );
  }

  /// `Saved Address`
  String get kSaveTitle {
    return Intl.message(
      'Saved Address',
      name: 'kSaveTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get kSignIn {
    return Intl.message(
      'Sign In',
      name: 'kSignIn',
      desc: '',
      args: [],
    );
  }

  /// ` Sign Out  `
  String get kSignOut {
    return Intl.message(
      ' Sign Out  ',
      name: 'kSignOut',
      desc: '',
      args: [],
    );
  }

  /// `Do not have an account?`
  String get kNotHaveAccount {
    return Intl.message(
      'Do not have an account?',
      name: 'kNotHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// ` Resend Code`
  String get kResendCode {
    return Intl.message(
      ' Resend Code',
      name: 'kResendCode',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `add to cart`
  String get kAddToCart {
    return Intl.message(
      'add to cart',
      name: 'kAddToCart',
      desc: '',
      args: [],
    );
  }

  /// `remove from cart`
  String get kRemoveFromCart {
    return Intl.message(
      'remove from cart',
      name: 'kRemoveFromCart',
      desc: '',
      args: [],
    );
  }

  /// `call us`
  String get kCallUs {
    return Intl.message(
      'call us',
      name: 'kCallUs',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get kSave {
    return Intl.message(
      'Save',
      name: 'kSave',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get kCancel {
    return Intl.message(
      'Cancel',
      name: 'kCancel',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get kForgetPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'kForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get kPersonalInfoString {
    return Intl.message(
      'Personal Information',
      name: 'kPersonalInfoString',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get kPassword {
    return Intl.message(
      'Password',
      name: 'kPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get kChangePassword {
    return Intl.message(
      'Change Password',
      name: 'kChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get kCurrentPassword {
    return Intl.message(
      'Current Password',
      name: 'kCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get kNewPassword {
    return Intl.message(
      'New Password',
      name: 'kNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get kConfirmPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'kConfirmPassword',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
