import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:liverpool2_app/widgets/puntitos_widget.dart';
import './widgets/product_view.dart';
import './services/product_service.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Liverpool'),
          backgroundColor: Color.fromARGB(255, 245, 82, 223),
        ),
        body: ListView(
          children: [
            CarouselSlider(
              items: const [
                Image(
                    image: NetworkImage(
                        'http://www.ctsi.com.mx/liverpool/principal/principal1.jpg')),
                Image(
                    image: NetworkImage(
                        'http://www.ctsi.com.mx/liverpool/principal/principal2.jpg')),
                Image(
                    image: NetworkImage(
                        'http://www.ctsi.com.mx/liverpool/principal/principal3.jpg'))
              ],
              carouselController: _controller,
              options: CarouselOptions(
                  height: 350,
                  viewportFraction: 1,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            puntitos_widget(position: _current + 1),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Productos vistos recientemente',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            FutureBuilder(
                future: getProducts(1),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: 220.0,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return (
                                //Text(snapshot.data![index].name.toString())
                                ProductView(
                                    name: snapshot.data![index].name.toString(),
                                    url: snapshot.data![index].image.toString(),
                                    price: snapshot.data![index].price));
                          }),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Recomendaciones para ti',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            FutureBuilder(
                future: getProducts(2),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: 220.0,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return (
                                //Text(snapshot.data![index].name.toString())
                                ProductView(
                                    name: snapshot.data![index].name.toString(),
                                    url: snapshot.data![index].image.toString(),
                                    price: snapshot.data![index].price));
                          }),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            SizedBox(
              height: 15,
            ),
            Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Image(
                            image: NetworkImage(
                                'http://www.ctsi.com.mx/liverpool/principal/secundaria1.jpg')),
                      ),
                      Text(
                        'Todos los estilos todas las siluetas',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
