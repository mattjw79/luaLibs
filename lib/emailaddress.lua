require 'lib.stringaddons'

local emailaddress = {}

function emailaddress:new(addr)
  local obj = {
    __type = 'emailaddress',
    localpart = '',
    domain = '',
    full = ''
  }

  if addr:find('RCPT TO:') then
    addr = addr:sub(9):strip()
  end

  if addr:find('<') then
    addr = addr:gsub('^.-<(.-)>$', '%1')
  end

  local parts = addr:split('@')
  obj.localpart = parts[1]:strip()
  if obj.localpart:find('"') then
    obj.localpart = obj.localpart:gsub('%"', '')
  end
  if obj.localpart:find("'") then
    obj.localpart = obj.localpart:gsub("'", '')
  end
  obj.domain = parts[2]:strip()

  if obj.localpart:len() > 0 then
    obj.full = obj.full .. obj.localpart
    if obj.full:find(' ') then
      obj.full = '"' .. obj.full .. '"'
    end
  end

  if obj.domain:len() > 0 then
    if obj.full:len() > 0 then
      obj.full = obj.full .. '@'
    end
    obj.full = obj.full .. obj.domain
  end

  setmetatable(obj, self)
  self._index = self
  return obj
end

function emailaddress:__tostring()
  return string.format('%s: %s', self.__type, self.full)
end

return emailaddress
