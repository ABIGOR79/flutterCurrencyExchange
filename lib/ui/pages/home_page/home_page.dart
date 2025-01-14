import 'package:flutter/material.dart';
import 'package:flutter_app/components/list_tile.dart';
import 'package:flutter_app/repository/get_data.dart';
import 'package:flutter_app/ui/pages/home_page/home_page_cubit.dart';
import 'package:flutter_app/ui/pages/home_page/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
  late CoinCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = CoinCubit(GetData());
    cubit.loadCoins();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Coins Trade'),
      ),
      body: BlocBuilder<CoinCubit, CoinState>(
        bloc: cubit,
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
                          onChanged: cubit.updateSearchQuery,
                        ),
                      ),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        value: cubit.selectedCurrency ?? 'All',
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
                          cubit.updateSelectedCurrency(selected);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cubit.loadCoins();
        },
        tooltip: 'Load Data',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
