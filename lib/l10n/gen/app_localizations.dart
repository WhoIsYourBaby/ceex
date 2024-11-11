import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh')
  ];

  /// 你好世界的描述
  ///
  /// In zh, this message translates to:
  /// **'你好世界!'**
  String get helloWorld;

  /// No description provided for @modifying.
  ///
  /// In zh, this message translates to:
  /// **'修改'**
  String get modifying;

  /// No description provided for @homeViewTitle.
  ///
  /// In zh, this message translates to:
  /// **'首页'**
  String get homeViewTitle;

  /// No description provided for @mineViewTitle.
  ///
  /// In zh, this message translates to:
  /// **'我的'**
  String get mineViewTitle;

  /// No description provided for @serviceViewTitle.
  ///
  /// In zh, this message translates to:
  /// **'服务'**
  String get serviceViewTitle;

  /// No description provided for @loginViewTitle.
  ///
  /// In zh, this message translates to:
  /// **'登录'**
  String get loginViewTitle;

  /// No description provided for @beginUse.
  ///
  /// In zh, this message translates to:
  /// **'开始使用'**
  String get beginUse;

  /// No description provided for @bussinessLogin.
  ///
  /// In zh, this message translates to:
  /// **'经销商登录'**
  String get bussinessLogin;

  /// No description provided for @inputEmailToLogin.
  ///
  /// In zh, this message translates to:
  /// **'请输入您的电子邮箱以注册或登录'**
  String get inputEmailToLogin;

  /// No description provided for @email.
  ///
  /// In zh, this message translates to:
  /// **'邮箱'**
  String get email;

  /// No description provided for @next.
  ///
  /// In zh, this message translates to:
  /// **'下一步'**
  String get next;

  /// No description provided for @emailVerify.
  ///
  /// In zh, this message translates to:
  /// **'邮箱验证'**
  String get emailVerify;

  /// No description provided for @verifyCodeNotify.
  ///
  /// In zh, this message translates to:
  /// **'输入已发送至以下地址的一次性密码'**
  String get verifyCodeNotify;

  /// No description provided for @ungetVerifyCode.
  ///
  /// In zh, this message translates to:
  /// **'未收到一次性密码？'**
  String get ungetVerifyCode;

  /// No description provided for @sendNow.
  ///
  /// In zh, this message translates to:
  /// **'立即发送'**
  String get sendNow;

  /// No description provided for @notYourEmail.
  ///
  /// In zh, this message translates to:
  /// **'这不是您的邮箱？'**
  String get notYourEmail;

  /// No description provided for @changeEmail.
  ///
  /// In zh, this message translates to:
  /// **'更改邮箱'**
  String get changeEmail;

  /// No description provided for @changeLanguage.
  ///
  /// In zh, this message translates to:
  /// **'切换语言'**
  String get changeLanguage;

  /// No description provided for @logout.
  ///
  /// In zh, this message translates to:
  /// **'退出登录'**
  String get logout;

  /// No description provided for @marketViewTitle.
  ///
  /// In zh, this message translates to:
  /// **'行情'**
  String get marketViewTitle;

  /// No description provided for @loginSignViewWelCome.
  ///
  /// In zh, this message translates to:
  /// **'欢迎来到CEEX'**
  String get loginSignViewWelCome;

  /// No description provided for @loginSignViewEmail.
  ///
  /// In zh, this message translates to:
  /// **'邮箱'**
  String get loginSignViewEmail;

  /// No description provided for @loginSignViewPhone.
  ///
  /// In zh, this message translates to:
  /// **'手机号'**
  String get loginSignViewPhone;

  /// No description provided for @loginSignViewEmailVer.
  ///
  /// In zh, this message translates to:
  /// **'邮箱验证码'**
  String get loginSignViewEmailVer;

  /// No description provided for @loginSignViewPhoneVer.
  ///
  /// In zh, this message translates to:
  /// **'手机验证码'**
  String get loginSignViewPhoneVer;

  /// No description provided for @loginSignViewInputPassword.
  ///
  /// In zh, this message translates to:
  /// **'输入密码'**
  String get loginSignViewInputPassword;

  /// No description provided for @loginSignViewInCode.
  ///
  /// In zh, this message translates to:
  /// **'邀请码(选填)'**
  String get loginSignViewInCode;

  /// No description provided for @privacyPolicy.
  ///
  /// In zh, this message translates to:
  /// **'服务协议条款'**
  String get privacyPolicy;

  /// No description provided for @privacyPolicyText.
  ///
  /// In zh, this message translates to:
  /// **'创建账号即表示您同意我们的'**
  String get privacyPolicyText;

  /// No description provided for @accountRegister.
  ///
  /// In zh, this message translates to:
  /// **'注册'**
  String get accountRegister;

  /// No description provided for @loginViewWelcomeBack.
  ///
  /// In zh, this message translates to:
  /// **'欢迎回来'**
  String get loginViewWelcomeBack;

  /// No description provided for @forgetPassword.
  ///
  /// In zh, this message translates to:
  /// **'忘记密码?'**
  String get forgetPassword;

  /// No description provided for @homeLoginReg.
  ///
  /// In zh, this message translates to:
  /// **'登录/注册'**
  String get homeLoginReg;

  /// No description provided for @homeWelcome.
  ///
  /// In zh, this message translates to:
  /// **'欢迎来到'**
  String get homeWelcome;

  /// No description provided for @homeWelcomeCEEX.
  ///
  /// In zh, this message translates to:
  /// **'CEEX'**
  String get homeWelcomeCEEX;

  /// No description provided for @homeMakeTradeEasy.
  ///
  /// In zh, this message translates to:
  /// **'让交易更简单'**
  String get homeMakeTradeEasy;

  /// No description provided for @homeBroker.
  ///
  /// In zh, this message translates to:
  /// **'经纪人'**
  String get homeBroker;

  /// No description provided for @homeManage.
  ///
  /// In zh, this message translates to:
  /// **'理财'**
  String get homeManage;

  /// No description provided for @homeInvite.
  ///
  /// In zh, this message translates to:
  /// **'邀请'**
  String get homeInvite;

  /// No description provided for @homeService.
  ///
  /// In zh, this message translates to:
  /// **'客服'**
  String get homeService;

  /// No description provided for @homeContactUS.
  ///
  /// In zh, this message translates to:
  /// **'关注我们'**
  String get homeContactUS;

  /// No description provided for @homeTelegram.
  ///
  /// In zh, this message translates to:
  /// **'电报圈'**
  String get homeTelegram;

  /// No description provided for @homeTwitter.
  ///
  /// In zh, this message translates to:
  /// **'Twitter(X)'**
  String get homeTwitter;

  /// No description provided for @homeDC.
  ///
  /// In zh, this message translates to:
  /// **'DC'**
  String get homeDC;

  /// No description provided for @homeFacebook.
  ///
  /// In zh, this message translates to:
  /// **'Facebook'**
  String get homeFacebook;

  /// No description provided for @homeYoutube.
  ///
  /// In zh, this message translates to:
  /// **'Youtube'**
  String get homeYoutube;

  /// No description provided for @homeNotify.
  ///
  /// In zh, this message translates to:
  /// **'公告'**
  String get homeNotify;

  /// No description provided for @homeAllNotify.
  ///
  /// In zh, this message translates to:
  /// **'全部公告'**
  String get homeAllNotify;

  /// No description provided for @loginSignViewCreatAccount.
  ///
  /// In zh, this message translates to:
  /// **'创建账号'**
  String get loginSignViewCreatAccount;

  /// No description provided for @homeTabHot.
  ///
  /// In zh, this message translates to:
  /// **'热门榜'**
  String get homeTabHot;

  /// No description provided for @homeTabUp.
  ///
  /// In zh, this message translates to:
  /// **'涨幅榜'**
  String get homeTabUp;

  /// No description provided for @homeTabNew.
  ///
  /// In zh, this message translates to:
  /// **'新币榜'**
  String get homeTabNew;

  /// No description provided for @homeTabName.
  ///
  /// In zh, this message translates to:
  /// **'名称'**
  String get homeTabName;

  /// No description provided for @homeTabNewPrice.
  ///
  /// In zh, this message translates to:
  /// **'最新价'**
  String get homeTabNewPrice;

  /// No description provided for @homeTab24H.
  ///
  /// In zh, this message translates to:
  /// **'24H涨跌'**
  String get homeTab24H;

  /// No description provided for @cancel.
  ///
  /// In zh, this message translates to:
  /// **'取消'**
  String get cancel;

  /// No description provided for @tradeViewTitle.
  ///
  /// In zh, this message translates to:
  /// **'交易'**
  String get tradeViewTitle;

  /// No description provided for @contractViewTitle.
  ///
  /// In zh, this message translates to:
  /// **'合约'**
  String get contractViewTitle;

  /// No description provided for @profitViewTitle.
  ///
  /// In zh, this message translates to:
  /// **'赚取'**
  String get profitViewTitle;

  /// No description provided for @inputRealEmail.
  ///
  /// In zh, this message translates to:
  /// **'请输入正确的邮箱!'**
  String get inputRealEmail;

  /// No description provided for @forgetYourPassword.
  ///
  /// In zh, this message translates to:
  /// **'忘记您的密码了吗?'**
  String get forgetYourPassword;

  /// No description provided for @forgetYourPasswordTextTwo.
  ///
  /// In zh, this message translates to:
  /// **'没关系，这种事谁都会发生'**
  String get forgetYourPasswordTextTwo;

  /// No description provided for @contractViewBB.
  ///
  /// In zh, this message translates to:
  /// **'币币'**
  String get contractViewBB;

  /// No description provided for @contractViewLT.
  ///
  /// In zh, this message translates to:
  /// **'法币'**
  String get contractViewLT;

  /// No description provided for @fillInCompleteInformation.
  ///
  /// In zh, this message translates to:
  /// **'请填写完整信息'**
  String get fillInCompleteInformation;

  /// No description provided for @sentVerfyCode.
  ///
  /// In zh, this message translates to:
  /// **'发送验证码'**
  String get sentVerfyCode;

  /// No description provided for @forgetPassowrdGoOn.
  ///
  /// In zh, this message translates to:
  /// **'继续'**
  String get forgetPassowrdGoOn;

  /// No description provided for @setPassword.
  ///
  /// In zh, this message translates to:
  /// **'设置密码'**
  String get setPassword;

  /// No description provided for @coinCoinTitle.
  ///
  /// In zh, this message translates to:
  /// **'币币'**
  String get coinCoinTitle;

  /// No description provided for @assetsTitle.
  ///
  /// In zh, this message translates to:
  /// **'资产'**
  String get assetsTitle;

  /// No description provided for @hotTokens.
  ///
  /// In zh, this message translates to:
  /// **'热门币种'**
  String get hotTokens;

  /// No description provided for @rechargeOnChainCoin.
  ///
  /// In zh, this message translates to:
  /// **'链上充币'**
  String get rechargeOnChainCoin;

  /// No description provided for @rechargeCoinAddress.
  ///
  /// In zh, this message translates to:
  /// **'充币地址'**
  String get rechargeCoinAddress;

  /// No description provided for @rechargeCoinNet.
  ///
  /// In zh, this message translates to:
  /// **'充币网络'**
  String get rechargeCoinNet;

  /// No description provided for @rechargeCoinTo.
  ///
  /// In zh, this message translates to:
  /// **'充币至'**
  String get rechargeCoinTo;

  /// No description provided for @rechargeInformation.
  ///
  /// In zh, this message translates to:
  /// **'交易信息'**
  String get rechargeInformation;

  /// No description provided for @rechargeMinMoney.
  ///
  /// In zh, this message translates to:
  /// **'最小充币额'**
  String get rechargeMinMoney;

  /// No description provided for @rechargeMineyReceived.
  ///
  /// In zh, this message translates to:
  /// **'充币到账'**
  String get rechargeMineyReceived;

  /// No description provided for @withdrawalUnlocking.
  ///
  /// In zh, this message translates to:
  /// **'提币解锁'**
  String get withdrawalUnlocking;

  /// No description provided for @contractInformation.
  ///
  /// In zh, this message translates to:
  /// **'合约信息'**
  String get contractInformation;

  /// No description provided for @networkConfirmations.
  ///
  /// In zh, this message translates to:
  /// **'次网络确认'**
  String get networkConfirmations;

  /// No description provided for @copySuccess.
  ///
  /// In zh, this message translates to:
  /// **'复制成功'**
  String get copySuccess;

  /// No description provided for @walletAccount.
  ///
  /// In zh, this message translates to:
  /// **'钱包账户'**
  String get walletAccount;

  /// No description provided for @overview.
  ///
  /// In zh, this message translates to:
  /// **'总览'**
  String get overview;

  /// No description provided for @spotGoods.
  ///
  /// In zh, this message translates to:
  /// **'现货'**
  String get spotGoods;

  /// No description provided for @totalAssetValuation.
  ///
  /// In zh, this message translates to:
  /// **'总资产估值'**
  String get totalAssetValuation;

  /// No description provided for @recharge.
  ///
  /// In zh, this message translates to:
  /// **'充值'**
  String get recharge;

  /// No description provided for @withdrawal.
  ///
  /// In zh, this message translates to:
  /// **'提现'**
  String get withdrawal;

  /// No description provided for @rechargeCoin.
  ///
  /// In zh, this message translates to:
  /// **'充币'**
  String get rechargeCoin;

  /// No description provided for @withdrawalCoin.
  ///
  /// In zh, this message translates to:
  /// **'提币'**
  String get withdrawalCoin;

  /// No description provided for @transfer.
  ///
  /// In zh, this message translates to:
  /// **'划转'**
  String get transfer;

  /// No description provided for @bill.
  ///
  /// In zh, this message translates to:
  /// **'账单'**
  String get bill;

  /// No description provided for @assetDistribution.
  ///
  /// In zh, this message translates to:
  /// **'资产分布'**
  String get assetDistribution;

  /// No description provided for @assetDynamics.
  ///
  /// In zh, this message translates to:
  /// **'资产动态'**
  String get assetDynamics;

  /// No description provided for @wallet.
  ///
  /// In zh, this message translates to:
  /// **'钱包'**
  String get wallet;

  /// No description provided for @contract.
  ///
  /// In zh, this message translates to:
  /// **'合约'**
  String get contract;

  /// No description provided for @financing.
  ///
  /// In zh, this message translates to:
  /// **'理财'**
  String get financing;

  /// No description provided for @other.
  ///
  /// In zh, this message translates to:
  /// **'其他'**
  String get other;

  /// No description provided for @hide.
  ///
  /// In zh, this message translates to:
  /// **'隐藏'**
  String get hide;

  /// No description provided for @token.
  ///
  /// In zh, this message translates to:
  /// **'币种'**
  String get token;

  /// No description provided for @zeroBalance.
  ///
  /// In zh, this message translates to:
  /// **'0余额'**
  String get zeroBalance;

  /// No description provided for @quantity.
  ///
  /// In zh, this message translates to:
  /// **'数量'**
  String get quantity;

  /// No description provided for @all.
  ///
  /// In zh, this message translates to:
  /// **'全部'**
  String get all;

  /// No description provided for @account.
  ///
  /// In zh, this message translates to:
  /// **'账户'**
  String get account;

  /// No description provided for @assetsTranferReminder.
  ///
  /// In zh, this message translates to:
  /// **'在全仓时，资金从合约账户转出，会将您仓位的预估爆仓价向不利方向变动，请您合理控制仓位的风险'**
  String get assetsTranferReminder;

  /// No description provided for @canUse.
  ///
  /// In zh, this message translates to:
  /// **'可用'**
  String get canUse;

  /// No description provided for @confirmTransfer.
  ///
  /// In zh, this message translates to:
  /// **'确认划转'**
  String get confirmTransfer;

  /// No description provided for @from.
  ///
  /// In zh, this message translates to:
  /// **'从'**
  String get from;

  /// No description provided for @to.
  ///
  /// In zh, this message translates to:
  /// **'到'**
  String get to;

  /// No description provided for @setting.
  ///
  /// In zh, this message translates to:
  /// **'设置'**
  String get setting;

  /// No description provided for @localLanguage.
  ///
  /// In zh, this message translates to:
  /// **'简体中文'**
  String get localLanguage;

  /// No description provided for @language.
  ///
  /// In zh, this message translates to:
  /// **'语言'**
  String get language;

  /// No description provided for @safeCenter.
  ///
  /// In zh, this message translates to:
  /// **'安全中心'**
  String get safeCenter;

  /// No description provided for @low.
  ///
  /// In zh, this message translates to:
  /// **'低'**
  String get low;

  /// No description provided for @height.
  ///
  /// In zh, this message translates to:
  /// **'高'**
  String get height;

  /// No description provided for @middle.
  ///
  /// In zh, this message translates to:
  /// **'中'**
  String get middle;

  /// No description provided for @safeLevel.
  ///
  /// In zh, this message translates to:
  /// **'安全等级'**
  String get safeLevel;

  /// No description provided for @safeVerify.
  ///
  /// In zh, this message translates to:
  /// **'安全验证'**
  String get safeVerify;

  /// No description provided for @forYourSafe.
  ///
  /// In zh, this message translates to:
  /// **'为了您的账户安全，建议至少开启一项安全验证'**
  String get forYourSafe;

  /// No description provided for @fingerVerify.
  ///
  /// In zh, this message translates to:
  /// **'指纹验证'**
  String get fingerVerify;

  /// No description provided for @googleVerify.
  ///
  /// In zh, this message translates to:
  /// **'谷歌验证'**
  String get googleVerify;

  /// No description provided for @phoneNumber.
  ///
  /// In zh, this message translates to:
  /// **'手机号码'**
  String get phoneNumber;

  /// No description provided for @loginPassword.
  ///
  /// In zh, this message translates to:
  /// **'登录密码'**
  String get loginPassword;

  /// No description provided for @moneyPassword.
  ///
  /// In zh, this message translates to:
  /// **'资金密码'**
  String get moneyPassword;

  /// No description provided for @bindPhone.
  ///
  /// In zh, this message translates to:
  /// **'绑定手机'**
  String get bindPhone;

  /// No description provided for @emailVer.
  ///
  /// In zh, this message translates to:
  /// **'邮箱验证'**
  String get emailVer;

  /// No description provided for @replaceEmail.
  ///
  /// In zh, this message translates to:
  /// **'更换邮箱'**
  String get replaceEmail;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
