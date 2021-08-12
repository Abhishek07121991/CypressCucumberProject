import 'jest-preset-angular/setup-jest';
import failOnConsole from 'jest-fail-on-console';

failOnConsole();

// Fixing this bug: https://stackoverflow.com/questions/51752862/angular-unit-tests-are-leaking-styles
// Big test like con-item-info.component.spec.ts  which use testbed where showing non linear execution times due to this bug.
// the last test in the spec took 10 times longer than the first
// with this the execution time of the first test is the same as the last test.
afterEach(() => {
  window.document.querySelectorAll('style').forEach((style) => style.remove());
});

// import { toHaveNoViolations } from 'jest-axe';

// expect.extend(toHaveNoViolations);
