import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/list_tile.dart';
import 'package:flutter_app/repository/abstract_coins_repository.dart';
import 'package:flutter_app/repository/load_data_factory.dart';
import 'package:flutter_app/ui/pages/home_page/home_page_cubit.dart';
import 'package:flutter_app/ui/pages/home_page/home_page_event.dart';
import 'package:flutter_app/ui/pages/home_page/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
  late CoinBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = CoinBloc(GetIt.I<LoadDataFactory>());
    bloc.add(LoadCoinsEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Coins Trade'),
        actions: [
          Row(
            children: [
              const Text('Network'),
              BlocBuilder<CoinBloc, CoinState>(
                bloc: bloc,
                builder: (context, state) {
                  return Switch(
                    value: state.useNetwork,
                    onChanged: (value) {
                      bloc.add(ToggleDataSourceEvent(value));
                      bloc.add(LoadCoinsEvent());
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer<void>();
          bloc.add(LoadCoinsEvent());
          await Future.delayed(const Duration(seconds: 2));
          completer.complete();
          return completer.future;
        },
        child: BlocBuilder<CoinBloc, CoinState>(
          bloc: bloc,
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.coins.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              labelText: 'Search by symbol',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (query) {
                              bloc.add(UpdateSearchQueryEvent(query));
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        DropdownButton<String>(
                          value: state.selectedCurrency ?? 'All',
                          hint: const Text('Select currency'),
                          items: [
                            const DropdownMenuItem<String>(
                              value: 'All',
                              child: Text('All Currencies'),
                            ),
                            ...state.coins.map((coin) {
                              return DropdownMenuItem<String>(
                                value: coin.symbol,
                                child: Text(coin.symbol),
                              );
                            }).toList(),
                          ],
                          onChanged: (value) {
                            final selected = value == 'All' ? null : value;
                            bloc.add(UpdateSelectedCurrencyEvent(selected));
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.filteredCoins.length,
                      itemBuilder: (context, i) {
                        final coin = state.filteredCoins[i];
                        return CoinItem(coin: coin);
                      },
                      separatorBuilder: (context, i) => const Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.add(LoadCoinsEvent());
        },
        tooltip: 'Load Data',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
