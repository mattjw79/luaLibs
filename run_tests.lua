#!/usr/bin/env lua

local lu = require 'luaunit'
require 'lfs'

local dirname = lfs.currentdir() .. '/tests'
for f in lfs.dir(dirname) do
  local path = table.concat({dirname, f}, '/')
  if lfs.attributes(path, 'mode') == 'file' then
    if f:sub(1, 4) == 'test' and f:sub(-4) == '.lua' then
      print(path)
      require('tests.' .. f:sub(1, -5))
    end
  end
end

lu.LuaUnit.verbosity = 2
os.exit( lu.LuaUnit.run() )
