import 'package:coffee_store/constants/constants.dart';
import 'package:coffee_store/function/cart_function.dart';
import 'package:coffee_store/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ScreenHome extends StatefulWidget {
  String name;
  ScreenHome({super.key, required this.name});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _tabs = const [
    Tab(text: 'Cappuccino'),
    Tab(text: 'Machiato'),
    Tab(text: 'Latte'),
  ];

 late List<bool> favourite;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    favourite = List.filled(image.length, false);
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/home.jpg'),
                        fit: BoxFit.cover)),
                height: MediaQuery.of(context).size.width / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Hey ${widget.name}\n',
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 14,
                            fontFamily: 'Sora',
                          )),
                      const TextSpan(
                          text: 'Find the best coffee for you',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Sora',
                          ))
                    ])),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/user.jpg'))),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 10,
                    ),
                    TabBar(
                      indicatorPadding:
                          const EdgeInsets.symmetric(horizontal: -15),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: secondaryColor,
                      ),
                      dividerColor: Colors.transparent,
                      controller: _tabController,
                      labelPadding: EdgeInsets.zero,
                      labelColor: Colors.white,
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                      unselectedLabelStyle:
                          const TextStyle(fontWeight: FontWeight.normal),
                      unselectedLabelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: _tabs,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GridView.count(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.64,
                          mainAxisSpacing: 20,
                          children: List.generate(4, (index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          image[index],
                                          fit: BoxFit.cover,
                                          height: 150,
                                        )),
                                    Positioned(
                                        top: 10,
                                        right: 10,
                                        child: GestureDetector(
                                          onTap: ()=>setState(() {
                                            favourite[index]=!favourite[index];
                                          }),
                                          child: CircleAvatar(
                                            
                                            radius: 15,
                                            backgroundColor: Colors.white,
                                            child: favourite[index]?SvgPicture.asset(
                                              'assets/icons/red_favourite.svg',
                                              height: 18,
                                            ) :SvgPicture.asset(
                                              'assets/icons/favourite.svg',
                                              height: 18,
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                     const Text(
                                        'Cappucino',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Sora',
                                            fontSize: 16),
                                      ),
                                     const Text(
                                        'with Chocolate',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'Sora',
                                            fontSize: 12),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            price[index],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Sora',
                                                fontSize: 16),
                                          ),
                                          GestureDetector(
                                          onTap: (){
                                          
                                          addCart(CartModel(name: 'Cappucino', description: 'with Chocolate', price: price[index], image: image[index]));
                                          },
                                            child: Image.asset(
                                              'assets/images/add.png',
                                              height: 30,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          })),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.width / 2.3,
            left: 20,
            right: 20,
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Align(
                    widthFactor: 1,
                    child: SvgPicture.asset(
                      'assets/icons/search-normal.svg',
                      height: 25,
                    )),
                suffixIcon: const Align(
                    widthFactor: 1,
                    child: Image(
                      image: AssetImage('assets/images/filter.png'),
                      height: 30,
                    )),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]!),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]!),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  List<String> image = [
    'assets/images/product1.jpg',
    'assets/images/product2.jpg',
    'assets/images/product3.jpg',
    'assets/images/product4.jpg'
  ];

  List<String> price = [
    '\$ 4.53',
    '\$ 3.9',
    '\$ 4.95',
    '\$ 3.52',
  ];
}
