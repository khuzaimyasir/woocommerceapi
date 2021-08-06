import 'package:flutter/material.dart';
import 'package:project_10/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

class HomeDetailPage extends StatelessWidget {
  Future _getProducts() async {
    // Initialize the API
    WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
      url: "https://silkofactory.com",
      consumerKey: "ck_57500cea4ecb9dea0df9e3d42d1394fb3430e23b",
      consumerSecret: "cs_606727c70c6524bb45716aea67b25ebab3da1f2f",
    );

    // Get data using the "products" endpoint
    var products = await wooCommerceAPI.getAsync("products");
    return products;
  }

// class HomeDetailPage  extends StatelessWidget {
//   const HomeDetailPage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("kys"),
      ),
      bottomNavigationBar: Container(
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          //  buttonPadding: EdgeInsets.zero,
          children: [
            "rs".text.bold.xl4.red800.make(),
            //  AddToCart(catalog: catalog,).wh(120, 50)
          ],
        ),
      ).p32(),
      body: FutureBuilder(
        future: _getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // Create a list of products
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return SafeArea(
                  child: Container(
                    child: Card(
                      elevation: 10,
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, Myroutes.homeDetailsRoute),
                        child: Container(
                            height: 200.0,
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Image.network(
                                  snapshot.data[index]["images"][0]["src"]),
                            )),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          // Show a circular progress indicator while loading products
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}


// Widget horiPuctSlider() {
//   Future _getProducts() async {
//     // Initialize the API
//     WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
//         url: "https://officialguidance.com",
//         consumerKey: "ck_48cb95b7b48caab26b53c9211eb2dd4ac1f74534",
//         consumerSecret: "cs_aa2b16888cf01d202342c4b3c5f9594844a393ff");

//     // Get data using the "products" endpoint
//     var products = await wooCommerceAPI.getAsync("products");
//     return products;
//   }


//     return Scaffold(
//       appBar: AppBar(
//         title: Text("jsjsj"),
//       ),
//       body: FutureBuilder(
//         future: _getProducts(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.hasData) {
//             // Create a list of products
//             return ListView.builder(
//               itemCount: snapshot.data.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   leading: CircleAvatar(
//                     child:
//                         Image.network(snapshot.data[index]["images"][0]["src"]),
//                   ),
//                   title: Text(snapshot.data[index]["name"]),
//                   subtitle:
//                       Text("Buy now for \Rs " + snapshot.data[index]["price"]),
//                 );
//               },
//             );
//           }

//           // Show a circular progress indicator while loading products
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }


// Widget horizontallProductSlider() {
// Future _getProducts() async {
//     // Initialize the API
//     WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
//         url: "https://officialguidance.com",
//         consumerKey: "ck_48cb95b7b48caab26b53c9211eb2dd4ac1f74534",
//         consumerSecret: "cs_aa2b16888cf01d202342c4b3c5f9594844a393ff");

//     // Get data using the "products" endpoint
//     var products = await wooCommerceAPI.getAsync("products");
//     return products;
  


//   return Column(
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text("Picked for you",
//               style: TextStyle(
//                 color: Colors.red,
//                 fontSize: 33,
//               )),
//           TextButton(
//               onPressed: () {},
//               child: Text(
//                 "view more",
//                 style: TextStyle(color: Colors.red),
//               ))
//         ],
//       ),
//       SizedBox(
//           height: 200,
//           child: ListView.builder(
//             scrollDirection: Axis.vertical,
//             itemCount: 5,
//             itemBuilder: (BuildContext context, int index) {
//               return Stack(children: [
//                 Container(
//                   child: Card(
//                     elevation: 10,
//                     child: InkWell(
//                       onTap: () {},
//                       child: Container(
//                           height: 250.0,
//                           child: AspectRatio(
//                             aspectRatio: 1 / 1,
//                             child: Image.network(
//                                 "https://www.pakstyle.pk/img/products/l/p13686-embroidered-lawn-dress_1.jpg"),
//                           )),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                     top: 15,
//                     left: 15,
//                     child: Chip(
//                         label: Text(
//                       '-50%',
//                       style: TextStyle(color: Colors.red),
//                     ))),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SizedBox(
//                     height: 30,
//                     child: Text(
//                       'RS1500',
//                       style: TextStyle(decoration: TextDecoration.lineThrough),
//                     ),
//                   ),
//                 )
//               ]);
//             },
//           )),
//     ],
//   );
// }
