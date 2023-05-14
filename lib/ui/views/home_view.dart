import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mvvm_firebase/constants/map_index.dart';
import 'package:stacked/stacked.dart';

import '../../models/beers_model.dart';
import '../../viewmodels/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        onViewModelReady: (model) => model.fetchBeers(),
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: const Color.fromARGB(255, 70, 70, 70),
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: const Text("Beers"),
              ),
              body: model.baseModel.busy
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      children: model.beersList
                          .mapIndexed((int index, BeersModel element) {
                        return ExpansionTile(
                          iconColor: Colors.white,
                          collapsedIconColor: Colors.white,
                          collapsedShape:
                              Border.all(color: Colors.white, width: 0.3),
                          shape: Border.all(color: Colors.white, width: 0.3),
                          leading: Text(
                            (index + 1).toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          onExpansionChanged: (value) {
                            for (var element in model.beersList) {
                              element.isSelected = false;
                            }
                            element.isSelected = value;
                            model.highlightedColor();
                          },
                          tilePadding: const EdgeInsets.all(20),
                          title: Text(
                            element.name!,
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: element.isSelected == true
                                    ? Color.fromARGB(255, 204, 255, 0)
                                    : Colors.white),
                          ),
                          subtitle: Text(
                            element.tagline!,
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                color: element.isSelected == true
                                    ? Color.fromARGB(255, 204, 255, 0)
                                    : Colors.white),
                          ),
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                element.description!,
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                            ),
                            ListTile(
                              title: Image.network(
                                element.imageUrl!,
                                height: MediaQuery.of(context).size.height / 2,
                              ),
                            )
                          ],
                        );
                      }).toList(),
                    ));
        });
  }
}
