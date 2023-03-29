import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_shopping/core/navigation/app_router.dart';
import 'package:task_shopping/main.dart';
import 'package:task_shopping/presentation/state/shopping_state.dart';
import 'package:task_shopping/presentation/view_models/shopping_view_model.dart';

@RoutePage()
class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  void initState() {
    super.initState();
    getShoppingItems();
  }

  Future<void> getShoppingItems() async {
    context.read<ShoppingViewModel>().getShoppingItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bar_chart,
              color: Colors.black,
            ),
            onPressed: () {
              getIt<AppRouter>().push(ShoppingChartsRoute(
                  shoppingViewModel: context.read<ShoppingViewModel>()));
            },
          )
        ],
      ),
      body: BlocBuilder<ShoppingViewModel, ShoppingState>(
        builder: (context, state) {
          if (state is ShoppingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ShoppingLoaded) {
            final items = state.items;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price: \$${item.price}'),
                        Text('Quantity: ${item.quantity}'),
                        Text(
                            'Warranty period: ${DateFormat.yMMMd().format(item.warrantyPeriod)}'),
                        Text(
                            'Purchase time: ${DateFormat.yMMMd().format(item.purchaseTime)}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context
                            .read<ShoppingViewModel>()
                            .deleteShoppingItem(item.id);
                      },
                    ),
                  ),
                );
              },
            );
          } else if (state is ShoppingError) {
            return Center(
              child: Text(
                'An error occurred: ${state.message}',
              ),
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await getIt<AppRouter>().push(AddShoppingItemRoute(
              viewModel: context.read<ShoppingViewModel>()));
          getShoppingItems();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
