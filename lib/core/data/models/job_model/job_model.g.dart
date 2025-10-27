// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModel _$JobModelFromJson(Map<String, dynamic> json) => JobModel(
      id: json['id'] == null ? null : json['id'].toString().trim(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      title: json['title'] as String,
      company: json['company'] as String,
      location: json['location'] as String?,
      jobMode: $enumDecode(_$JobModeEnumMap, json['job_mode']),
      jobType: $enumDecode(_$JobTypeEnumMap, json['job_type']),
      postLink: json['post_link'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      notes: json['notes'] as String?,
      tags: json['tags'] as String?,
      cvUrl: json['cv_url'] as String?,
      applicationStatus: $enumDecodeNullable(
              _$ApplicationStatusEnumMap, json['application_status']) ??
          ApplicationStatus.pending,
    );

Map<String, dynamic> _$JobModelToJson(JobModel instance) => <String, dynamic>{
      'created_at': instance.createdAt?.toIso8601String(),
      'title': instance.title,
      'company': instance.company,
      'location': instance.location,
      'job_mode': _$JobModeEnumMap[instance.jobMode]!,
      'job_type': _$JobTypeEnumMap[instance.jobType]!,
      'post_link': instance.postLink,
      'date': instance.date?.toIso8601String(),
      'notes': instance.notes,
      'tags': instance.tags,
      'cv_url': instance.cvUrl,
      'application_status':
          _$ApplicationStatusEnumMap[instance.applicationStatus]!,
    };

const _$JobModeEnumMap = {
  JobMode.hybrid: 'hybrid',
  JobMode.remote: 'remote',
  JobMode.onSite: 'onSite',
};

const _$JobTypeEnumMap = {
  JobType.fullTime: 'fullTime',
  JobType.partTime: 'partTime',
  JobType.freelance: 'freelance',
  JobType.intern: 'intern',
};

const _$ApplicationStatusEnumMap = {
  ApplicationStatus.pending: 'pending',
  ApplicationStatus.accepted: 'accepted',
  ApplicationStatus.rejected: 'rejected',
};
