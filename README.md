# Case Commons TypeScript lint config

Configuration for [TSLint](https://palantir.github.io/tslint/) per Case Commons style guide.

## Usage

Add to dev dependencies in your project:

```
yarn add --dev @casecommons/tslint-config
```

### TypeScript

Be sure to add [TSLint](https://palantir.github.io/tslint/) as a dependency in your project and set it up to run as part of the project’s test suite.

Use [`extends`](https://palantir.github.io/tslint/usage/configuration/) to include the appropriate lints into `tslint.json` in your own project. For example:

```javascript
// tslint.json

{
  "extends": [
    "@casecommons/lint-config/tslint"
  ]
}
```

## Development

Docker should be used for simpler dev setup. To do so:

1. `cp .env.sample .env` and set values in `.env` accordingly.
2. `docker-compose build`
3. Prefix the usual `yarn`, etc., commands with `docker-compose exec app`/`docker-compose run --rm app` or similar.

### Packaging

Run `yarn pack` which will emit a tarball in the package root directory. This is useful for testing the client in another project without having to perform a release (see [package.json local paths](https://docs.npmjs.com/files/package.json#local-paths)).

### Releasing

Run `bin/release`.
