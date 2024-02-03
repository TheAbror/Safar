part of 'splash_bloc.dart';

class SplashState extends Equatable {
  final AppVersionResponse appVersionData;
  final bool showAppUpdatesPage;
  final SplashAuthStatus authStatus;
  final AccountType accountType;
  final BlocProgress blocProgress;
  final String failureMessage;
  final String? passcode;

  const SplashState({
    required this.appVersionData,
    required this.showAppUpdatesPage,
    required this.authStatus,
    required this.accountType,
    required this.blocProgress,
    required this.failureMessage,
    this.passcode,
  });

  factory SplashState.initial() {
    return SplashState(
      appVersionData: AppVersionResponse(
        showMaintanance: false,
        iosMinVersion: 1,
        iosLatestVersion: 1,
        androidMinVersion: 1,
        androidLatestVersion: 1,
        iosStoreUrl: '',
        androidStoreUrl: '',
        title: '',
        description: '',
      ),
      showAppUpdatesPage: false,
      authStatus: SplashAuthStatus.initial,
      accountType: AccountType.unknown,
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  SplashState copyWith({
    AppVersionResponse? appVersionData,
    bool? showAppUpdatesPage,
    SplashAuthStatus? authStatus,
    BlocProgress? blocProgress,
    String? failureMessage,
    AccountType? accountType,
    String? passcode,
  }) {
    return SplashState(
      appVersionData: appVersionData ?? this.appVersionData,
      showAppUpdatesPage: showAppUpdatesPage ?? this.showAppUpdatesPage,
      authStatus: authStatus ?? this.authStatus,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
      accountType: accountType ?? this.accountType,
      passcode: passcode ?? this.passcode,
    );
  }

  @override
  List<Object?> get props => [
        appVersionData,
        showAppUpdatesPage,
        authStatus,
        blocProgress,
        failureMessage,
        accountType,
        passcode,
      ];
}
