import 'package:dating_list/constants/app_colors.dart';
import 'package:dating_list/constants/asset_paths.dart';
import 'package:dating_list/module/dating_list/model/dating_list_response.dart';
import 'package:dating_list/ui/widgets/icon_text_widget.dart';
import 'package:dating_list/ui/widgets/picture_widget.dart';
import 'package:dating_list/utils/extension/extended_context.dart';
import 'package:flutter/material.dart';

import '../../utils/helper_class.dart';

class DatingListItemWidget extends StatelessWidget {
  final Result result;

  const DatingListItemWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: AppColors.grey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconTextWidget(
                icon: Icons.calendar_month,
                text: result.nat,
                iconColor: AppColors.primaryBlue,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
            ],
          ),
          Divider(
            height: 1,
            color: AppColors.lightGrey,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              PictureWidget(
                  imageUrl: result.picture.medium,
                  errorPath: AssetPaths.imageNotFoundPlaceHolder),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${result.name.title} ${result.name.first} ",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        context.textTheme.headlineSmall!.copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "${result.location.country},${result.location.city}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.chat_rounded,
                  size: 18,
                  color: AppColors.primaryBlue,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.call_rounded,
                  size: 18,
                  color: AppColors.primaryBlue,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconTextWidget(
                      icon: Icons.calendar_today,
                      text: "Date",
                      iconSize: 14,
                      fontSize: 12,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${formatDate("${result.dob.date}")}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "08:00 PM",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconTextWidget(
                      icon: Icons.location_on,
                      text: "Location",
                      iconSize: 14,
                      fontSize: 12,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${result.location.country},${result.location.city},${result.location.street}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
