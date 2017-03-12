local lu = require 'luaunit'

local ipv4Address = require 'lib.ipv4Address'

test_ipv4Address = {}

function test_ipv4Address:test_0bit()
  local ip = ipv4Address:new('10.1.250.173/0')
  lu.assertEquals(ip.address, '10.1.250.173')
  lu.assertEquals(ip.maskBits, 0)
  lu.assertEquals(ip:networkAddress(), '0.0.0.0')
end

function test_ipv4Address:test_7bit()
  local ip = ipv4Address:new('10.1.250.173/7')
  lu.assertEquals(ip.address, '10.1.250.173')
  lu.assertEquals(ip.maskBits, 7)
  lu.assertEquals(ip:networkAddress(), '10.0.0.0')
end

function test_ipv4Address:test_8bit()
  local ip = ipv4Address:new('10.1.250.173/8')
  lu.assertEquals(ip.address, '10.1.250.173')
  lu.assertEquals(ip.maskBits, 8)
  lu.assertEquals(ip:networkAddress(), '10.0.0.0')
end

function test_ipv4Address:test_15bit()
  local ip = ipv4Address:new('10.1.250.173/15')
  lu.assertEquals(ip.address, '10.1.250.173')
  lu.assertEquals(ip.maskBits, 15)
  lu.assertEquals(ip:networkAddress(), '10.0.0.0')
end

function test_ipv4Address:test_16bit()
  local ip = ipv4Address:new('10.1.250.173/16')
  lu.assertEquals(ip.address, '10.1.250.173')
  lu.assertEquals(ip.maskBits, 16)
  lu.assertEquals(ip:networkAddress(), '10.1.0.0')
end

function test_ipv4Address:test_23bit()
  local ip = ipv4Address:new('10.1.250.173/23')
  lu.assertEquals(ip.address, '10.1.250.173')
  lu.assertEquals(ip.maskBits, 23)
  lu.assertEquals(ip:networkAddress(), '10.1.250.0')
end

function test_ipv4Address:test_24bit()
  local ip = ipv4Address:new('10.1.250.173/24')
  lu.assertEquals(ip.address, '10.1.250.173')
  lu.assertEquals(ip.maskBits, 24)
  lu.assertEquals(ip:networkAddress(), '10.1.250.0')
end

function test_ipv4Address:test_25bit()
  local ip = ipv4Address:new('10.1.250.173/25')
  lu.assertEquals(ip.address, '10.1.250.173')
  lu.assertEquals(ip.maskBits, 25)
  lu.assertEquals(ip:networkAddress(), '10.1.250.128')
end

function test_ipv4Address:test_32bit()
  local ip = ipv4Address:new('10.1.250.173/32')
  lu.assertEquals(ip.address, '10.1.250.173')
  lu.assertEquals(ip.maskBits, 32)
  lu.assertEquals(ip:networkAddress(), '10.1.250.173')
end
