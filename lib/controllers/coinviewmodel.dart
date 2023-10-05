
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/coin.dart';
import '../models/coindetail.dart';
import '../services/coin_service.dart';

final coinViewModelProvider = StateNotifierProvider<CoinViewModel, bool>(
        (ref) => CoinViewModel(coinService: ref.watch(coinApiService)));
final getCoinsProvider = FutureProvider((ref) {
  return ref.watch(coinViewModelProvider.notifier).getCoins();
});
final getCoinDetailProvider = FutureProvider.family((ref, String coinId) {
  return ref.watch(coinViewModelProvider.notifier).getCoinDetail(coinId);
});

class CoinViewModel extends StateNotifier<bool> {
  final CoinService _coinService;
  CoinViewModel({required CoinService coinService})
      : _coinService = coinService,
        super(false);

  Future<List<Coin>> getCoins() async {
    return _coinService.getCoins();
  }

  Future<CoinDetail> getCoinDetail(String coinId) async {
    return _coinService.getCoinDetail(coinId);
  }
}
