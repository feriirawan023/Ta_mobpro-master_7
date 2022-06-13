import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/data_rental.dart';
import 'package:flutter_application_2/data/rental.dart';
import 'package:flutter_application_2/data/profile.dart';

// ignore: camel_case_types
class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Profile(),
               
                ),
              );
            },
          ),
             Icon (Icons.search),
        ],
        backgroundColor: const Color.fromRGBO(30, 107, 135, 100),
        title: const Text('Daftar Mobil Rental'),
      ),
      body: ListView.builder(
          itemCount: dataRental.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(
                              rentals: dataRental[index],
                            )));
              },
              child: Card(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                        child: Image.asset(
                          dataRental[index].image,
                          width: 150,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dataRental[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromRGBO(30, 107, 135, 100))),
                        Text('Biaya Sewa : ${dataRental[index].sewa}'),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
