import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:parallax_rain/parallax_rain.dart';
import 'package:motion/motion.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
 await Motion.instance.initialize();
  runApp(const MaterialApp(
  home: MainApp(),
  debugShowCheckedModeBanner: false,
  )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final String nama = "Hasan";
  final String nim = "00000";

  void _tampilPesan(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
          title: Text("Pesan", style: 
          TextStyle(
            fontWeight: FontWeight.bold
          )),
          content: Text("Anda Telah Mengklik Tombol"),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 3,
              ),

              onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: Text("Kembali")),
              
          ],
        );
      });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Data Mahasiswa",
          style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white
          ),
          
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 8,
        shadowColor: Colors.tealAccent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.vertical(bottom: Radius.circular(20))
        ),
      ),
        body: ParallaxRain(
            dropColors: [
              Colors.red,
              Colors.green,
              Colors.blue,
              Colors.yellow,
              Colors.brown,
              Colors.blueGrey
      ],
      
          child: Center(
            child: Motion(
              shadow: null,
              child: Card(
                elevation: 10,
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.symmetric(
                  horizontal: 30, vertical: 80,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 70
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: const AssetImage(
                          'assets/profile.png',
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Nama : $nama",
                        style: const TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Nim : $nim",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const 
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
                          backgroundColor: Colors.teal,
                          shadowColor: Colors.tealAccent,
                          elevation: 5,
                        ),
                        onPressed: () {
                          _tampilPesan(context);
                        }, 
                        child: Text(
                          "Klik Disini",
                          style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold, 
                            color: Colors.white,
                          ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.tealAccent,
          items: <Widget>[
            Icon(Icons.home, size: 30, semanticLabel: "Home"),
            Icon(Icons.accessibility_new_outlined, size: 30),
            Icon(Icons.settings, size: 30),
            
          ]
          ),

    );
  }
}
