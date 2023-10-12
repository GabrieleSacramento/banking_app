import 'dart:ui';

import 'package:flutter/material.dart';

class BlockedWidget extends StatelessWidget {
  Function() onTap;
  BlockedWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 15.0,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.05),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 150,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Column(
                  children: [
                    Icon(
                      Icons.lock,
                      size: 36,
                      color: Colors.white70,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Unlock to access',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: onTap,
                  icon: const Icon(Icons.fingerprint),
                  color: Colors.white70,
                  iconSize: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
