import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:job_sathi/controllers/exports.dart';
import 'package:job_sathi/views/common/app_bar.dart';
import 'package:job_sathi/views/common/custom_outline_btn.dart';
import 'package:job_sathi/views/common/exports.dart';
import 'package:job_sathi/views/common/height_spacer.dart';
import 'package:provider/provider.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key, required this.title, required this.id});

  final String title;
  final String id;

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<JobsNotifier>(
      builder: (context, jobsNotifier, child) {
        jobsNotifier.getJob(widget.id);
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: CustomAppBar(
                  text: widget.title,
                  actions: [
                    Consumer<BookMarkNotifier>(
                      builder: (context, bookMarkNotifier, child) {
                        // bookMarkNotifier.loadJobs();
                        return GestureDetector(
                          onTap: () {
                            // if (bookMarkNotifier.jobs.contains(widget.id)) {
                            //   bookMarkNotifier.deleteBookMark(widget.id);
                            // } else {
                            //   BookmarkReqResModel model =
                            //       BookmarkReqResModel(job: widget.id);
                            //   bookMarkNotifier.addBookMark(model, widget.id);
                            // }
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 12.0),
                            child: Icon(Fontisto.bookmark),
                          ),
                        );
                      },
                    )
                  ],
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(CupertinoIcons.arrow_left),
                  )),
            ),
            body: FutureBuilder(
              future: jobsNotifier.job,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                else if(snapshot.hasError){
                  return Center(child: Text("Error: ${snapshot.error}"));
                }
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Stack(
                    children: [
                      ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          const HeightSpacer(size: 30),
                          Container(
                            width: width,
                            height: hieght * 0.27,
                            color: Color(kLightGrey.value),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
          
                                      NetworkImage(snapshot.data!.imageUrl),
                                ),
                                const HeightSpacer(size: 10),
                                ReusableText(
                                    text: snapshot.data!.company,
                                    style: appstyle(
                                        22, Color(kDark.value), FontWeight.w600)),
                                const HeightSpacer(size: 5),
                                ReusableText(
                                    text: snapshot.data!.title,
                                    style: appstyle(16, Color(kDarkGrey.value),
                                        FontWeight.normal)),
                                const HeightSpacer(size: 15),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 50),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomOutlineBtn(
                                          width: width * 0.26,
                                          hieght: hieght * 0.04,
                                          color2: Color(kLight.value),
                                          text: snapshot.data!.contract,
                                          color: Color(kOrange.value)),
                                      ReusableText(
                                          text: '${snapshot.data!.salary}/${snapshot.data!.period}',
                                          style: appstyle(18, Color(kDark.value),
                                              FontWeight.w600)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const HeightSpacer(size: 20),
                          ReusableText(
                              text: 'Description',
                              style: appstyle(
                                  22, Color(kDark.value), FontWeight.w600)),
                          const HeightSpacer(size: 10),
                          Text(
                            snapshot.data!.description,
                            textAlign: TextAlign.justify,
                            maxLines: 8,
                            style: appstyle(
                                16, Color(kDarkGrey.value), FontWeight.normal),
                          ),
                          const HeightSpacer(size: 20),
                          ReusableText(
                              text: "Requirements",
                              style: appstyle(
                                  22, Color(kDark.value), FontWeight.w600)),
                          const HeightSpacer(size: 10),
                          SizedBox(
                            height: hieght * 0.6,
                            child: ListView.builder(
                                itemCount: snapshot.data!.requirements.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final req = snapshot.data!.requirements[index];
                                  String bullet = "\u2022";
                                  return Text(
                                    "$bullet $req\n",
                                    maxLines: 4,
                                    textAlign: TextAlign.justify,
                                    style: appstyle(16, Color(kDarkGrey.value),
                                        FontWeight.normal),
                                  );
                                }),
                          ),
                          const HeightSpacer(size: 20),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: CustomOutlineBtn(
                              onTap: () {},
                              color2: Color(kOrange.value),
                              width: width,
                              hieght: hieght * 0.06,
                              text: "Apply Now",
                              color: Color(kLight.value)),
                        ),
                      )
                    ],
                  ),
                );
              }
            ));
      },
    );
  }
}
