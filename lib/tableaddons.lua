function table.count(tbl)
  local count = 0

  -- use pairs to loop through ALL items in the table
  for _,i in pairs(tbl) do
    count = count + 1
  end
  return count
end

-- Be EXTREMELY carful of how you use the below table.slice, tables
-- with named elements do not retain their order!
--
-- Lua 5.2.4  Copyright (C) 1994-2015 Lua.org, PUC-Rio
-- > inspect = require 'tests.inspect'
-- > a = { 'one', 'two', 'three' }
-- > b = { 'one', two='two', 'three' }
-- > c = { one='one', two='two', three='three' }
-- > d = { one='one', 'two', three='three' }
-- > print(inspect(a))
-- { "one", "two", "three" }
-- > print(inspect(b))
-- { "one", "three",
--   two = "two"
-- }
-- > print(inspect(c))
-- {
--   one = "one",
--   three = "three",
--   two = "two"
-- }
-- > print(inspect(d))
-- { "two",
--   one = "one",
--   three = "three"
-- }

function table.slice(tbl, first, count)
  -- empty table to add the slice items to
  local sliced = {}

  -- because we can't trust that a #tbl would give us an accurate count
  local t = {}
  local itemCount = 0
  for _, i in pairs(tbl) do
    table.insert(t, i)
    itemCount = itemCount + 1
  end

  if first < 0 then
    -- if we have a negative number for first, we need to count
    -- backwards from the end
    first = itemCount + first + 1
  elseif first == 0 then
    -- zero isn't valid
    first = 1
  end

  if count == nil then
    count = itemCount
  end

  local last = first + count - 1

  -- loop through the items wanted and add them to the table we'll return
  for i=first, math.min(last, itemCount) do
    table.insert(sliced, t[i])
  end

  return sliced
end
