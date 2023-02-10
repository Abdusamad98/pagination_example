import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_example/cubit/pagination_cubit.dart';
import 'package:pagination_example/models/my_order_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int page = 0;

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    _loadMore(0);
    scrollController.addListener(() {
      print("CURRENT LIST PIXEL:${scrollController.position.pixels}");
      print("MAX LIST PIXEL:${scrollController.position.maxScrollExtent}");
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _loadMore(page);
      }
    });
    super.initState();
  }

  _loadMore(int index) async {
    var cubit = BlocProvider.of<PaginationCubit>(context);
    if (!cubit.isFinished) {
      cubit.loadOrders(index, 15);
      page++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagination Example"),
      ),
      body: BlocBuilder<PaginationCubit, PaginationState>(
        builder: (context, state) {
          if (state is LoadInProgress) {
            return const CircularProgressIndicator();
          } else if (state is LoadInSuccess) {
            List<OrdersListItem> orders = state.orders;
            print("ORDERS LENGTH:${state.orders.length}");
            return ListView.builder(
              controller: scrollController,
              itemCount: orders.length + 1,
              itemBuilder: (BuildContext context, index) {
                if (index == orders.length) {
                  return Opacity(
                    opacity:
                        context.read<PaginationCubit>().isFinished ? 0.0 : 1.0,
                    child: const SizedBox(
                      height: 40,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                } else {
                  var item = state.orders[index];
                  return SizedBox(
                    child: ListTile(
                      title: Text(item.brandName),
                      subtitle: Text(item.orderPrice.toString()),
                    ),
                  );
                }
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
