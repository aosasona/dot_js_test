import dot_env
import dot_env/env
import gleam/io

pub fn main() {
  dot_env.load_with_opts(dot_env.Opts(
    path: ".env",
    debug: False,
    capitalize: True,
  ))
  // or `dot_env.load()` to load it the `.env` file in the root path

  case env.get("PORT") {
    Ok(value) -> io.println(value)
    Error(_) -> panic as "PORT not found"
  }

  case env.get("APP_NAME") {
    Ok(value) -> io.println(value)
    Error(_) -> panic as "APP_NAME not found"
  }

  Nil
}
