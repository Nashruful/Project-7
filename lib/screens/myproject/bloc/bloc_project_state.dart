
import 'package:project_judge/models/project_model.dart';

abstract class ProjectState {}

class ProjectLoading extends ProjectState {}

class ProjectLoaded extends ProjectState {
  final List<Project> projects;

  ProjectLoaded(this.projects);
}

class ProjectError extends ProjectState {
  final String message;


  ProjectError(this.message);
}