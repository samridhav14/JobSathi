import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_sathi/controllers/jobs_provider.dart';
import 'package:job_sathi/models/response/jobs/jobs_response.dart';
import 'package:job_sathi/views/common/app_bar.dart';
import 'package:job_sathi/views/common/vertical_tile.dart';
import 'package:provider/provider.dart';

class JobListPage extends StatelessWidget {
  const JobListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var joblist = Provider.of<JobsNotifier>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
            text: "Jobs",
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(CupertinoIcons.arrow_left),
            )),
      ),
      body: FutureBuilder<List<JobsResponse>>(
          future: joblist.jobList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("Error ${snapshot.error}");
            }else if (snapshot.data!.isEmpty) {
              return const  Text("No Jobs to display");
             // return const SearchLoading(text: "No Jobs to display");
            }  else {
              final job = snapshot.data;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ListView.builder(
                    itemCount: job!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final jobs = job[index];
                      return VerticalTileWidget(jobs: jobs,onTap: (){},);
                    }),
              );
            }
          }),
    );
  }
}

class SearchLoading {
  const SearchLoading();
}
