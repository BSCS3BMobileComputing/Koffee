import 'package:flutter/material.dart';
import '../constants.dart';

class ItemPage extends StatefulWidget {
  final CardDetails cardDetails;

  const ItemPage({super.key, required this.cardDetails});

  @override
  State<ItemPage> createState() => ItemPageState();
}

class ItemPageState extends State<ItemPage> {
  int purchaseCount = 1;
  int selectedSize = 1;
  double totalPrice = 0.0;

  void goBack() 
  {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context)
  {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double navBarBotHeight = screenHeight * navBarBotH;
    double fontSizeReg = screenWidth * bodyFontSize;
    double fontSizeLrg = screenWidth * headingFontSize;
    double iconSizeReg = screenWidth * iconSizeR;

    void showOverlay(BuildContext context, {required String text}) {
      OverlayState? overlayState = Overlay.of(context);
      OverlayEntry overlayEntry;

      overlayEntry = OverlayEntry(builder: (context)
      {
        return Positioned
        (
          bottom: screenHeight / 6,
          left: screenWidth / 4,
          child: ClipRRect
          (
            borderRadius: BorderRadius.circular(elementBorderRadius),
            child: Material 
            (
              color: primaryColor.withOpacity(0.85),
              child: SizedBox
              (
                width: screenWidth / 2,
                height: screenHeight / 10,
                child: Center
                (
                  child: Text
                  (
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle
                    (
                      fontSize: fontSizeReg,
                      fontWeight: FontWeight.bold,
                      letterSpacing: letterSpacing,
                      color: secondaryColor
                    ),
                  ),
                )
              )
            ),
          )
        );
      });
      overlayState.insert(overlayEntry);
      Future.delayed(const Duration(seconds: 3), () => overlayEntry.remove());
    }
    
    return Scaffold
    (
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SingleChildScrollView
      (
        child:Material
        (
          color: secondaryColor,
          child: Column
          (
            children: 
            [
              Stack
              (
                children: 
                [
                  AspectRatio
                  (
                    aspectRatio: 4 / 3,
                    child: ClipRRect
                    (
                      borderRadius: const BorderRadius.only
                      (
                        bottomLeft: Radius.circular(elementBorderRadius),
                        bottomRight: Radius.circular(elementBorderRadius),
                      ),
                      child: Image
                      (
                        image: AssetImage(widget.cardDetails.image), 
                        fit: BoxFit.cover,
                      )
                    )
                  ),
                  Positioned
                  (
                    top: 24.0,
                    left: 24.0,
                    child: ElevatedButton
                    (
                      onPressed: () => goBack(),
                      style: ElevatedButton.styleFrom
                      (
                        shape: RoundedRectangleBorder
                        (
                          borderRadius: BorderRadius.circular(elementBorderRadius)
                        ),
                        minimumSize: Size(iconSizeReg, 48),
                        backgroundColor: tertiaryColor,
                        foregroundColor: secondaryColor,
                        elevation: 0.0,
                      ),
                      child: Icon
                      (
                        Icons.arrow_back_rounded,
                        size: iconSizeReg,
                      ),
                    )
                  ),
                ],
              ),
              Padding
              (
                padding: const EdgeInsets.all(24.0),
                child: Column
                (
                  children:
                  [
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: 
                      [
                        Row
                        (
                          children: 
                          [
                            Text
                        (
                          widget.cardDetails.name,
                          style: TextStyle
                          (
                            fontSize: fontSizeLrg,
                            fontWeight: FontWeight.bold,
                            letterSpacing: letterSpacing,
                            color: primaryColor
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        
                          ],
                        ),
                        Material
                        (
                          color: tertiaryColor,
                          borderRadius: BorderRadius.circular(100.0),
                          child: ElevatedButton
                          (
                            onPressed: () 
                            {
                              setState
                              (() 
                                {
                                  widget.cardDetails.isFavorite = !widget.cardDetails.isFavorite;
                                }
                              );
                            }, 
                            style: ElevatedButton.styleFrom
                            (
                              shape: RoundedRectangleBorder
                              (
                                borderRadius: BorderRadius.circular(elementBorderRadius)
                              ),
                              minimumSize: Size(iconSizeReg, 48),
                              backgroundColor: tertiaryColor,
                              foregroundColor: secondaryColor,
                              elevation: 0.0,
                            ),
                            child: Icon
                            (
                              widget.cardDetails.isFavorite ? 
                              Icons.favorite_rounded : 
                              Icons.favorite_outline_rounded,
                              size: iconSizeReg,
                            ),
                          )
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    Row
                    (
                      children: 
                      [
                        Expanded
                        (
                          child: Text
                          (
                            widget.cardDetails.desc,
                            style: TextStyle
                            (
                              fontSize: fontSizeReg,
                              letterSpacing: letterSpacing,
                            ),
                            maxLines: 12,
                            overflow: TextOverflow.ellipsis,
                          )
                        )
                      ],
                    ),
                    const SizedBox(height: 48.0),
                    Row
                    (
                      children:
                      [
                        Text
                        (
                          "Your Order",
                          style: TextStyle
                          (
                            fontSize: fontSizeLrg,
                            fontWeight: FontWeight.bold,
                            letterSpacing: letterSpacing,
                            color: primaryColor
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    Row
                        (
                          children: 
                          [
                            ElevatedButton
                            (
                              onPressed: () 
                              {
                                setState
                                (() 
                                  {
                                    selectedSize = 0;
                                  }
                                );
                              }, 
                              style: ElevatedButton.styleFrom
                              (
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(elementBorderRadius)),
                                minimumSize: Size(iconSizeReg, 48),
                                backgroundColor: tertiaryColor,
                                foregroundColor: selectedSize == 0 ? secondaryColor : secondaryColorDim
                              ),
                              child: Text
                              (
                                "S",
                                style: TextStyle
                                (
                                  fontSize: fontSizeLrg,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: letterSpacing,
                                ),
                              )
                            ),
                            const SizedBox(width: 12.0),
                            ElevatedButton
                            (
                              onPressed: () 
                              {
                                setState
                                (() 
                                  {
                                    selectedSize = 1;
                                  }
                                );
                              },  
                              style: ElevatedButton.styleFrom
                              (
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(elementBorderRadius)),
                                minimumSize: Size(iconSizeReg, 48),
                                backgroundColor: tertiaryColor,
                                foregroundColor: selectedSize == 1 ? secondaryColor : secondaryColorDim
                              ),
                              child: Text
                              (
                                "M",
                                style: TextStyle
                                (
                                  fontSize: fontSizeLrg,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: letterSpacing,
                                ),
                              )
                            ),
                            const SizedBox(width: 12.0),
                            ElevatedButton
                            (
                              onPressed: () 
                              {
                                setState
                                (() 
                                  {
                                    selectedSize = 2;
                                  }
                                );
                              },  
                              style: ElevatedButton.styleFrom
                              (
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(elementBorderRadius)),
                                minimumSize: Size(iconSizeReg, 48),
                                backgroundColor: tertiaryColor,
                                foregroundColor: selectedSize == 2 ? secondaryColor : secondaryColorDim
                              ),
                              child: Text
                              (
                                "L",
                                style: TextStyle
                                (
                                  fontSize: fontSizeLrg,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: letterSpacing,
                                ),
                              )
                            ),
                          ],
                        ),
                    const SizedBox(height: 12.0),
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: 
                      [
                        SizedBox
                        (
                          width: screenWidth * 0.40,
                          child: Material
                          (
                            color: tertiaryColor,
                            textStyle: TextStyle
                            (
                              fontSize: fontSizeLrg,
                              fontWeight: FontWeight.bold,
                              letterSpacing: letterSpacing,
                              color: secondaryColor
                            ),
                            borderRadius: BorderRadius.circular(elementBorderRadius),
                            child: Row
                            (
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: 
                              [
                                ElevatedButton
                                (
                                  onPressed: () 
                                  {
                                    setState
                                    (() 
                                      {
                                        purchaseCount -= purchaseCount-- > 1 ? 1 : 0;
                                      }
                                    );
                                  }, 
                                  style: ElevatedButton.styleFrom
                                  (
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(elementBorderRadius)),
                                    minimumSize: const Size(1, 48),
                                    backgroundColor: tertiaryColor,
                                    foregroundColor: secondaryColor,
                                    elevation: 0.0,
                                  ),
                                  child: Icon
                                  (
                                    Icons.remove_rounded,
                                    size: iconSizeReg,
                                  ),
                                ),
                                Text
                                (
                                  "$purchaseCount",
                                  style: TextStyle
                                  (
                                    fontSize: fontSizeLrg,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: letterSpacing,
                                    color: secondaryColor
                                  ),
                                ),
                                ElevatedButton
                                (
                                  onPressed: () 
                                  {
                                    setState
                                    (() 
                                      {
                                        purchaseCount++;
                                      }
                                    );
                                  }, 
                                  style: ElevatedButton.styleFrom
                                  (
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(elementBorderRadius)),
                                    minimumSize: const Size(1, 48),
                                    backgroundColor: tertiaryColor,
                                    foregroundColor: secondaryColor,
                                    elevation: 0.0,
                                  ),
                                  child: Icon
                                  (
                                    Icons.add_rounded,
                                    size: iconSizeReg,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ), 
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 10)
                  ],
                )
              ),
            ]
          ),
        ),
      ),
      
      bottomNavigationBar: ClipRRect
      (
        borderRadius: const BorderRadius.only
        (
          topLeft: Radius.circular(elementBorderRadius), 
          topRight: Radius.circular(elementBorderRadius)
        ),
        child: BottomAppBar
        (
          height: navBarBotHeight,
          color: primaryColor,
          child: Row
          (
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: 
            [
              Expanded
              (
                child: ElevatedButton.icon
                (
                  onPressed: () 
                  {
                    showOverlay(context, text: "Added to Cart");
                    setState
                    (() 
                      {
                        selectedSize = 1;
                        purchaseCount = 1;
                      }
                    );
                  },
                  style: ElevatedButton.styleFrom
                  (
                    elevation: 0.0,
                    backgroundColor: primaryColor,
                    foregroundColor: secondaryColor,
                  ),
                  icon: Icon
                  (
                    Icons.add_shopping_cart_rounded,
                    size: iconSizeReg,
                  ),
                  label: Text
                  (
                    "Add to Cart",
                    style: TextStyle
                    (
                      fontSize: fontSizeLrg,
                      fontWeight: FontWeight.bold,
                      letterSpacing: letterSpacing,
                    ),
                  ),
                )
              ),
              Row
              (
                children: 
                [
                  Container
                  (
                    decoration: BoxDecoration
                    (
                      border: Border
                      (
                        left: BorderSide
                        (
                          color: secondaryColorDim
                        )
                      )
                    ),
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: Text
                    (
                      "₱${((widget.cardDetails.price * purchaseCount) + 10 * selectedSize * purchaseCount).toStringAsFixed(2)}",
                      style: TextStyle
                      (
                        fontSize: fontSizeLrg,
                        fontWeight: FontWeight.bold,
                        letterSpacing: letterSpacing,
                        color: secondaryColor
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ),
      )
    );
  }
}