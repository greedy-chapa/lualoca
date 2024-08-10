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
			...
				"music": {
					"track": "What is your favorite track?"
				}
			...
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
## Params (entries)
To add a param to text, you should use #<param's id>:
```json
...
"artist": "Favorite artist: #"
...
```

