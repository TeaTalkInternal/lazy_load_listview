import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_listview/models/list_item.dart';

class LargeImageListItemWidget extends StatelessWidget {
  final Function? onListItemTap;
  final int listItemIndex;
  final ListItem listItem;
  final IconData? fourthRowPrefixIcon;
  final Color loadingIndicatorColor;

  const LargeImageListItemWidget({
    Key? key,
    required this.onListItemTap,
    required this.listItemIndex,
    required this.listItem,
    this.fourthRowPrefixIcon,
    required this.loadingIndicatorColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onListItemTap != null) {
          onListItemTap!(listItemIndex);
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: 15.0,
          left: 0.0,
        ),
        height: 220,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 3,
              child: LargeImageListRowThumbnailImageWidget(
                listItem: listItem,
                loadingIndicatorColor: loadingIndicatorColor,
              ),
            ),
            Flexible(
              flex: 4,
              child: LargeImageListRowDetailsWidget(
                listItem: listItem,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Row Description Widget
class LargeImageListRowDetailsWidget extends StatelessWidget {
  final ListItem listItem;
  final IconData? fourthRowPrefixIcon;

  static final BoxShadow _cardShadow = BoxShadow(
    offset: Offset(2, 2),
    color: Colors.grey[300] ?? Colors.grey,
    blurRadius: 7.0,
    spreadRadius: 3.0,
  );

  const LargeImageListRowDetailsWidget({
    Key? key,
    required this.listItem,
    this.fourthRowPrefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 3.0,
        top: 20.0,
        bottom: 20.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
        boxShadow: [_cardShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            listItem.firstRowText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.w900,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            listItem.secondRowText,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            listItem.thirdRowText,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (fourthRowPrefixIcon != null)
                Icon(
                  fourthRowPrefixIcon!,
                  color: Colors.grey[600],
                  size: 17.0,
                ),
              Flexible(
                child: Text(
                  listItem.forthRowText,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

//Image widget
class LargeImageListRowThumbnailImageWidget extends StatelessWidget {
  final ListItem listItem;
  final Color loadingIndicatorColor;

  const LargeImageListRowThumbnailImageWidget({
    Key? key,
    required this.listItem,
    required this.loadingIndicatorColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: listItem.listItemId,
      child: Container(
        height: 220,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        child: listItem.isLocalImage
            ? Image.asset(
                listItem.imagePath,
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                imageUrl: listItem.imagePath,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return Center(
                    child: SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                        loadingIndicatorColor,
                      )),
                    ),
                  );
                },
              ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
