import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:job_sathi/models/response/jobs/get_job.dart';
import 'package:job_sathi/models/response/jobs/jobs_response.dart';
import 'package:job_sathi/services/config.dart';

// FIX: ADDED TRY CATCHES EVERYWHERE
class JobsHelper {
  static var client = http.Client();

  static Future<List<JobsResponse>> getJobs() async {
    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      var url = Uri.http(Config.apiUrl, Config.jobs);
      var response = await client.get(
        url,
        headers: requestHeaders,
      );


      if (response.statusCode == 200) {
        var jobsList = jobsResponseFromJson(response.body);
        return jobsList;
      } else {
        throw Exception("Failed to get the jobs");
      }
    } catch (e, s) {
      debugPrint('Error Occurred: -------------- $e ---------------');
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

// get job
  static Future<GetJobRes> getJob(String jobId) async {
    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      var url = Uri.http(Config.apiUrl, "${Config.jobs}/$jobId");
      var response = await client.get(
        url,
        headers: requestHeaders,
      );

      if (response.statusCode == 200) {
        var job = getJobResFromJson(response.body);
        return job;
      } else {
        throw Exception("Failed to get a job");
      }
    } catch (e, s) {
      debugPrint('Error Occurred: -------------- $e ---------------');
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  static Future<JobsResponse> getRecent() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, Config.jobs);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var jobsList = jobsResponseFromJson(response.body);

      var recent = jobsList.first;
      return recent;
    } else {
      throw Exception("Failed to get the jobs");
    }
  }

//SEARCH
  static Future<List<JobsResponse>> searchJobs(String searchQeury) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, "${Config.search}/$searchQeury");
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var jobsList = jobsResponseFromJson(response.body);
      return jobsList;
    } else {
      throw Exception("Failed to get the jobs");
    }
  }
}
