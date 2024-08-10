---@type lualoca
local lualoca=loadfile('C:/Users/udiga/OneDrive/lua projects/modules/mine/lualoca/lualoca_4.0/lualoca_4.0.lua')()
---local lualoca=require('path/to/this/module')
---@type funlutab https://github.com/Mantyi-Studio/funlutab
local funlutab=loadfile('C:/Users/udiga/OneDrive/lua projects/modules/mine/funlutab/funlutab_2.1.1.lua')()
---local funlutab=require('path/to/funlutab.lua')
---@type table https://github.com/rxi/json.lua
local json=loadfile('C:/Users/udiga/OneDrive/lua projects/modules/not mine/json.lua')()
---local json=require('path/to/json.lua')

---Creating instance
local instance=lualoca.Instance(funlutab, json, 'C:/Users/udiga/OneDrive/lua projects/modules/mine/lualoca/lualoca_4.0/example/text/', 'C:/Users/udiga/OneDrive/lua projects/modules/mine/lualoca/lualoca_4.0/example/text/params.json')
---local instance=lualoca.Instance(funlutab, json, '.../text/', '.../text/params.json')
---Before using you have to set language
instance:set_language('en')
---To get a text with no parameters (or if you want them all to be nil) you mustn't set the `values` field
io.write(instance:get_text({path={'commands', 'language'}}))
instance:set_language(io.read())
---If the lualoca object only contains a path field, you can just specify only that ({'path', '...'})
io.write(instance:get_text({'name'}))
local name=io.read()
---If the text contains only 1 parameter you can name it '' (empty) and use values=value
print(instance:get_text({path={'hi'}, values=name}))
print(instance:get_text({'commands', 'list'}))

while true do
	io.write(instance:get_text({'command'}))
	local command=io.read()
	if command=='exit' then
		print(instance:get_text({path={'bye'}, values=name}))
		break
	elseif command=='date' then
		print(instance:get_text({path={'commands', 'date'}, values=os.date()}))
	elseif command=='tag' then
		print(instance:get_text({'commands', 'tag'}))
	elseif command=='song' then
		print(instance:get_text({'commands', 'song'}))
	elseif command=='price' then
		io.write(instance:get_text({'commands', 'price', 'product'}))
		local product=io.read()
		io.write(instance:get_text({'commands', 'price', 'price'}))
		local price=io.read()
		io.write(instance:get_text({'commands', 'price', 'currency'}))
		local currency=io.read()
		---If the text contains more than 1 parameter (or 1 but not named '') you must use values={param=value...}
		print(instance:get_text({path={'commands', 'price', 'label'}, values={n=product, p=price, c=currency}}))
	elseif command=='language' then
		io.write(instance:get_text({'commands', 'language'}))
		instance:set_language(io.read())
	else
		print(instance:get_text({'unknown'}))
	end
end