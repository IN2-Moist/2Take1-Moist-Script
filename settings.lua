local rootPath = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
local save_set_ini = rootPath .. "\\scripts\\MoistsLUA_cfg\\loader autoload.ini"
local settings = {}
function settings.read_ini(file, ignore_sections)
	local handle = io.open(file, "rb")
	local data = {}
	if handle then
		handle:close()
		local setup = ""
		for line in io.lines(file) do
			if line:sub(1, 1) ~= "[" then
				local off = line:find("=", 1, true)
				if off ~= nil then
					local key = line:sub(1, off - 1)
					local value = line:sub(off + 1)
					if not data[setup] then
						data[setup] = {}
					end
					if value == "true" then
						data[setup][key] = true
					elseif value == "false" then
						data[setup][key] = false
					else
						local numval = tonumber(value)
						if numval then
							data[setup][key] = numval
						else
							data[setup][key] = value
						end
					end
				end
			elseif not ignore_sections then
				setup = line:sub(2, -2)
			end
		end
		if ignore_sections and data[""] then
			data = data[""]
		end
	end
	return data
end
function settings.write_ini(file, data)
	io.output(io.open(save_set_ini, "w"))
	for setup, section_data in pairs(data) do
		io.write("[" .. setup .. "]\n")
		for key, value in pairs(section_data) do
			if type(value) ~= "function" then
				io.write(key .. "=" .. tostring(value) .. "\n")
			end
		end
	end
	io.close()
end
function settings.setup(section_name, migrate_file)
	if not settings_sections_dont_touch then
		settings_sections_dont_touch = settings.read_ini(save_set_ini)
	end
	if not settings_sections_dont_touch[section_name] then
		settings_sections_dont_touch[section_name] = {}
		if migrate_file then
			settings_sections_dont_touch[section_name] = settings.read_ini(migrate_file, true)
		end
	end
	local default_keys = {
		["setvalue"] = true,
		["default_values"] = true,
		["purge_non_default_keys"] = true,
		["save"] = true,
	}
	settings_sections_dont_touch[section_name].setvalue =
	function(key, value)
		if settings_sections_dont_touch[section_name][key] == nil then
			settings_sections_dont_touch[section_name][key] = value
		end
		if not default_keys[key] then
			default_keys[key] = true
		end
	end
	settings_sections_dont_touch[section_name].default_values =
	function(t)
		for key, value in pairs(t) do
			if settings_sections_dont_touch[section_name][key] == nil then
				settings_sections_dont_touch[section_name][key] = value
			end
			if not default_keys[key] then
				default_keys[key] = true
			end
		end
	end
	settings_sections_dont_touch[section_name].purge_non_default_keys =
	function()
		for key, _ in pairs(settings_sections_dont_touch[section_name]) do
			if not default_keys[key] then
				settings_sections_dont_touch[section_name][key] = nil
			end
		end
	end
	settings_sections_dont_touch[section_name].save =
	function()
		settings.write_ini(save_set_ini, settings_sections_dont_touch)
		if migrate_file then
			os.remove(migrate_file)
		end
	end
	return settings_sections_dont_touch[section_name]
end
return settings
