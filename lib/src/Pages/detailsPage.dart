import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter/constants/header_widget.dart';
import 'package:prueba_flutter/src/model/DetailsWeather.dart';
import 'package:prueba_flutter/src/model/weather.dart';
import 'package:prueba_flutter/src/providers/ClimaProvider.dart';
import 'package:prueba_flutter/constants/StylesText.dart' as Styles;
import 'package:intl/intl.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final clima = ModalRoute.of(context)?.settings.arguments as Weather;
    final searchClima = Provider.of<ClimaProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle del clima" + clima.title),
      ),
      body: Stack(children: [
        HeaderWaveWidget(),
        Container(
            padding: EdgeInsets.all(10),
            child: detalleClima(context, clima, searchClima)),
      ]),
    );
  }

  Column detalleClima(
      BuildContext context, Weather clima, ClimaProvider searchClima) {
    return Column(
      children: [
        visualizarValor(context, "Titulo", clima.title),
        visualizarValor(context, "Tipo", clima.locationType),
        visualizarValor(context, "Coordenadas", clima.lattLong),
        Text("Pronosticos",
            textAlign: TextAlign.center, style: Styles.textDetailBold),
        Container(
            padding: EdgeInsets.all(15),
            child: _detalleWidget(searchClima: searchClima, clima: clima)),
      ],
    );
  }

  visualizarValor(BuildContext context, String label, String valor) {
    return Container(
      padding: EdgeInsets.only(bottom: 3),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label + ": ",
            style: Styles.textFormBold,
          ),
          SizedBox(height: 4),
          Text(
            valor,
            style: Styles.textForm,
          )
        ],
      ),
    );
  }
}

class _detalleWidget extends StatelessWidget {
  const _detalleWidget({
    Key? key,
    required this.searchClima,
    required this.clima,
  }) : super(key: key);
  final ClimaProvider searchClima;
  final Weather clima;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.56,
        child: FutureBuilder(
          future: searchClima.getClimaDetalle(clima.woeid),
          builder:
              (BuildContext context, AsyncSnapshot<DetailsWeather> snapshot) {
            if (!snapshot.hasData) return Text("No se encontraron pronosticos");

            final DetailsWeather listClimaDetalle = snapshot.data!;
            final pronosticos = listClimaDetalle.consolidatedWeather;
            final lista = ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final ConsolidatedWeather obj = pronosticos[index];

                return getCard(context, obj);
              },
              itemCount: pronosticos.length < 4 ? pronosticos.length : 3,
            );
            return lista;
          },
        ));
  }

  Card getCard(BuildContext context, ConsolidatedWeather obj) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.all(15),
        elevation: 10,
        // Dentro de esta propiedad usamos ClipRRect
        child: ClipRRect(
          // Los bordes del contenido del card se cortan usando BorderRadius
          borderRadius: BorderRadius.circular(30),

          // EL widget hijo que será recortado segun la propiedad anterior
          child: Column(
            children: <Widget>[
              // Usamos el widget Image para mostrar una imagen
              Image(
                // Como queremos traer una imagen desde un url usamos NetworkImage
                image: NetworkImage(
                    "https://www.metaweather.com/static/img/weather/png/" +
                        obj.weatherStateAbbr +
                        ".png",
                    scale: 10),
              ),
              // Usamos Container para el contenedor de la descripción
              Container(
                height: 150,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      obj.weatherStateName,
                      style: Styles.textFormBold,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          this.visualizarValor(context, "Temperatura maxima",
                              obj.maxTemp.roundToDouble().toString()),
                          SizedBox(height: 5),
                          this.visualizarValor(context, "Temperatura minima",
                              obj.minTemp.roundToDouble().toString()),
                          SizedBox(height: 5),
                          this.visualizarValor(
                            context,
                            "Fecha aplicable",
                            formatter.format(
                                DateTime.parse(obj.applicableDate.toString())),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  visualizarValor(BuildContext context, String label, String valor) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label + " : ",
            style: Styles.textDetailBold,
          ),
          Text(
            valor,
            style: Styles.textDetail,
          ),
        ],
      ),
    );
  }
}
