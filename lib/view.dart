import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/ProductUI.dart';
import 'package:provider_example/controller.dart';

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Controller()),
      ],
      child: ViewPresenter(),
    );
  }
}

class ViewPresenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controllerState = Provider.of<Controller>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Provider"),
        ),
        body: controllerState.loading
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: controllerState.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductUI(
                    product: controllerState.products[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  color: Colors.green,
                ),
              ));
  }
}
