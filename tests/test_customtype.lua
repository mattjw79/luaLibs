local lu = require 'luaunit'

require 'lib.customtype'
ipv4Address = require 'lib.ipv4address'

test_custom_type = {}

function test_custom_type:test_string()
  local str = 'one'
  lu.assertEquals(type(str), 'string')
end

function test_custom_type:test_number()
  local num = 1
  lu.assertEquals(type(num), 'number')
end

function test_custom_type:test_table()
  local tbl = { 1, 2, 3 }
  lu.assertEquals(type(tbl), 'table')
end

function test_custom_type:test_ipv4_address()
  local ip = ipv4Address:new('10.1.1.1/24')
  lu.assertEquals(type(ip), 'ipv4address')
end
