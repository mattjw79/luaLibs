require 'lib.stringaddons'

local ipv4address = {}

function ipv4address:new(addr)
  local obj = { maskBits = 32, __type = 'ipv4address' }

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

function ipv4address:binaryNetworkAddress()
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

function ipv4address:networkAddress()
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

function ipv4address:insubnet(addr)
  if type(addr) ~= 'string' and type(addr) ~= 'ipv4address' then
    error('Passed in item must be a CIDR string or ipv4address object')
  end

  if type(addr) == 'string' then
    if addr:find('%/') == nil then
      error('Passed in item is not a valid CIDR string')
    end
    addr = ipv4address:new(addr)
  end

  local mask = addr:binaryNetworkAddress()
  for b=1, #mask do
    if mask[b] == 1 and self.binaryAddress[b] ~= mask[b] then
      return false
    end
  end
  return true
end

function ipv4address:__tostring()
  return string.format('%s: %s/%s', self.__type, self.address, self.maskBits)
end

return ipv4address
