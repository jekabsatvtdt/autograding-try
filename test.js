const fs = require('fs');

const css = fs.readFileSync('style.css', 'utf8');

// Check for the class and properties
test('Has .rectangle with width, height, red background', () => {
  expect(css).toMatch(/\.rectangle/);
  expect(css).toMatch(/width\s*:\s*250px/);
  expect(css).toMatch(/height\s*:\s*100px/);
  expect(css).toMatch(/background(-color)?\s*:\s*red/);
});
