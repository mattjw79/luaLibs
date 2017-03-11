--[[
Additions to the string class
--]]

-- the order of the magic characters matters when replacing
-- percent should always be first
local magic_characters = { '%', '(', ')', '.', '-', '*', '?', '[', '^', '$' }

function string:split(delim)
  if type(delim) ~= 'string' then
    error('Delimiter must be a string')
  end

  -- store the original length in case it's a magic character
  local delimLen = delim:len()

  -- find all the magic characters we need to replace
  local found_mc = {}
  for _, mc in pairs(magic_characters) do
    local search = '%' .. mc
    if delim:find(search) then
      -- replace the magic character with an escaped character
      local replace = '%%' .. mc
      if mc == '%' then
        replace = '%' .. replace
      end
      delim = delim:gsub(search, replace)
    end
  end

  local parts = {}
  local start = 1
  local idx = self:find(delim)
  while idx ~= nil do
    if start ~= idx then
      -- add the substring to the table
      table.insert(parts, self:sub(start, idx - 1))
    end
    -- forward to the character just beyond the delimiter string
    start = idx + delimLen
    -- go fish!
    idx = self:find(delim, start)
  end
  -- make sure to add that last match to the table
  table.insert(parts, self:sub(start))

  -- be nice and hand back a table
  return parts
end
