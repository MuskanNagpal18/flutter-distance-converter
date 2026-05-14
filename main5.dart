import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DistanceConverter(),
    );
  }
}

class DistanceConverter
    extends StatefulWidget {
  const DistanceConverter(
      {super.key});

  @override
  State<DistanceConverter>
      createState() =>
          _DistanceConverterState();
}

class _DistanceConverterState
    extends State<
        DistanceConverter> {

  double kilometer = 0;
  double meter = 0;

  void convertDistance() {
    setState(() {
      meter =
          kilometer * 1000;
    });
  }

  @override
  Widget build(
      BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kilometer to Meter",
        ),
        centerTitle: true,
        backgroundColor:
            Colors.blue,
      ),

      body: Padding(
        padding:
            const EdgeInsets
                .all(20),

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment
                  .center,

          children: [

            TextField(
              keyboardType:
                  TextInputType
                      .number,

              decoration:
                  const InputDecoration(
                border:
                    OutlineInputBorder(),

                labelText:
                    "Enter Kilometer",

                hintText:
                    "Enter KM",
              ),

              onChanged:
                  (value) {
                kilometer =
                    double.tryParse(
                            value) ??
                        0;
              },
            ),

            const SizedBox(
                height: 20),

            Text(
              "$kilometer KM = "
              "$meter Meters",

              style:
                  const TextStyle(
                fontSize: 24,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      floatingActionButton:
          FloatingActionButton(
        onPressed:
            convertDistance,

        backgroundColor:
            Colors.blue,

        child: const Icon(
          Icons.swap_horiz,
        ),
      ),
    );
  }
}