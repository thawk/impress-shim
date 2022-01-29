#!/usr/bin/env node

const path = require('path');
const glob = require('glob');
const fs = require('fs');
const inlineSource = require('inline-source');

var presentations = glob.sync('*/index.html');
var htmlPlugins = [];
var outPath = path.resolve('dist');

if (!fs.existsSync(outPath)){
  fs.mkdirSync(outPath);
}

for (var i in presentations) {
  var name = path.basename(path.dirname(presentations[i]));

  inline(presentations[i], path.join(outPath, name + '.html'));
}

async function inline(source, out) {
  try {
    const html = await inlineSource.inlineSource(
      source, {
        rootpath: path.dirname(source),
        compress: false,
        attribute: false
      });
    fs.writeFile(out, html, (err) => {
      if (err) {
        process.stderr.write(`Error: ${err}\n`);
        return process.exit(1);
      }

      // process.stderr.write(`Written to ${out}\n`);
      // process.exit(0);
    });
  } catch (err) {
    process.stderr.write(`Error: ${err}\n`);
    // return process.exit(1);
  }
}
