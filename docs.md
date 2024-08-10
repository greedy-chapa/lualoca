# UNFINISHED

# Syntax


# Types

## lualoca.source
Table containing encoded text strings or another `lualoca.source`\
{\
	\[string]: string|self\
	\[integer]: string\
}

## lualoca.group
Table containing decoded text strings or another `lualoca.group`\
{\
	\[string]: string|self\
 	\[integer]: string\
}

# Classes
## Instance


# Functions
## decode
Decodes `source` localization to lualoca.group so you can use it
### Params:
1. funlutab: table - [funlutab module](https://github.com/Mantyi-Studio/funlutab)
2. source: lualoca.source
### Returns:
1. lualoca.group

# Constants
## VERSION
Current module version ("4.0")
