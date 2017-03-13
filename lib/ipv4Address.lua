require 'lib.string_addons'

local ipv4Address = {}

function ipv4Address:new(addr)
  local obj = { maskBits = 32 }

  if type(addr) ~= 'string' then
    error('Delimiter must be a string')
  end

  local parts = addr:split('/')
  obj.address = parts[1]
  obj.maskBits = math.floor(tonumber(parts[2]))
  obj.binaryAddress = {}
  local octets = obj.address:split('.')
  for i=1, #octets do
    local num = tonumber(octets[i])
    for b=8, 1, -1 do
      local bit = ((i - 1) * 8) + b
      local value = math.fmod(num, 2)
      obj.binaryAddress[bit] = math.floor(value)
      num = (num - value) / 2
    end
  end

  setmetatable(obj, self)
  self.__index = self
  return obj
end

function ipv4Address:binaryNetworkAddress()
  local networkAddress = {}
  for b=1, 32 do
    if b > self.maskBits then
      networkAddress[b] = 0
    else
      networkAddress[b] = self.binaryAddress[b]
    end
  end
  return networkAddress
end

function ipv4Address:networkAddress()
  local networkAddress = self:binaryNetworkAddress()

  local octets = { 0, 0, 0, 0 }
  for i=1, 4 do
    for b=1, 8 do
      local bit = ((i - 1) * 8) + b
      local bitValue = math.floor(networkAddress[bit] * (2 ^ (8 - b)))
      octets[i] = octets[i] + bitValue
    end
  end

  return table.concat(octets, '.')
end

return ipv4Address
