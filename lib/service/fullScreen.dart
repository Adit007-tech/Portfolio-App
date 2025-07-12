import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class fullScreen extends StatefulWidget{
  final String imageurl;

  const fullScreen({super.key, required this.imageurl});
  @override
  State<fullScreen> createState() => _fullScreenState();
}

class _fullScreenState extends State<fullScreen> {
  final wallpaperManager = WallpaperManagerFlutter();
  setWallpaper() async{
        // int location = WallpaperManagerFlutter.homeScreen()
    try{
        var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
        final bool result = await wallpaperManager.setWallpaper(file.path, WallpaperManagerFlutter.homeScreen);
            // await WallpaperManagerFlutter.setWallpaperFromFile(file.path, location);
        if (result) {
          print('Wallpaper set successfully! 🎉');
        }
      } catch (e) {
        print('Error setting wallpaper: $e ❌');
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
                  child: Image.network(widget.imageurl),
                ),
            ),
            Container(
              color: Colors.black,
              height: 50,
              child: Center(
                  child: InkWell(
                    onTap: (){
                      setWallpaper();
                    },
                    child: Text("Set wallpaper",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white
                      ),
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}