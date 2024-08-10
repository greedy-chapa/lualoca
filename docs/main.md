# Syntax
Read about it on [syntax.md](https://github.com/Mantyi-Studio/lualoca/blob/main/docs/syntax.md)

# Types

## lualoca.source
Table containing encoded text strings or another `lualoca.source`
```
{
	[string]: string | lualoca.source
	[integer]: string
}
```

## lualoca.group
Table containing decoded text strings or another `lualoca.group`
```
{
	[string]: string | lualoca.group
	[integer]: string
}
```

## lualoca.object
Table containing data needed to get text
```
{
	path: string[]
 	values?: { [string]: string | number | boolean | lualoca.object | string[] } | string | number | boolean | lualoca.object | string[]
}
```

# Classes
## [Instance](https://github.com/Mantyi-Studio/lualoca/blob/main/docs/instance.md)
It's needed to load and get text. Every instance can only use 1 language. If you need to use more languages, use more instances.

# Functions

## decode
Decodes `source` localization to [lualoca.group](https://github.com/Mantyi-Studio/lualoca/blob/main/docs/main.md#lualocagroup) so you can use it
### Params:
1. funlutab: table - [funlutab module](https://github.com/Mantyi-Studio/funlutab)
2. source: [lualoca.source](https://github.com/Mantyi-Studio/lualoca/blob/main/docs/main.md#lualocasource)
### Returns:
1. [lualoca.group](https://github.com/Mantyi-Studio/lualoca/blob/main/docs/main.md#lualocagroup)

## Instance
Creates [lualoca.instance](https://github.com/Mantyi-Studio/lualoca/blob/main/docs/main.md#instance)
### Params:
1. funlutab: [funlutab](https://github.com/Mantyi-Studio/funlutab) - version 2.1.1 - latest 2.x
2. json: table - [json module](https://github.com/rxi/json.lua) version 0.1.2
3. path: string - path to folder with json files of localizations
4. path_to_params: string - path to json file with params for all languages
5. read?: fun(path: string): string|nil - custom read function
### Returns:
1. [lualoca.instance](https://github.com/Mantyi-Studio/lualoca/blob/main/docs/main.md#instance)

# Constants
## VERSION
Current module version ("4.0")
