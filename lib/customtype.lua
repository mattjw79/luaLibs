originaltype = type

function type(item)
  if originaltype(item) == 'table' and item.__type ~= nil then
    return item.__type
  else
    return originaltype(item)
  end
end
