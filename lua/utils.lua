local M = {}

function M.merge(t1, t2)
	for k, v in pairs(t2) do
		if type(v) == "table" then
			if type(t1[k] or false) == "table" then
				M.merge(t1[k] or {}, t2[k] or {})
			else
				t1[k] = v
			end
		else
			t1[k] = v
		end
	end
	return t1
end

function M.insert_item_list_to_table(source_table, list)
	local source_table_copy = source_table or {}
	for _, item in ipairs(list) do
		table.insert(source_table_copy, item)
	end
	return source_table_copy
end

function M.insert_item_from_table_to_table(source_table, source_table2, items)
	local source_table_copy = source_table or {}
	for _, item in ipairs(items) do
		table.insert(source_table_copy, source_table2[item])
	end
	return source_table_copy
end

return M
