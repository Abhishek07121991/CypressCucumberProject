# TSD UI Component

## Layers

## Patterns

## Component Libraries

TODO which layers, structures, patterns
TODO make sure there is a different theme "color" per environment

# Configuration

Make sure you set the artifactory as registry
you can do by adding an .npmrc file with the following content

```
registry=http://artifact.finbel.intra:8081/artifactory/api/npm/npm-repo/
```

# Environment variable support

Environment variable support was added, a configservice was created which will try to load the asset/config.json. and default to the environment.ts files.
In a docker container the docker/config.json will be populated with the available environment variables.
in order to add a configuration property make sure to update the following files:

- docker/config.json
- environment.prod.ts
- environment.ts ( will be used for local development)
- values in helm chart and or /env directory

# Start application

## in demo mode (using fake backend interceptor)

```
$ ng serve
```

## using locally running tsd service on port 8888

```
$ npm run start:local
```

## using tsd server from test environment

```
$ npm run start:test
```

TODO:

- [ ] do we need to perform code obfuscation? https://jscrambler.com ?
- [ ] Add build version to application
- [ ] Why is there a dependency on Jquery, is it not possible in 2019 to do without it?
- [ ] Fix caching of json resources ( language files, config.json)
  - [ ] implement one of the following strategies https://netbasal.com/strategies-for-cache-busting-translation-files-in-angular-86143ee14c3c
  - [ ] change nginx.conf caching of json after this is done
- [ ] Remove hard-coded passwords and enable quality gate in build, sonar detects them and fails the quality gate

# TSDUi

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 8.3.14.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via Cypress

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).

npm install @ngx-translate/core @ngx-translate/http-loader rxjs --save

npm install ngx-translate-messageformat-compiler messageformat@2.0.2 --save

https://compodoc.app/guides/installation.html
