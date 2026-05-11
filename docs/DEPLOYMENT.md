# Deployment

CI/CD workflows in `.github/workflows`:

- `flutter_build.yml`: installs dependencies, analyzes, and runs tests.
- `code_analysis.yml`: formatting and static checks.
- `firebase_deploy.yml`: builds web release and deploys Firebase resources on version tags.

Set `FIREBASE_TOKEN` in repository secrets before running deploy workflow.
