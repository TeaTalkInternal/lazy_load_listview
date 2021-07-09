import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_listview/models/list_item.dart';

class RegularListItemWidget extends StatelessWidget {
  final Function? onListItemTap;
  final int listItemIndex;
  final ListItem listItem;
  final IconData? fourthRowPrefixIcon;
  final Color loadingIndicatorColor;

  const RegularListItemWidget({
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
      child: Card(
        margin: EdgeInsets.only(
          top: 15.0,
          left: 5.0,
          right: 5.0,
        ),
        elevation: 7.0,
        shadowColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegularListRowThumbnailImageWidget(
              listItem: listItem,
              loadingIndicatorColor: loadingIndicatorColor,
            ),
            Flexible(
              flex: 4,
              child: RegularListRowDetailsWidget(
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
class RegularListRowDetailsWidget extends StatelessWidget {
  final ListItem listItem;
  final IconData? fourthRowPrefixIcon;

  const RegularListRowDetailsWidget({
    Key? key,
    required this.listItem,
    this.fourthRowPrefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 5.0,
        top: 10.0,
        bottom: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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

//Row Image Widget
class RegularListRowThumbnailImageWidget extends StatelessWidget {
  final ListItem listItem;
  final Color loadingIndicatorColor;

  const RegularListRowThumbnailImageWidget({
    Key? key,
    required this.listItem,
    required this.loadingIndicatorColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: listItem.listItemId,
      child: Container(
        width: 120.0,
        height: 135.0,
        margin: EdgeInsets.all(12.0),
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
