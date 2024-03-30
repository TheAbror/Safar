part of 'splash_bloc.dart';

class SplashState extends Equatable {
  final AppVersionResponse appVersionData;
  final bool showAppUpdatesPage;
  final SplashAuthStatus authStatus;
  final AccountType accountType;
  final String terms;
  final String failureMessage;
  final BlocProgress blocProgress;

  const SplashState({
    required this.appVersionData,
    required this.showAppUpdatesPage,
    required this.authStatus,
    required this.accountType,
    required this.terms,
    required this.failureMessage,
    required this.blocProgress,
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
        terms: '',
        created_at: '',
      ),
      showAppUpdatesPage: false,
      authStatus: SplashAuthStatus.initial,
      accountType: AccountType.unknown,
      terms: '',
      failureMessage: '',
      blocProgress: BlocProgress.NOT_STARTED,
    );
  }

  SplashState copyWith({
    AppVersionResponse? appVersionData,
    bool? showAppUpdatesPage,
    SplashAuthStatus? authStatus,
    AccountType? accountType,
    BlocProgress? blocProgress,
    String? terms,
    String? failureMessage,
  }) {
    return SplashState(
      appVersionData: appVersionData ?? this.appVersionData,
      showAppUpdatesPage: showAppUpdatesPage ?? this.showAppUpdatesPage,
      authStatus: authStatus ?? this.authStatus,
      accountType: accountType ?? this.accountType,
      terms: terms ?? this.terms,
      failureMessage: failureMessage ?? this.failureMessage,
      blocProgress: blocProgress ?? this.blocProgress,
    );
  }

  @override
  List<Object?> get props => [
        appVersionData,
        showAppUpdatesPage,
        authStatus,
        accountType,
        terms,
        failureMessage,
        blocProgress,
      ];
}
