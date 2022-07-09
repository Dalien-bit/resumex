import 'package:resumex/database/database.dart';

import '../functions/function.dart';
import '../models/resume_model.dart';

class GetData extends Database {
  String getResumeId() {
    dprint('Fetching resume Id');
    String id = '';
    userDoc.get().then((value) {
      id = value.data()!['currentresumeid'];
    });
    return id;
  }

  Contact getContact() {
    dprint('Fetching Contact');
    Contact contact = Contact(
        name: '',
        email: '',
        phoneNumber: '',
        city: '',
        province: '',
        country: '');
    detailsCol.doc('contact').get().then((value) {
      contact = Contact.fromMap(value.data() ?? {});
    });
    dprint('Fetched Contacts successfully');
    return contact;
  }

  List<WorkExperience> getExperience() {
    dprint('Fetching Experiences');
    List<WorkExperience> experience = [];
    detailsCol
        .doc('workexperience')
        .collection('workexperience')
        .get()
        .then((value) {
          for (var element in value.docs) {
            experience.add(WorkExperience.fromMap(element.data()));
          }
        })
        .onError((error, stackTrace) => dprint(error))
        .then((_) => dprint('Fetched Experiences Successfuly'));
    return experience;
  }

  List<Project> getProjects() {
    dprint('Fetching projects');
    List<Project> projects = [];
    detailsCol
        .doc('projects')
        .collection('projects')
        .get()
        .then((value) {
          for (var element in value.docs) {
            projects.add(Project.fromMap(element.data()));
          }
        })
        .onError((error, stackTrace) => dprint(error))
        .then((_) => dprint('Success'));
    return projects;
  }

  List<Education> getEducations() {
    dprint("Trying to get education");
    List<Education> educations = [];
    detailsCol
        .doc('educations')
        .collection('educations')
        .get()
        .then((value) {
          for (var element in value.docs) {
            educations.add(Education.fromMap(element.data()));
          }
        })
        .onError((error, stackTrace) => dprint(error))
        .then((_) => dprint('Success'));
    return educations;
  }

  List<OnlineProfile> getProfiles() {
    dprint("Trying to get profiles");
    List<OnlineProfile> profiles = [];
    detailsCol
        .doc('onlineprofiles')
        .collection('onlineprofiles')
        .get()
        .then((value) {
          for (var element in value.docs) {
            profiles.add(OnlineProfile.fromMap(element.data()));
          }
        })
        .onError((error, stackTrace) => dprint(error))
        .then((_) => dprint('Success'));
    return profiles;
  }

  List<Skill> getSkills() {
    dprint("Trying to get skills");
    List<Skill> skills = [];
    detailsCol
        .doc('skills')
        .collection('skills')
        .get()
        .then((value) {
          for (var element in value.docs) {
            skills.add(Skill.fromMap(element.data()));
          }
        })
        .onError((error, stackTrace) => dprint(error))
        .then((_) => dprint('Success'));
    return skills;
  }

  List<Achievement> getAchievement() {
    dprint("Trying to get avhievements");
    List<Achievement> achievements = [];
    detailsCol
        .doc('achievements')
        .collection('achievements')
        .get()
        .then((value) {
          for (var element in value.docs) {
            achievements.add(Achievement.fromMap(element.data()));
          }
        })
        .onError((error, stackTrace) => dprint(error))
        .then((_) => dprint('Successfully fetched achievements'));
    return achievements;
  }

  List<Activity> getActivity() {
    dprint("Trying to get activities");
    List<Activity> activities = [];
    detailsCol
        .doc('activities')
        .collection('activities')
        .get()
        .then((value) {
          for (var element in value.docs) {
            activities.add(Activity.fromMap(element.data()));
          }
        })
        .onError((error, stackTrace) => dprint(error))
        .then((_) => dprint('Success'));
    return activities;
  }
}
