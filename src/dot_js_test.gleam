import dot_env as dot
import dot_env/env
import gleam/io
import gleam/result

fn should_equal(a: a, b: a) {
  case a == b {
    True -> io.println("✅ passed")
    False -> io.println("❌ failed")
  }
}

fn should_be_error(a: Result(a, b)) {
  case a {
    Ok(_) -> io.println("❌ failed")
    Error(_) -> io.println("✅ passed")
  }
}

pub fn main() {
  dot.new()
  |> dot.set_path(".env.example")
  |> dot.set_capitalize(True)
  |> dot.set_debug(False)
  |> dot.set_ignore_missing_file(False)
  |> dot.load

  // or dot_env.load_with_opts(dot_env.Opts(path: "path/to/.env", debug: False, capitalize: False))
  // or `dot_env.load_default()` to load the `.env` file in the root path

  env.get("MY_ENV_VAR") |> should_be_error()

  env.get("APP_NAME") |> result.unwrap("") |> should_equal("app")

  env.get_or("APP_NAME_DEV", "my app name") |> should_equal("my app name")

  env.get_int("PORT") |> result.unwrap(3000) |> should_equal(9000)

  env.get_int_or("PORT", 3000) |> should_equal(9000)

  env.get_bool("APP_DEBUG") |> result.unwrap(False) |> should_equal(True)

  env.get_bool_or("ENABLE_SIGNUP", False) |> should_equal(False)

  Nil
}
