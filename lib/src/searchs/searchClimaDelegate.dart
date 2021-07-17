import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter/constants/StylesText.dart' as Styles;
import 'package:prueba_flutter/src/model/weather.dart';
import 'package:prueba_flutter/src/providers/ClimaProvider.dart';

class ClimaDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => "Buscar clima";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(
            Icons.clear,
          ))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Text("");
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("");
  }

  emptySuggestion() => Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No hay sugerencias ",
                style: Styles.textTipo1,
              ),
              Icon(
                Icons.search,
                size: 30,
              )
            ],
          ),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchClima = Provider.of<ClimaProvider>(context, listen: false);

    if (query.isEmpty || query == "") {
      return emptySuggestion();
    }

    return FutureBuilder(
      future: searchClima.getClimaSugerencia(query),
      builder: (_, AsyncSnapshot<List<Weather>> data) {
        if (!data.hasData) return emptySuggestion();

        final listClima = data.data!;

        return ListView.builder(
          itemBuilder: (context, index) {
            return _ItemClima(listClima[index]);
          },
          itemCount: listClima.length,
        );
      },
    );
  }
}

class _ItemClima extends StatelessWidget {
  final Weather item;
  _ItemClima(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: ListTile(
        title: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_city,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Text(
                  item.title + " - " + item.locationType,
                  style: Styles.textTipo1,
                )
              ],
            ),
            Divider(
              height: 15,
              color: Colors.grey[300],
            )
          ],
        ),
        onTap: () {
          Navigator.pushReplacementNamed(context, "detailsPage",
              arguments: item);
        },
      ),
    );
  }
}
