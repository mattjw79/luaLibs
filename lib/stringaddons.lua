--[[
Additions to the string class
--]]

function escapeMagicCharacters(str)
  local magicCharacters = { '%', '(', ')', '.', '-', '*', '?', '[', '^', '$' }

  -- find all the magic characters we need to replace
  local found_mc = {}
  for _, mc in pairs(magicCharacters) do
    local search = '%' .. mc
    if str:find(search) then
      -- replace the magic character with an escaped character
      local replace = '%%' .. mc
      if mc == '%' then
        replace = '%' .. replace
      end
      str = str:gsub(search, replace)
    end
  end
  return str
end

function string:split(delim)
  if type(delim) ~= 'string' then
    error('Delimiter must be a string')
  end

  -- store the original length in case it's a magic character
  local delimLen = delim:len()

  delim = escapeMagicCharacters(delim)

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

function string:rstrip()
  return self:gsub('%s*$', '')
end

function string:lstrip()
  return self:gsub('^%s*', '')
end

function string:strip()
  local str = self:rstrip()
  return str:lstrip()
end

function string:startswith(str)
  str = escapeMagicCharacters(str)
  if self:match('^' .. str) then
    return true
  end
  return false
end

function string:endswith(str)
  str = escapeMagicCharacters(str)
  if self:match(str .. '$') then
    return true
  end
  return false
end

function string:contains(str)
  str = escapeMagicCharacters(str)
  if self:match(str) then
    return true
  end
  return false
end
