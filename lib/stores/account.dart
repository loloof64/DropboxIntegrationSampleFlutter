import 'package:mobx/mobx.dart';
import 'package:oauth2_client/oauth2_helper.dart';

part 'account.g.dart';

class Account = AccountBase with _$Account;

abstract class AccountBase with Store {
  @observable
  OAuth2Helper? oauthHelper;

  @action
  void setOauthHelper(OAuth2Helper helper) {
    oauthHelper = helper;
  }

  @action
  Future<void> disconnect() async {
    if (oauthHelper == null) return;
    await oauthHelper!.disconnect();
    oauthHelper = null;
  }
}