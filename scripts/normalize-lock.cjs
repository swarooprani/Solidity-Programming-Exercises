// Ganache's shrinkwrap can leak extraneous development-only packages into
// the consumer lockfile, including a non-optional macOS-only watcher.
// Keep the actual dependency graph and bundled runtime entries intact.
const fs = require('node:fs');
const path = require('node:path');
const file = path.join(__dirname, '..', 'package-lock.json');
const lock = JSON.parse(fs.readFileSync(file, 'utf8'));
let removed = 0;
for (const [name, entry] of Object.entries(lock.packages)) {
  if (name.startsWith('node_modules/ganache/node_modules/') && entry.extraneous) {
    delete lock.packages[name]; removed++;
  }
}
fs.writeFileSync(file, JSON.stringify(lock, null, 2) + '\n');
console.log(`Pruned ${removed} extraneous Ganache development metadata entries.`);
