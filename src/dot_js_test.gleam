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

  case env.get("APP_NAME") {
    Ok(value) -> io.println(value)
    Error(_) -> panic as "APP_NAME not found"
  }

  case env.get_bool("APP_DEBUG") {
    Ok(value) ->
      case value {
        True -> io.println("DEBUG is true")
        False -> io.println("DEBUG is false")
      }
    Error(_) -> panic as "DEBUG not found"
  }

  case env.get_int("PORT") {
    Ok(value) -> io.debug(value)
    Error(_) -> panic as "APP_PORT not found"
  }

  Nil
}
