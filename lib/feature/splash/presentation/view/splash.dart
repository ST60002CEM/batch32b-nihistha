
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../home/presentation/view/home.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Material(
      child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: const Duration(milliseconds: 700),
          builder: (context, value, _) {
            return Column(
              children: [
                Opacity(
                  opacity: value,
                  child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: SvgPicture.asset(
                        'assets/images/starter_header.svg',
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(height: 15,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 70),
                  child: Text('Re-Home and\nAdopt a Pet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(44, 49, 49, 1.0),
                        fontSize: value*26,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ).apply(fontWeightDelta: 2)),
                ),
                const SizedBox(height: 15,),
                Text(
                  'Adopt me, we both need the love',
                  textScaleFactor: value,
                  style: TextStyle(color: Color(0xFF09D4D9)),
                ),
                const SizedBox(height: 15,),
                Opacity(
                  opacity: value,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => const Home()));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      backgroundColor: Color(0xff84D5D8),
                    ),
                    child: const Text('Get Started',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white
                        ),),
                  ),
                )
              ],
            );
          }
      ),
    );
  }
}