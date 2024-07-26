import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Modal/pixabayModal.dart';
import '../Provider/Provider.dart';
// Ensure you have the correct path to your provider

TextEditingController txtImg = TextEditingController();
class PixabayScreen extends StatelessWidget {
  const PixabayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PixabayProvider pixabayProviderTrue =
        Provider.of<PixabayProvider>(context, listen: true);
    PixabayProvider pixabayProviderFalse =
        Provider.of<PixabayProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: txtImg,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12)
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              pixabayProviderFalse.searchImage(txtImg.text);
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: FutureBuilder<Pixabay?>(
        future: Provider.of<PixabayProvider>(context, listen: false)
            .fromMap(pixabayProviderTrue.search),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            Pixabay? pixabay = snapshot.data;
            return pixabay != null
                ? buildContent(pixabay)
                : Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  Widget buildContent(Pixabay pixabay) {
    // Extract the list of Hit objects from the Pixabay object
    List<Hit> hits = pixabay.http.cast<Hit>();

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid
        childAspectRatio: 1, // Aspect ratio of the grid items
      ),
      itemCount: hits.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    hits[index].web,
                  ),
                )),
          ),
        );
      },
    );
  }
}
