import 'package:education_app/app/utils/colors.dart';
import 'package:education_app/app/utils/extension.dart';
import 'package:education_app/app/utils/text_style.dart';
import 'package:education_app/app/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello...",
                      style: AppTextStyle.titleTextStyle.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondaryBlackColor,
                      ),
                    ),
                    const Text(
                      "Hardline Scott",
                      style: AppTextStyle.titleTextStyle,
                    ),
                  ],
                ),
                Card(
                  elevation: 11,
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.09,
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 10,
                        color: AppColors.primaryWhiteColor,
                      ),
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            20.h,
            CustomTextFieldWidget(
                title: "",
                textEditingController: _searchC,
                suffixIcon: Card(
                  margin: const EdgeInsets.only(right: 8),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primaryColor,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.search,
                        color: AppColors.primaryWhiteColor,
                      ),
                    ),
                  ),
                ),
                hintText: "Search Teacher"),
            29.h,
            const Text(
              "Popular Teachers",
              style: AppTextStyle.titleTextStyle,
            ),
            10.h,
            Container(
              // color: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 5),
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Card(
                      surfaceTintColor: AppColors.backgroundColor,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: 115,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            10.h,
                            Text(
                              "Name $index",
                              style: AppTextStyle.titleTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            const Text(
                              "Biology",
                              style: AppTextStyle.commonTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            29.h,
            const Text(
              "Popular Institutions",
              style: AppTextStyle.titleTextStyle,
            ),
            10.h,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 180,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 145,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          8.w,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Title $index",
                                  style: AppTextStyle.titleTextStyle,
                                ),
                                5.h,
                                Row(
                                  children: [
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) => Icon(
                                          Icons.star,
                                          size: 17,
                                          color: Colors.yellow.shade700,
                                        ),
                                      ),
                                    ),
                                    7.w,
                                    const Text(
                                      "4.5 (413)",
                                      style: AppTextStyle.commonTextStyle,
                                    )
                                  ],
                                ),
                                10.h,
                                const Text(
                                  "Bio Science",
                                  style: AppTextStyle.subTitleTextStyle,
                                ),
                                2.h,
                                const Text(
                                  "Studying how CBD awareness and availability as it related to pain management alternatives.",
                                  style: AppTextStyle.commonTextStyle,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
