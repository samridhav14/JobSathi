import 'package:flutter/foundation.dart';
import 'package:job_sathi/models/response/jobs/get_job.dart';
import 'package:job_sathi/models/response/jobs/jobs_response.dart';
import 'package:job_sathi/services/helpers/jobs_helper.dart';


class JobsNotifier extends ChangeNotifier {
   late Future<List<JobsResponse>> jobList;
  late Future<JobsResponse> recent;
  late Future<GetJobRes> job;

  getJobs() {
    jobList = JobsHelper.getJobs();
  }

    getRecent() {
    recent = JobsHelper.getRecent();
  }

  getJob(String jobId) {
    job = JobsHelper.getJob(jobId);
  }
}
