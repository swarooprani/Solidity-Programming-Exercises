const fs = require('node:fs');
const path = require('node:path');
const root = path.resolve(__dirname, '..');
let checked = 0;
const broken = [];
function walk(dir) {
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    if (['node_modules', 'build', '.git', 'legacy'].includes(entry.name)) continue;
    const file = path.join(dir, entry.name);
    if (entry.isDirectory()) walk(file);
    else if (file.endsWith('.md')) {
      const content = fs.readFileSync(file, 'utf8');
      for (const match of content.matchAll(/\[[^\]]*\]\(([^)]+)\)/g)) {
        const target = match[1].split('#')[0];
        if (!target || /^(?:https?:|mailto:)/.test(target)) continue;
        checked++;
        if (!fs.existsSync(path.resolve(path.dirname(file), decodeURIComponent(target)))) {
          broken.push(`${path.relative(root, file)} -> ${target}`);
        }
      }
    }
  }
}
walk(root);
if (broken.length) { console.error(broken.join('\n')); process.exitCode = 1; }
console.log(`Checked ${checked} local Markdown file links; ${broken.length} broken.`);
