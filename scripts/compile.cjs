const fs = require('node:fs');
const path = require('node:path');
const solc = require('solc');
const root = path.resolve(__dirname, '..');

function walk(dir) {
  return fs.readdirSync(dir, { withFileTypes: true }).flatMap(entry => {
    if (['node_modules', 'build', '.git'].includes(entry.name)) return [];
    const p = path.join(dir, entry.name);
    return entry.isDirectory() ? walk(p) : p.endsWith('.sol') ? [p] : [];
  });
}
function compile() {
  const sources = Object.fromEntries(walk(root).map(file => [
    path.relative(root, file).replaceAll('\\', '/'), { content: fs.readFileSync(file, 'utf8') }
  ]));
  const input = {
    language: 'Solidity', sources,
    settings: {
      optimizer: { enabled: true, runs: 200 },
      evmVersion: 'shanghai',
      outputSelection: { '*': { '*': ['abi', 'evm.bytecode.object'] } }
    }
  };
  const output = JSON.parse(solc.compile(JSON.stringify(input)));
  for (const message of output.errors || []) console.error(message.formattedMessage);
  if ((output.errors || []).some(e => e.severity === 'error')) throw new Error('Compilation failed');
  fs.mkdirSync(path.join(root, 'build'), { recursive: true });
  fs.writeFileSync(path.join(root, 'build', 'contracts.json'), JSON.stringify(output.contracts, null, 2));
  const summary = {
    compiler: solc.version(), evmVersion: 'shanghai', optimizerRuns: 200,
    sourceFiles: Object.keys(sources).length,
    contractDefinitions: Object.values(output.contracts).reduce((n, c) => n + Object.keys(c).length, 0),
    warnings: (output.errors || []).filter(e => e.severity === 'warning').length
  };
  fs.writeFileSync(path.join(root, 'build', 'compile-summary.json'), JSON.stringify(summary, null, 2));
  console.log(JSON.stringify(summary));
  return output.contracts;
}
module.exports = { compile };
if (require.main === module) compile();
