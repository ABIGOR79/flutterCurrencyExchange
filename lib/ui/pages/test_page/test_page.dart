import 'package:flutter/material.dart';
import 'package:flutter_app/ui/pages/test_page/test_page_cubit.dart';
import 'package:flutter_app/ui/pages/test_page/test_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final cubit = TestPageCubit();

  @override
  void initState() {
    super.initState();
    cubit.getSameList(cubit.state.isState);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestPageCubit, TestPageState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Test Page'),
          ),
          body: Column(
            children: [
              Switch(
                  value: state.isState, onChanged: (_) => cubit.switchState()),
              TextFieldWidget(cubit: cubit),
              if (state.isLoading)
                Center(child: CircularProgressIndicator())
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: state.filteredList.length,
                    itemBuilder: (context, i) {
                      final item = state.filteredList[i];
                      return ListTile(
                        title: Text(item),
                      );
                    },
                  ),
                ),
              // Expanded(
              //   child: ListView(
              //     children: state.myList
              //         .map((el) => ListTile(title: Text(el)))
              //         .toList(),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.cubit,
  });

  final TestPageCubit cubit;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: cubit.qureyText,
      decoration: InputDecoration(
        hintText: 'Поиск...',
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            cubit.qureyText.clear();
            cubit.filteredList('');
          },
        ),
      ),
      onChanged: (value) {
        cubit.filteredList(value);
      },
    );
  }
}
