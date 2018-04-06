# Case Commons TypeScript lint config

Configuration for [TSLint](https://palantir.github.io/tslint/) per Case Commons style guide. For JavaScript linting, see [lint-config-javascript](https://github.com/Casecommons/lint-config-javascript).

## Usage

1. Add to dev dependencies in your project:

   ```
   yarn add --dev @casecommons/tslint-config
   ```

2. Add [TSLint](https://palantir.github.io/tslint/) as a dependency in your project and set it up to run as part of the project’s test suite.
3. Use [`extends`](https://palantir.github.io/tslint/usage/configuration/) to include the appropriate lints into `tslint.json` in your own project. For example:

   ```javascript
   // tslint.json

   {
     "extends": [
       "@casecommons/tslint-config/base"
     ]
   }
   ```

4. Pass the `--project` flag to `tslint` to ensure rules which require type information can run. Most likely, you want a script which runs `tslint --project . --format verbose`.

### Customizing rules

Generally, rules should not be disabled in projects globally, with some common exceptions:

- `no-implicit-dependencies` may be disabled for projects which use module name mapping, e.g. TypeScript’s `paths` config option, WebPack’s `resolve.alias` config option, or Jest’s `moduleNameMapper` config option.
- `no-magic-numbers` may be disabled for projects which make heavy use of inline numbers, e.g. for React component grid layout specifications.

## Development

Docker should be used for simpler dev setup. To do so:

1. `cp .env.sample .env` and set values in `.env` accordingly.
2. `docker-compose build`
3. Prefix the usual `yarn`, etc., commands with `docker-compose exec app`/`docker-compose run --rm app` or similar.

### Packaging

Run `yarn pack` which will emit a tarball in the package root directory. This is useful for testing the client in another project without having to perform a release (see [package.json local paths](https://docs.npmjs.com/files/package.json#local-paths)).

### Releasing

Run `bin/release`.
