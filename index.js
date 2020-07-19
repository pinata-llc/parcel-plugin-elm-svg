const chokidar = require("chokidar");
const glob = require("glob");
const fs = require("fs");
const path = require("path");
const { generateModule } = require("svg2elm");

function setup(config, watch) {
  const modules = config.elmSvgModules;

  if (!modules || !modules.length) return;

  modules.forEach(async ({ name, src, dest }) => {
    try {
      await fs.promises.stat(dest);
    } catch (err) {
        if (err.code === 'ENOENT') {
          await fs.promises.mkdir(path.dirname(dest), { recursive: true })
        } else {
          throw err;
        }
    }

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

    if (watch) {
      chokidar.watch(src, { ignoreInitial: true }).on("all", generate);
    }

    generate();
  });
}

function resolveConfigPath(directory) {
  const packageJson = path.resolve(directory, "package.json");

  if (fs.existsSync(packageJson)) {
    return packageJson;
  }

  const parentDir = path.dirname(directory);

  if (parentDir === directory) {
    // System root
    return error("Couldn't not find your package.json file");
  }

  return resolveConfigPath(path.dirname(directory));
}

module.exports = async function(bundler) {
  try {
    const pkgFile = resolveConfigPath(bundler.options.rootDir);
    const pkg = await fs.promises.readFile(pkgFile);

    setup(JSON.parse(pkg), bundler.options.watch);
  } catch (err) {
    error("Failed to get your configuration", err);
  }
};

function error(message, error) {
  console.error(`[ERROR] parcel-plugin-svg-elm: ${message}`);
  throw error;
}
