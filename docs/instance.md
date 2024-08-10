It's needed to load and get text. Every instance can only use 1 language. If you need to use more languages, use more instances.

# Methods

## get_language
Returns current language, `nil` if no specified
### Params:
0. self: lualoca.instance
### Returns:
1. string | nil - current language

## get_params
Returns the instance language parameters. `nil` if no language is specified
### Params:
0. self: lualoca.instance
### Returns:
1. { \[string]: any } | nil

## get_text
Enters `object.values` into the text with `object.path` and returns it
### Params:
0. self: lualoca.instance
1. object: [lualoca.object](https://github.com/Mantyi-Studio/lualoca/blob/main/docs/main.md#lualocaobject) | { \[integer]: string }
### Return:
1. string - text

## set_language
Loads the game text in `lang`. Returns the `lang` parameters (pivot, font, etc.)
### Params:
0. self: lualoca.instance
1. lang: string
### Returns:
1. { \[string]: any }
