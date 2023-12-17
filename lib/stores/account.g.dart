// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Account on AccountBase, Store {
  late final _$oauthHelperAtom =
      Atom(name: 'AccountBase.oauthHelper', context: context);

  @override
  OAuth2Helper? get oauthHelper {
    _$oauthHelperAtom.reportRead();
    return super.oauthHelper;
  }

  @override
  set oauthHelper(OAuth2Helper? value) {
    _$oauthHelperAtom.reportWrite(value, super.oauthHelper, () {
      super.oauthHelper = value;
    });
  }

  late final _$AccountBaseActionController =
      ActionController(name: 'AccountBase', context: context);

  @override
  void setOauthHelper(OAuth2Helper helper) {
    final _$actionInfo = _$AccountBaseActionController.startAction(
        name: 'AccountBase.setOauthHelper');
    try {
      return super.setOauthHelper(helper);
    } finally {
      _$AccountBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
oauthHelper: ${oauthHelper}
    ''';
  }
}
