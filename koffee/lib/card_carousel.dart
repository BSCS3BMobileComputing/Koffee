import 'package:flutter/material.dart';
import 'package:koffee/pages/item_page.dart';
import 'constants.dart';

class CardCarousel extends StatefulWidget {
  final Carousel carousel;

  const CardCarousel({super.key, required this.carousel});

  @override
  State<CardCarousel> createState() => CardCarouselState();
}

class CardCarouselState extends State<CardCarousel> {

  @override
  Widget build(BuildContext context) 
  {
    double screenWidth = MediaQuery.of(context).size.width;

    double fontSizeLrg = screenWidth * headingFontSize;
    double cardWidth = screenWidth * cardW;
    double cardHeight = cardWidth * 1.65;

    return Padding
    (
      padding: const EdgeInsets.only
      (
        top: 20.0, 
        bottom: 20.0
      ),
      child: Column
      (
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Container
          (
            padding: const EdgeInsets.all(20.0),
            child: Text
            (
              widget.carousel.title,
              style: TextStyle
              (
                fontSize: fontSizeLrg,
                fontWeight: FontWeight.bold,
                letterSpacing: letterSpacing,
                color: primaryColor,
              ),
            ),
          ),
          SizedBox
          (
            height: cardHeight,
            child: ListView.separated
            (
              shrinkWrap: true,
              clipBehavior: Clip.none,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              scrollDirection: Axis.horizontal,
              itemCount: widget.carousel.cardDetails.length,
              separatorBuilder: (context, _) => const SizedBox(width: 20.0),
              itemBuilder: (context, index) => InfoCard
              (
                cardDetails: widget.carousel.cardDetails[index]
              ),
            ),
          ),
        ],
      )
    );
  }
}

class InfoCard extends StatefulWidget {
  final CardDetails cardDetails;

  const InfoCard({super.key, required this.cardDetails});

  @override
  State<InfoCard> createState() => InfoCardState();
}

class InfoCardState extends State<InfoCard> {

  void goToItemPage(CardDetails cardDetails) 
  {
    Navigator.push
    (
      context,
      MaterialPageRoute
      (
        builder: (context) => ItemPage
        (
          cardDetails: cardDetails
        )
      )
    );
  }

  @override
  Widget build(BuildContext context)
  {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool isWidth300(BuildContext context) => screenWidth <= 300;

    double fontSizeReg = screenWidth * bodyFontSize;
    double fontSizeLrg = screenWidth * headingFontSize;
    double iconSizeReg = screenWidth * iconSizeR;
    double cardWidth = screenWidth * cardW;
    double imageWidth = screenWidth * cardW;
    double imageHeight = screenHeight * 0.10;
    double responsivePadding = screenWidth * 0.015;

    return Container
    (
      width: cardWidth,
      decoration: BoxDecoration
      (
        borderRadius: BorderRadius.circular(elementBorderRadius),
        boxShadow: const [cardShadow]
      ),
      child: Card
      (
        shape: RoundedRectangleBorder
        (
          borderRadius: BorderRadius.circular
          (
            elementBorderRadius
          )
        ),
        color: tertiaryColor,
        child: Column
        (
          children: 
          [
            AspectRatio
            (
              aspectRatio: 4 / 3,
              child: ClipRRect
                  (
                    borderRadius: BorderRadius.circular(elementBorderRadius),
                    child: Material
                    (
                      child: Ink.image
                      (
                        image: AssetImage(widget.cardDetails.image), 
                        fit: BoxFit.cover,
                        width: imageWidth,
                        height: imageHeight,
                        child: InkWell
                        (
                          onTap: () => goToItemPage(widget.cardDetails)
                        ),
                      )
                    )
                  ),
            ),
            Expanded
            (
              child: Padding
              (
                padding: const EdgeInsets.all(24.0),
                child: Column
                (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: 
                  [
                    Column
                    (
                      children: 
                      [
                        Row
                        (
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                color: secondaryColor,
                                overflow: TextOverflow.ellipsis
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            IconButton
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
                              color: secondaryColor,
                              icon: Icon
                              (
                                widget.cardDetails.isFavorite ?
                                Icons.favorite_rounded :
                                Icons.favorite_outline_rounded,
                                size: iconSizeReg,
                              ),
                              padding: EdgeInsets.zero,
                              constraints: isWidth300(context) ? const BoxConstraints() : null,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
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
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: letterSpacing,
                                  color: secondaryColor,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container
                    (
                      decoration: BoxDecoration
                      (
                        borderRadius: BorderRadius.circular(elementBorderRadius), 
                        color: primaryColor
                      ),
                      child: Row
                      (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: 
                        [
                          Expanded
                          (
                            child: Text
                            (
                              "₱${widget.cardDetails.price}",
                              textAlign: TextAlign.center,
                              style: TextStyle
                              (
                                fontSize: fontSizeLrg,
                                fontWeight: FontWeight.bold,
                                letterSpacing: letterSpacing,
                                color: secondaryColor,
                              ),
                            ),
                          ),
                          Container
                          (
                            padding: EdgeInsets.all(responsivePadding),
                            decoration: BoxDecoration
                            (
                              borderRadius: BorderRadius.circular(elementBorderRadius),
                              color: secondaryColor
                            ),
                            child: IconButton
                                (
                                  onPressed: () => goToItemPage(widget.cardDetails), 
                                  color: primaryColor,
                                  splashColor: Colors.transparent,
                                  icon: Icon
                                  (
                                    Icons.arrow_forward_rounded,
                                    size: iconSizeReg,
                                  ),
                                  padding: EdgeInsets.zero,
                                  constraints: isWidth300(context) ? const BoxConstraints() : null,
                                )
                          )
                        ],
                      )
                    )
                  ],
                )
              ),
            )  
          ],
        ),
      ),
    );
  }
}