import 'dart:convert';

import 'package:deriv_lite/common/repository/base_repo.dart';
import 'package:deriv_lite/common/models/symbol_model.dart';

abstract class SymbolsRepoBase extends BaseRepo {
  /// Connect to the websocket and get symbols
  Future<List<Symbol>> getSymbols();
}

class SymbolsRepo extends SymbolsRepoBase {
  @override
  Future<List<Symbol>> getSymbols() async {
    final key = "active_symbols";
    final data = await callAndWaitForData(
      key,
      jsonEncode({"active_symbols": "brief", "product_type": "basic"}),
    );
    final List<Symbol> symbols =
        data[key].map<Symbol>((symbol) => Symbol.fromJson(symbol)).toList();
    return symbols;
  }
}

class MockSymbolsRepo implements SymbolsRepoBase {
  @override
  Future<Map> callAndWaitForData(String messageKey, String messageToBeSent) {
    // TODO: implement callAndWaitForData
    throw UnimplementedError();
  }

  @override
  Future<List<Symbol>> getSymbols() {
    // TODO: implement getSymbols
    throw UnimplementedError();
  }
}
