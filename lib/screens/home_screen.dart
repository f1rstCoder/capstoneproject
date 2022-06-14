import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: Drawer(),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Color.fromARGB(255, 0, 19, 126),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.lightBlue,
            ),
            onPressed: () {
              //passing this to our root
              // Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  const snackBar = SnackBar(content: Text('Tap'));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(12.0),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/child_learning.jpg'),
                    fit: BoxFit.cover,
                  )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ਵੀਡੀਓ',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          shadows: [
                            Shadow(
                                color: Colors.black.withOpacity(1),
                                offset: const Offset(0, 1),
                                blurRadius: 25),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  const snackBar = SnackBar(content: Text('Tap'));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(12.0),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/abascus_jpeg.jpg'),
                    fit: BoxFit.cover,
                  )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ਖੇਡਾਂ',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          shadows: [
                            Shadow(
                                color: Colors.black.withOpacity(1),
                                offset: const Offset(1, 1),
                                blurRadius: 25),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple,
                      Color.fromARGB(255, 0, 19, 126),
                    ],
                  ),
                ),
                child: Text(
                  'ਪੱਧਰ : 1',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    shadows: [
                      Shadow(
                          color: Colors.black.withOpacity(1),
                          offset: const Offset(1, 1),
                          blurRadius: 25),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
