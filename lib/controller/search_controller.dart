import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/model/service_model.dart';
import 'package:wheels_on_service/views/components/service_component.dart';
import 'package:wheels_on_service/views/pages/homepageTabs/services_details_page_.dart';

class ServicesSearch extends SearchDelegate<Services> {
  final List<Services> services;

  ServicesSearch(this.services);

  @override
  String get searchFieldLabel => 'Search services';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = services.where((service) =>
        service.name!.toLowerCase().contains(query.toLowerCase()) ||
        service.description!.toLowerCase().contains(query.toLowerCase()));

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final service = results.elementAt(index);

        return ListTile(
          title: Text(service.name!),
          subtitle: Text(service.description!),
          onTap: () {
            Get.to(ServiceDetailsPage(
              service: service,
            ));
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? services
        : services.where((service) =>
            service.name!.toLowerCase().contains(query.toLowerCase()) ||
            service.description!.toLowerCase().contains(query.toLowerCase()));

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final service = suggestions.elementAt(index);

        return ListTile(
          title: Text(service.name!),
          //subtitle: Text(service.description!),
          onTap: () {
            Get.to(ServiceDetailsPage(
              service: service,
            ));
          },
        );
      },
    );
  }

  // @override
  // void onSubmitted(String query) {
  //   // TODO: Implement onSubmitted functionality here.
  // }

}
