originalType = type

function type(item)
  if item.__type ~= nil then
    return item.__type
  else
    return originalType(item)
  end
end
