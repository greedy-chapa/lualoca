# Params file
This is a json file intended to set params of every language (font, type (left/right...):
```json
{
	"en": {
		"name": "English"
		"font": "european",
		"pivot": "left"
	}
}
```
If you try to set a language that has no params, you'll get an error. So if you don't want set any params, you can just write `true`:
```json
{
	"en": true
}
```

# Localization files (UNFINISHED)
This is a json file for localization text.
## Normal text
You can write unnested text:
```json
{
	"hi": "How are you?"
}
```
... nested text:
```json
{
	"moods": {
		"good": "I'm good"
	}
}
```
... and multi-nested text:
```json
{
	"topics": {
		"neutral": {
			"music": {
				"track": "What is your favorite track?"
			}
		}
	}
}
```
To write a multi-line text, you can use lists:
```json
{
	"wow": [
		"You can",
		"create",
		"multi-line text",
		"without using /n"
	]
}
```
... it can also be nested and multi-nested:
```json
{
	"tracks": {
		"on&on": [
			"Hold me close 'til i get up",
			"Time is barely on our side",
			"I don't wanna waste what's left",
			"The storms we chase are leadin' us",
			"And love is all we'll ever trust, yeah",
			"No, i don't wanna waste what's left"
			"..."
		]
	}
}
```
To get text without params use
```lua
text = instance:get_text({"group1", "group2", ..., "text"})
```

## Params (entries)
To add a param to text, you should use #<param's name>:
```json
"age": "#name: #age"
```
It's convient to name params by single letters:
```json
"date": "Date: #y/#m/#d"
```
To write "#" (hash) use ##:
```json
"hashtag": "##lualoca"
```
To get a text with params use
```lua
text = instance:get_text({path = {"path", "to", "text"}, values = {<param_name> = <value>...}})
```
If you write # without a name, param will be saved with an empty name. It's convenient, if the text contains only 1 param:
```json
"artist": "Favorite artist: #"
```
So i added one more convenient thing:
`values = value` is the same as `values = {[""] = value}`
It means instead of this:
```lua
text = instance:get_text({path = {..., "artist"}, values = {[""] = "Brooks"}})
```
... you can use this:
```lua
text = instance:get_text({path = {..., "artist"}, values = "Brooks"})
```
I hope my explanation was clear\
Good luck :-)
