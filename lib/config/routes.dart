import 'package:flutter/material.dart';

import '../screens/auth/login_screen.dart';
import '../screens/auth/profile_setup_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/calendar/calendar_screen.dart';
import '../screens/course/course_create_screen.dart';
import '../screens/course/course_detail_screen.dart';
import '../screens/course/course_list_screen.dart';
import '../screens/deck/deck_create_screen.dart';
import '../screens/deck/deck_detail_screen.dart';
import '../screens/deck/deck_list_screen.dart';
import '../screens/deck/deck_template_screen.dart';
import '../screens/flashcard/flashcard_create_screen.dart';
import '../screens/flashcard/flashcard_list_screen.dart';
import '../screens/flashcard/flashcard_study_screen.dart';
import '../screens/home/dashboard_screen.dart';
import '../screens/notes/note_detail_screen.dart';
import '../screens/notes/note_editor_screen.dart';
import '../screens/notes/note_list_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/sources/source_detail_screen.dart';
import '../screens/sources/source_list_screen.dart';
import '../screens/sources/source_upload_screen.dart';
import '../screens/todo/todo_create_screen.dart';
import '../screens/todo/todo_list_screen.dart';

/// Named routes and route factory.
class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String profileSetup = '/profile-setup';
  static const String dashboard = '/dashboard';
  static const String deckList = '/decks';
  static const String deckDetail = '/decks/detail';
  static const String deckCreate = '/decks/create';
  static const String deckTemplate = '/decks/templates';
  static const String courseList = '/courses';
  static const String courseDetail = '/courses/detail';
  static const String courseCreate = '/courses/create';
  static const String flashcardList = '/flashcards';
  static const String flashcardStudy = '/flashcards/study';
  static const String flashcardCreate = '/flashcards/create';
  static const String noteList = '/notes';
  static const String noteDetail = '/notes/detail';
  static const String noteEditor = '/notes/editor';
  static const String sourceList = '/sources';
  static const String sourceDetail = '/sources/detail';
  static const String sourceUpload = '/sources/upload';
  static const String todoList = '/todos';
  static const String todoCreate = '/todos/create';
  static const String calendar = '/calendar';
  static const String settings = '/settings';

  static final Map<String, WidgetBuilder> routeTable = {
    login: (_) => const LoginScreen(),
    signup: (_) => const SignupScreen(),
    profileSetup: (_) => const ProfileSetupScreen(),
    dashboard: (_) => const DashboardScreen(),
    deckList: (_) => const DeckListScreen(),
    deckDetail: (_) => const DeckDetailScreen(),
    deckCreate: (_) => const DeckCreateScreen(),
    deckTemplate: (_) => const DeckTemplateScreen(),
    courseList: (_) => const CourseListScreen(),
    courseDetail: (_) => const CourseDetailScreen(),
    courseCreate: (_) => const CourseCreateScreen(),
    flashcardList: (_) => const FlashcardListScreen(),
    flashcardStudy: (_) => const FlashcardStudyScreen(),
    flashcardCreate: (_) => const FlashcardCreateScreen(),
    noteList: (_) => const NoteListScreen(),
    noteDetail: (_) => const NoteDetailScreen(),
    noteEditor: (_) => const NoteEditorScreen(),
    sourceList: (_) => const SourceListScreen(),
    sourceDetail: (_) => const SourceDetailScreen(),
    sourceUpload: (_) => const SourceUploadScreen(),
    todoList: (_) => const TodoListScreen(),
    todoCreate: (_) => const TodoCreateScreen(),
    calendar: (_) => const CalendarScreen(),
    settings: (_) => const SettingsScreen(),
  };
}
