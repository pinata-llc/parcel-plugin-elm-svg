const chokidar = require("chokidar");
const glob = require("glob");
const fs = require("fs");
const { generateModule } = require("svg2elm");

async function setup(bundler) {
  // Get config. Inspired by elwin013/parcel-plugin-static-files-copy

  const mainAsset =
    bundler.mainAsset || // parcel < 1.8
    bundler.mainBundle.entryAsset || // parcel >= 1.8 single entry point
    bundler.mainBundle.childBundles.values().next().value.entryAsset; // parcel >= 1.8 multiple entry points

  let pkg;

  if (typeof mainAsset.getPackage === "function") {
    // parcel > 1.8
    pkg = await mainAsset.getPackage();
  } else {
    // parcel <= 1.8
    pkg = mainAsset.package;
  }

  const modules = pkg.elmSvgModules;

  if (!modules || !modules.length) return;

  modules.forEach(({ name, src, dest }) => {
    const generate = () => {
      glob(src, {}, async (err, filePaths) => {
        if (err) {
          return error(`Failed to resolve file path for ${name}`, err);
        }

        try {
          const moduleCode = await generateModule(name, filePaths);

          await fs.promises.writeFile(dest, moduleCode);
        } catch (err) {
          error(`Failed to generate ${name}`, err);
        }
      });
    };

    chokidar.watch(src, { ignoreInitial: true }).on("all", generate);
    generate();
  });
}

module.exports = async function(bundler) {
  bundler.on("bundled", () => {
    setup(bundler);
  });
};

function error(message, error) {
  console.error(`[ERROR] parcel-plugin-svg-elm: ${message}\n\n${error}`);
}
