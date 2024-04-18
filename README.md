# firebase_stacked
Building an application with Flutter, Stacked and Firebase.

## Setting up Environment Service
Since the project makes use of firebase as it's core BaaS, I decided to gitignore files that links to my firebase console and leave that all up to you.
- To create yours, simple make use of the flutter fire plugin and you should be up and ready on that end.
- The second is that my `firebase_options.dart` file makes use of things I would like to term as secrets and decided to move them to the approach of dart define. Take a look at `launch.json` file under `.vscode` folder.
- Creating a simple `config.staging.json` file at the root of your project and slotting in the required keys fetched as seen in the `environment_service.dart` file under the `service` folder, should sync all the setup for vscode workspace to load properly.

