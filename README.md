# Building

You need to have the [`dotenv`](https://github.com/aosasona/dotenv) package cloned locally and point your `gleam.toml` definition to the location. Run the following command to build the code:

```sh
gleam build
```

# Running tests

Run the following commands to test the code in each supported runtime:

### Node

```sh
node ./build/dev/javascript/dot_js_test/gleam.main.mjs
```

### Bun

```sh
bun ./build/dev/javascript/dot_js_test/gleam.main.mjs
```

### Deno

```sh
deno run --allow-read --allow-env ./build/dev/javascript/dot_js_test/gleam.main.mjs
```
