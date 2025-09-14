import 'package:hirely/core/helper/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_model.g.dart';

@JsonSerializable()
class JobModel {
  final int? id;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  final String title;
  final String company;
  final String? location;

  @JsonKey(name: 'job_mode')
  final JobMode jobMode;

  @JsonKey(name: 'job_type')
  final JobType jobType;

  @JsonKey(name: 'post_link')
  final String? postLink;

  final DateTime? date;
  final String? notes;
  final String? tags;

  @JsonKey(name: 'cv_url')
  final String? cvUrl;

  @JsonKey(name: 'application_status')
  final ApplicationStatus applicationStatus;

  JobModel({
    this.id,
    this.createdAt,
    required this.title,
    required this.company,
    this.location,
    required this.jobMode,
    required this.jobType,
    this.postLink,
    this.date,
    this.notes,
    this.tags,
    this.cvUrl,
    this.applicationStatus = ApplicationStatus.pending,
  });

  /// fromJson
  factory JobModel.fromJson(Map<String, dynamic> json) => _$JobModelFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$JobModelToJson(this);
}

