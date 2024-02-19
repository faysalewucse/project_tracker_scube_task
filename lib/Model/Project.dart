class Project {
  final int id;
  final String startDate;
  final String endDate;
  final int startDayOfYear;
  final int endDayOfYear;
  final String projectName;
  final String projectUpdate;
  final String assignedEngineer;
  final String assignedTechnician;
  final int duration;

  Project({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.startDayOfYear,
    required this.endDayOfYear,
    required this.projectName,
    required this.projectUpdate,
    required this.assignedEngineer,
    required this.assignedTechnician,
    required this.duration,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    id: json['id'],
    startDate: json['start_date'],
    endDate: json['end_date'],
    startDayOfYear: json['start_day_of_year'],
    endDayOfYear: json['end_day_of_year'],
    projectName: json['project_name'],
    projectUpdate: json['project_update'],
    assignedEngineer: json['assigned_engineer'],
    assignedTechnician: json['assigned_technician'],
    duration: json['duration'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'start_date': startDate,
    'end_date': endDate,
    'start_day_of_year': startDayOfYear,
    'end_day_of_year': endDayOfYear,
    'project_name': projectName,
    'project_update': projectUpdate,
    'assigned_engineer': assignedEngineer,
    'assigned_technician': assignedTechnician,
    'duration': duration,
  };
}
