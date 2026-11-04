import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @locale.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get locale;

  /// No description provided for @noRouteDefined.
  ///
  /// In en, this message translates to:
  /// **'No route defined...!'**
  String get noRouteDefined;

  /// No description provided for @goAheadSetUpYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Go ahead and set up your account'**
  String get goAheadSetUpYourAccount;

  /// No description provided for @welcomeBackPleaseSignInToManageYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Welcome back! Please sign in to manage your account.'**
  String get welcomeBackPleaseSignInToManageYourAccount;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @orContinueWith.
  ///
  /// In en, this message translates to:
  /// **'Or continue with'**
  String get orContinueWith;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAnAccount;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @createYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get createYourAccount;

  /// No description provided for @signUpToManageYourAccountEffortlessly.
  ///
  /// In en, this message translates to:
  /// **'Sign up to manage your account effortlessly.'**
  String get signUpToManageYourAccountEffortlessly;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @registerButton.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerButton;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @pleaseFillAllFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all fields.'**
  String get pleaseFillAllFields;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @checkYourEmailToVerification.
  ///
  /// In en, this message translates to:
  /// **'Check your email to verify your account'**
  String get checkYourEmailToVerification;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @openEmail.
  ///
  /// In en, this message translates to:
  /// **'Open Email'**
  String get openEmail;

  /// No description provided for @noEmailApp.
  ///
  /// In en, this message translates to:
  /// **'No email app found'**
  String get noEmailApp;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @doctorSpecialties.
  ///
  /// In en, this message translates to:
  /// **'Doctor Specialties'**
  String get doctorSpecialties;

  /// No description provided for @popularDoctors.
  ///
  /// In en, this message translates to:
  /// **'Popular Doctors'**
  String get popularDoctors;

  /// No description provided for @availableDoctors.
  ///
  /// In en, this message translates to:
  /// **'Available Doctors'**
  String get availableDoctors;

  /// No description provided for @findTheRightDoctorForYou.
  ///
  /// In en, this message translates to:
  /// **'Find the right doctor for you'**
  String get findTheRightDoctorForYou;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get goodMorning;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @noUserLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'No user logged in'**
  String get noUserLoggedIn;

  /// No description provided for @userNotLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'User not logged in'**
  String get userNotLoggedIn;

  /// No description provided for @failedToSubmitAppointment.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit appointment'**
  String get failedToSubmitAppointment;

  /// No description provided for @appointmentBookedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Appointment booked successfully'**
  String get appointmentBookedSuccessfully;

  /// No description provided for @seeAppointments.
  ///
  /// In en, this message translates to:
  /// **'See Appointments'**
  String get seeAppointments;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! '**
  String get congratulations;

  /// No description provided for @yourAppointmentWith.
  ///
  /// In en, this message translates to:
  /// **', your appointment with'**
  String get yourAppointmentWith;

  /// No description provided for @drAyeshaRahman.
  ///
  /// In en, this message translates to:
  /// **'Dr. Ayesha Rahman'**
  String get drAyeshaRahman;

  /// No description provided for @hadBeenCreated.
  ///
  /// In en, this message translates to:
  /// **' had been created.'**
  String get hadBeenCreated;

  /// No description provided for @dateFormat.
  ///
  /// In en, this message translates to:
  /// **'dd/mm/yyyy'**
  String get dateFormat;

  /// No description provided for @bookAppointment.
  ///
  /// In en, this message translates to:
  /// **'Book Appointment'**
  String get bookAppointment;

  /// No description provided for @doctorAbout.
  ///
  /// In en, this message translates to:
  /// **'This is placeholder text used to display the doctor\'s description and information. You can replace it with the doctor\'s real bio.'**
  String get doctorAbout;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @workingTime.
  ///
  /// In en, this message translates to:
  /// **'Working Time'**
  String get workingTime;

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'years'**
  String get years;

  /// No description provided for @hour.
  ///
  /// In en, this message translates to:
  /// **'/hour'**
  String get hour;

  /// No description provided for @newAppointment.
  ///
  /// In en, this message translates to:
  /// **'New Appointment'**
  String get newAppointment;

  /// No description provided for @consultationType.
  ///
  /// In en, this message translates to:
  /// **'Consultation Type'**
  String get consultationType;

  /// No description provided for @availableSlots.
  ///
  /// In en, this message translates to:
  /// **'Available Slots'**
  String get availableSlots;

  /// No description provided for @availableTime.
  ///
  /// In en, this message translates to:
  /// **'Available Time'**
  String get availableTime;

  /// No description provided for @consultationFees.
  ///
  /// In en, this message translates to:
  /// **'Consultation Fees'**
  String get consultationFees;

  /// No description provided for @mon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get mon;

  /// No description provided for @tue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tue;

  /// No description provided for @wed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wed;

  /// No description provided for @thur.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thur;

  /// No description provided for @fri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get fri;

  /// No description provided for @sat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get sat;

  /// No description provided for @sun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sun;

  /// No description provided for @january.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// No description provided for @february.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get february;

  /// No description provided for @march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// No description provided for @april.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get april;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @june.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get june;

  /// No description provided for @july.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// No description provided for @august.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get august;

  /// No description provided for @september.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get september;

  /// No description provided for @october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// No description provided for @november.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// No description provided for @december.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// No description provided for @selectedDate.
  ///
  /// In en, this message translates to:
  /// **'Selected Date:'**
  String get selectedDate;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @patientDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Patient Details'**
  String get patientDetailsTitle;

  /// No description provided for @pleaseEnterPatientFullName.
  ///
  /// In en, this message translates to:
  /// **'Please enter the patient\'s full name'**
  String get pleaseEnterPatientFullName;

  /// No description provided for @pleaseEnterPatientEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter the patient\'s email'**
  String get pleaseEnterPatientEmail;

  /// No description provided for @userEmail.
  ///
  /// In en, this message translates to:
  /// **'user@mail.com'**
  String get userEmail;

  /// No description provided for @pleaseEnterPatientPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter the patient\'s phone number'**
  String get pleaseEnterPatientPhoneNumber;

  /// No description provided for @phoneNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumberLabel;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @choosePatientGender.
  ///
  /// In en, this message translates to:
  /// **'Choose patient\'s gender'**
  String get choosePatientGender;

  /// No description provided for @pleaseSelectGender.
  ///
  /// In en, this message translates to:
  /// **'Please select gender'**
  String get pleaseSelectGender;

  /// No description provided for @pleaseEnterPatientAge.
  ///
  /// In en, this message translates to:
  /// **'Please enter the patient\'s age'**
  String get pleaseEnterPatientAge;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @patientAge.
  ///
  /// In en, this message translates to:
  /// **'Patient Age'**
  String get patientAge;

  /// No description provided for @detail.
  ///
  /// In en, this message translates to:
  /// **'Detail'**
  String get detail;

  /// No description provided for @patientDetails.
  ///
  /// In en, this message translates to:
  /// **'Patient Details'**
  String get patientDetails;

  /// No description provided for @failedToBookAppointment.
  ///
  /// In en, this message translates to:
  /// **'Failed to book appointment.'**
  String get failedToBookAppointment;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @noDoctorsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No doctors available right now'**
  String get noDoctorsAvailable;

  /// No description provided for @seeMore.
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get seeMore;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @doctor.
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get doctor;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @foundedFor.
  ///
  /// In en, this message translates to:
  /// **'Founded for '**
  String get foundedFor;

  /// No description provided for @dentist.
  ///
  /// In en, this message translates to:
  /// **'Dentist'**
  String get dentist;

  /// No description provided for @ophthalmologist.
  ///
  /// In en, this message translates to:
  /// **'Ophthalmologist'**
  String get ophthalmologist;

  /// No description provided for @eNTSpecialist.
  ///
  /// In en, this message translates to:
  /// **'ENT Specialist'**
  String get eNTSpecialist;

  /// No description provided for @otologist.
  ///
  /// In en, this message translates to:
  /// **'Otologist'**
  String get otologist;

  /// No description provided for @gynecologist.
  ///
  /// In en, this message translates to:
  /// **'Gynecologist'**
  String get gynecologist;

  /// No description provided for @cardiologist.
  ///
  /// In en, this message translates to:
  /// **'Cardiologist'**
  String get cardiologist;

  /// No description provided for @gastroenterologist.
  ///
  /// In en, this message translates to:
  /// **'Gastroenterologist'**
  String get gastroenterologist;

  /// No description provided for @neurologist.
  ///
  /// In en, this message translates to:
  /// **'Neurologist'**
  String get neurologist;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @myAppointments.
  ///
  /// In en, this message translates to:
  /// **'My Appointments'**
  String get myAppointments;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @sortby.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get sortby;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
