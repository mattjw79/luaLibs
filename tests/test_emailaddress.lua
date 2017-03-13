local lu = require 'luaunit'

local emailaddress = require 'lib.emailaddress'

test_emailaddress = {}

function test_emailaddress:test_full_rcpt_to()
  local email = emailaddress:new('RCPT TO: User One <uone@example.com>')
  lu.assertEquals(email.localpart, 'uone')
  lu.assertEquals(email.domain, 'example.com')
  lu.assertEquals(email.full, 'uone@example.com')
end

function test_emailaddress:test_full_rcpt_to_with_quoted_address()
  local email = emailaddress:new('RCPT TO: User One <"user one"@example.com>')
  lu.assertEquals(email.localpart, 'user one')
  lu.assertEquals(email.domain, 'example.com')
  lu.assertEquals(email.full, '"user one"@example.com')
end

function test_emailaddress:test_full_rcpt_to_with_single_quoted_address()
  local email = emailaddress:new("RCPT TO: User One <'user one'@example.com>")
  lu.assertEquals(email.localpart, 'user one')
  lu.assertEquals(email.domain, 'example.com')
  lu.assertEquals(email.full, '"user one"@example.com')
end

function test_emailaddress:test_bracketed_rcpt_to()
  local email = emailaddress:new('RCPT TO: <uone@example.com>')
  lu.assertEquals(email.localpart, 'uone')
  lu.assertEquals(email.domain, 'example.com')
  lu.assertEquals(email.full, 'uone@example.com')
end

function test_emailaddress:test_min_rcpt_to()
  local email = emailaddress:new('RCPT TO: uone@example.com')
  lu.assertEquals(email.localpart, 'uone')
  lu.assertEquals(email.domain, 'example.com')
  lu.assertEquals(email.full, 'uone@example.com')
end

function test_emailaddress:test_tostring()
  local email = emailaddress:new('RCPT TO: User One <uone@example.com>')
  lu.assertEquals(tostring(email), 'emailaddress: uone@example.com')
end
