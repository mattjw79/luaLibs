local lu = require 'luaunit'

require 'lib.tableaddons'

test_count = {}

function test_count:test_normal()
    local t = { 'one', 'two', 'three', 'four', 'five' }
    c = table.count(t)
    lu.assertEquals(c, 5)
    lu.assertEquals(#t, 5)
end

function test_count:test_assoc_count()
    local t = { a = 'one', b = 'two', c = 'three', d = 'four', e = 'five' }
    c = table.count(t)
    lu.assertEquals(c, 5)
    -- just to show we can't trust the #t to count all items
    lu.assertNotEquals(#t, 5)
end

function test_count:test_mixed_count()
    local t = { a = 'one', b = 'two', 'three', 'four', e = 'five' }
    c = table.count(t)
    lu.assertEquals(c, 5)
    -- just to show we can't trust the #t to count all items
    lu.assertNotEquals(#t, 5)
end

test_slice = {}

function test_slice:test_normal()
    local t = { 'one', 'two', 'three', 'four', 'five' }
    local s = table.slice(t, 1, 3)
    lu.assertEquals(table.count(s), 3)
    lu.assertEquals(s[1], 'one')
    lu.assertEquals(s[2], 'two')
    lu.assertEquals(s[3], 'three')
end

function test_slice:test_zero_start_slice()
    local t = { 'one', 'two', 'three', 'four', 'five' }
    local s = table.slice(t, 0, 3)
    lu.assertEquals(table.count(s), 3)
    lu.assertEquals(s[1], 'one')
    lu.assertEquals(s[2], 'two')
    lu.assertEquals(s[3], 'three')
end

function test_slice:test_mixed_slice()
    local t = { 'one', 'two', three = 'three', 'four', 'five' }
    local s = table.slice(t, 1, 3)

    -- this happens because tables are stored as indexed items first
    -- then named items, so the table will always read like the following:
    -- { 'one', 'two', 'four', 'five', three = 'three' }
    lu.assertEquals(table.count(s), 3)
    lu.assertEquals(s[1], 'one')
    lu.assertEquals(s[2], 'two')
    lu.assertEquals(s[3], 'four')
end

function test_slice:test_big_count_slice()
    local t = { 'one', 'two', 'three', 'four', 'five' }
    local s = table.slice(t, 3, 8)
    lu.assertEquals(table.count(s), 3)
    lu.assertEquals(s[1], 'three')
    lu.assertEquals(s[2], 'four')
    lu.assertEquals(s[3], 'five')
end

function test_slice:test_no_count_slice()
    local t = { 'one', 'two', 'three', 'four', 'five' }
    local s = table.slice(t, 3)
    lu.assertEquals(table.count(s), 3)
    lu.assertEquals(s[1], 'three')
    lu.assertEquals(s[2], 'four')
    lu.assertEquals(s[3], 'five')
end

function test_slice:test_mid_slice()
    local t = { 'one', 'two', 'three', 'four', 'five' }
    local s = table.slice(t, 3, 2)
    lu.assertEquals(table.count(s), 2)
    lu.assertEquals(s[1], 'three')
    lu.assertEquals(s[2], 'four')
end

function test_slice:test_negative_slice()
    local t = { 'one', 'two', 'three', 'four', 'five' }
    local s = table.slice(t, -4, 2)
    lu.assertEquals(table.count(s), 2)
    lu.assertEquals(s[1], 'two')
    lu.assertEquals(s[2], 'three')
end

function test_slice:test_negative_no_count_slice()
    local t = { 'one', 'two', 'three', 'four', 'five' }
    local s = table.slice(t, -3)
    lu.assertEquals(table.count(s), 3)
    lu.assertEquals(s[1], 'three')
    lu.assertEquals(s[2], 'four')
    lu.assertEquals(s[3], 'five')
end
