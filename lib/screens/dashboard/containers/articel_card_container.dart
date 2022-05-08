import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ArticelCardContainer extends StatelessWidget {
  final String articelTitle;
  final String articelImageSource;

  const ArticelCardContainer({
    Key? key,
    required this.articelTitle,
    required this.articelImageSource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 189,
      height: 174,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0x49c4c4c4),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x146e34a5),
            blurRadius: 11,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              shape: BoxShape.rectangle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(articelImageSource),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(2),
              width: 189,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 6,
                  bottom: 2,
                ),
                child: AutoSizeText(
                  articelTitle,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.11,
                  ),
                  maxLines: 3,
                  minFontSize: 11,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
