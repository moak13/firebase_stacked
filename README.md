# firebase_stacked
Building an application with Flutter, Stacked and Firebase.

## Project Engineering

This project makes use of the stacked framework as it's source of engineering and principles and was generated using the Stacked CLI. Kindly read about stacked [here](https://stacked.filledstacks.com/)

## Setting up Environment Service
Since the project makes use of firebase as it's core BaaS, I decided to gitignore files that links to my firebase console and leave that all up to you.
- To create yours, simple make use of the flutter fire plugin and you should be up and ready on that end.
- The second is that my `firebase_options.dart` file makes use of things I would like to term as secrets and decided to move them to the approach of dart define. Take a look at `launch.json` file under `.vscode` folder.
- Creating a simple `config.staging.json` file at the root of your project and slotting in the required keys fetched as seen in the `environment_service.dart` file under the `service` folder, should sync all the setup for vscode workspace to load properly.

## GitHub Contribution

To contribute to this project, features are added via PRs. The guideline for PRs are one PR per feature. Features can be a screen, backend integration or a bug fix. When creating a branch that later turns into a PR, kindly make use of this formats in branch formats below.

## Testing Strategy

Stacked makes use of mockito under the hood for testing and a heavy focus on unit testing only. In the test folder, you can see that there and contributions are welcomed in creating test cases for the available files.

## Branch Formats

Below are the formats to use when contributing to this project.

- feat/<branch_name>
- chore/<branch_name>
- refactor/<branch_name>
- fix/<branch_name>

Anything outside this would lead to closing of the PR and redoing it.

