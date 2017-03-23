local lu = require 'luaunit'

require 'lib.stringaddons'

test_split = {}

function test_split:test_invalid_delim_returns_error()
  local str = 'one,two,three,four,five'
  lu.assertErrorMsgContains('Delimiter must be a string', string.split, str, 1)
end

function test_split:test_asterisk()
  local str = 'one*two*three*four*five'
  local tbl = str:split('*')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_asterisk_space()
  local str = 'one* two* three* four* five'
  local tbl = str:split('* ')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_bracket()
  local str = 'one[two[three[four[five'
  local tbl = str:split('[')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_bracket_space()
  local str = 'one* two* three* four* five'
  local tbl = str:split('* ')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_caret()
  local str = 'one^two^three^four^five'
  local tbl = str:split('^')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_caret_space()
  local str = 'one^ two^ three^ four^ five'
  local tbl = str:split('^ ')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_comma()
  local str = 'one,two,three,four,five'
  local tbl = str:split(',')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_comma_space()
  local str = 'one, two, three, four, five'
  local tbl = str:split(', ')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_dash()
  local str = 'one-two-three-four-five'
  local tbl = str:split('-')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_dash_space()
  local str = 'one - two - three - four - five'
  local tbl = str:split(' - ')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_dollar()
  local str = 'one$two$three$four$five'
  local tbl = str:split('$')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_dollar_space()
  local str = 'one$ two$ three$ four$ five'
  local tbl = str:split('$ ')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_dot()
  local str = 'one.two.three.four.five'
  local tbl = str:split('.')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_dot_space()
  local str = 'one. two. three. four. five'
  local tbl = str:split('. ')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_dot_space_dot()
  local str = 'one. .two. .three. .four. .five'
  local tbl = str:split('. .')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_dot_percent_dot()
  local str = 'one.%.two.%.three.%.four.%.five'
  local tbl = str:split('.%.')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_equal()
  local str = 'one=two=three=four=five'
  local tbl = str:split('=')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_equal_space()
  local str = 'one= two= three= four= five'
  local tbl = str:split('= ')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_equal_space_space()
  local str = 'one = two = three = four = five'
  local tbl = str:split(' = ')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_paren_open()
  local str = 'one(two)'
  local tbl = str:split('(')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two)'})
end

function test_split:test_paren_open_space()
  local str = 'one( two )'
  local tbl = str:split('( ')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two )'})
end

function test_split:test_paren_close()
  local str = '(one)two'
  local tbl = str:split(')')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'(one', 'two'})
end

function test_split:test_paren_close_space()
  local str = '( one ) two'
  local tbl = str:split(') ')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'( one ', 'two'})
end

function test_split:test_percent()
  local str = 'one%two%three%four%five'
  local tbl = str:split('%')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_percent_space()
  local str = 'one% two% three% four% five'
  local tbl = str:split('% ')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_question()
  local str = 'one?two?three?four?five'
  local tbl = str:split('?')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

function test_split:test_question_space()
  local str = 'one? two? three? four? five'
  local tbl = str:split('? ')
  lu.assertIsTable(tbl)
  lu.assertItemsEquals(tbl, {'one', 'two', 'three', 'four', 'five'})
end

test_rstrip = {}

function test_rstrip:test()
  local str = '  one = another  '
  lu.assertEquals(str:rstrip(), '  one = another')
end

test_lstrip = {}

function test_lstrip:test()
  local str = '  one = another  '
  lu.assertEquals(str:lstrip(), 'one = another  ')
end

test_strip = {}

function test_strip:test()
  local str = '  one = another  '
  lu.assertEquals(str:strip(), 'one = another')
end

test_startswith = {}

function test_startswith:test_normal()
  local str = 'this is a test and only a test'
  lu.assertTrue(str:startswith('this is a'))
  lu.assertFalse(str:startswith('this is not a'))
end

function test_startswith:test_quoted()
  local str = '"this is" a test and only a test'
  lu.assertTrue(str:startswith('"this is" a'))
  lu.assertFalse(str:startswith('"this is not" a'))
end

test_endswith = {}

function test_endswith:test_normal()
  local str = 'this is a test and only a test'
  lu.assertTrue(str:endswith('only a test'))
  lu.assertFalse(str:endswith('this is not a'))
end

function test_endswith:test_quoted()
  local str = 'this is a test and only "a" test'
  lu.assertTrue(str:endswith('only "a" test'))
  lu.assertFalse(str:endswith('"this is not" a'))
end

test_contains = {}

function test_contains:test_normal()
  local str = 'this is a test and only a test'
  lu.assertTrue(str:contains('test and'))
  lu.assertFalse(str:contains('one test'))
end

function test_contains:test_quoted()
  local str = 'this is a test and only "a" test'
  lu.assertTrue(str:contains('only "a"'))
  lu.assertFalse(str:contains('only a'))
end

function test_contains:test_dot1()
  local str = 'this is a test . and only "a" test'
  lu.assertTrue(str:contains('test . and'))
  lu.assertFalse(str:contains('test a and'))
end

function test_contains:test_dot2()
  local str = 'this is a test a and only "a" test'
  lu.assertTrue(str:contains('test a and'))
  lu.assertFalse(str:contains('test . and'))
end
