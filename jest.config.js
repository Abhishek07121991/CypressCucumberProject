var preset = require('jest-preset-angular/jest-preset');
module.exports = {
  ...preset,
  preset: 'jest-preset-angular',
  setupFilesAfterEnv: ['<rootDir>/setupJest.js'],
  testMatch: ['**/*.spec.ts'],
  globals: {
    ...preset.globals,
    'ts-jest': {
      ...preset.globals['ts-jest'],
      tsconfig: 'src/tsconfig.test.json',
      isolatedModules: true
    }
  },
  testResultsProcessor: 'jest-sonar-reporter',
  coverageDirectory: '<rootDir>/output/coverage/jest',
  transformIgnorePatterns: ['node_modules/'],
  coverageReporters: ['json', 'lcov', 'text', 'clover'],
  reporters: ['default', 'jest-junit'],
  transform: {
    '^.+\\.(ts|html)$': 'ts-jest',
    '^.+\\.js$': 'babel-jest'
  },
  moduleNameMapper: {
    '@/(.*)': '<rootDir>/src/$1',
    '@core/(.*)': '<rootDir>/src/app/core/$1',
    '@material/(.*)': '<rootDir>/src/app/material/$1',
    '@features/(.*)': '<rootDir>/src/app/features/$1',
    '@testing/(.*)': '<rootDir>/src/testing/$1',
    '@shared/(.*)': '<rootDir>/src/app/shared/$1',
    '@environments/(.*)': '<rootDir>/src/environments/$1'
  }
};
