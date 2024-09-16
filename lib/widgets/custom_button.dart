import 'package:flutter/material.dart';

class cutombutton extends StatelessWidget {
  const cutombutton({super.key, this.onTap, this.isloading = false});
  final void Function()? onTap;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Color(0xff62FCD7)),
        child: Center(
          child: isloading
              ? SizedBox(
                width: 20,height: 20,
                child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
              )
              : Text(
                  'Add',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                ),
        ),
      ),
    );
  }
}
