---@meta

---@class lualoca
local M={}

local SYMBOLS='qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890_'
do
	local table={}
	for i=1, #SYMBOLS do table[SYMBOLS:sub(i, i)]=true end
	---symbols available in entries names
	---@type {[string]: true}
	SYMBOLS=table
end

---table with encoded text strings or another `lualoca.source`
---@class lualoca.source
---@field [string] string|self
---@field [integer] string

---table with decoded text strings or another `lualoca.group`
---@class lualoca.group
---@field [string] string|self
---@field [integer] string

---Module version
M.VERSION='4.0'

---Decodes `source` localization to lualoca.group so you can use it
---@param funlutab funlutab
---@param source lualoca.source
---@return lualoca.group
function M.decode(funlutab, source)
	local decoded={}
	for name, phrase in pairs(source) do
		if phrase[1] then phrase=table.concat(phrase, '\n') end
		local type=type(phrase)
		if type=='table' then decoded[name]=M.decode(funlutab, phrase)
		elseif type=='string' then
			local label=1
			local chunks={{}}
			local entry=false
			local hash=0
			for pos=1, #phrase do
				if hash>0 then hash=hash-1 end
				local symbol=phrase:sub(pos, pos)
				if entry and not SYMBOLS[symbol] then
					entry=false
					if hash<=0 or symbol~='#' then
						funlutab.add(chunks, phrase:sub(label, pos-1), {})
					end
					label=pos
				end
				if symbol=='#' and hash==0 then
					entry=true
					hash=2
					funlutab.add(chunks[#chunks], phrase:sub(label, pos-1))
					label=pos+1
				end
			end
			if entry then funlutab.add(chunks, phrase:sub(label))
			else funlutab.add(chunks[#chunks], phrase:sub(label))
			end
			for i=1, #chunks, 2 do chunks[i]=table.concat(chunks[i]) end
			if #chunks==1 then chunks=chunks[1] end
			decoded[name]=chunks
		end
	end
	return decoded
end

---@class lualoca.object
---@field path string[]
---@field values? {[string]: string|number|boolean|lualoca.object|string[]}|string|number|boolean|lualoca.object|string[]

---@param self lualoca.instance
---@return string|nil
local function get_language(self)
	return self.data.language
end

---Returns the instance language parameters
---@param self lualoca.instance
---@return {[string]: any}|nil
local function get_params(self)
	return self.data.params[self.data.language]
end

---Enters `object.values` into the text with `object.path` and returns it
---@param self lualoca.instance
---@param object lualoca.object|{[integer]: string}
---@return string
local function get_text(self, object)
	local path=object.path or object
	local text=self.data.text
	for _, group in ipairs(path) do
		text=text[group]
		if not text then error('Non-existent path '..table.concat(path, '.'), 2) end
	end
	if type(text)=='table' then
		text=self.data.funlutab.copy(text)
		local values=object.values
		if type(values)~='table' or values.path or values[1] then values={['']=values}
		else values=self.data.funlutab.copy(values)
		end
		for i=2, #text, 2 do
			local value=values[text[i]]
			if type(value)=='table' then value=self:get_text(value) end
			text[i]=tostring(value)
		end
		text=table.concat(text)
	end
	return text
end

---Loads the game text in `lang`. Returns the `lang` parameters (pivot, font, etc.)
---@param self lualoca.instance
---@param lang string
---@return {[string]: any}
local function set_language(self, lang)
	local localization=sys.load_resource(self.data.path..lang..'.json')
	if not localization then error('Non-existent language "'..lang..'"', 2) end
	self.data.language=lang
	self.data.text=M.decode(self.data.funlutab, json.decode(localization))
	return self.data.params[self.data.language]
end

---Returns new lualoca instance
---@param funlutab funlutab
---@param path string path to folder with json files of localizations
---@param path_to_params string path to json file with params for all languages
---@return lualoca.instance
function M.Instance(funlutab, path, path_to_params)
	---@class lualoca.instance
	local self={}
	self.data={}
	self.data.funlutab=funlutab
	---path to folder with json files of localizations
	self.data.path=path
	---params of all languages
	---@type {[string]: any}
	self.data.params=json.decode(sys.load_resource(path_to_params))
	---@type {[string]: lualoca.group}
	self.data.text={}
	---@type string|nil current language
	self.data.language=nil
	self.get_language=get_language
	self.get_params=get_params
	self.get_text=get_text
	self.set_language=set_language
	return self
end

return M
