package.cpath = package.cpath..";./?.so"
package.path = package.cpath..";./?.lua"


local htmlentities = require("lib.resty.htmlentities")

local decoder, err = htmlentities.new()
if err then
    assert(false, "cannot found libhtmlentities.so")
end

function test(input, output)
	local s = decoder.decode(input)
	assert(s == output, string.format("test failed: %s => %s (%s)", input, output, s))
	print(string.format("test success: %s => %s", input, output))
end

test('Christoph G&auml;rtner', "Christoph Gärtner");
test('abcd', 'abcd')
test('test&#x40;example.org', 'test@example.org')
test('&supe;-&sup1;-&szlig;-&sup;-&sup2;-&sum;-&sup3;', '⊇-¹-ß-⊃-²-∑-³')
test('test&#x40;example.org&#x40;', 'test@example.org@')
test('&supe;-&sup1;-&szlig;-&sup;-&sup2;-&sum;-&sup3;', '⊇-¹-ß-⊃-²-∑-³')
test('&supe;-&sup1;-&szlig;-&sup;-&sup2;-&sum;-&sup3;-&sub8;', '⊇-¹-ß-⊃-²-∑-³-&sub8;')
test('&#60;html&#62; &#169; &#960; &#34; &#39;', '<html> © π " \'')
test('a &#38; b &#38; c', 'a & b & c')
test('&lt;&gt;\'"&amp;', '<>\'"&')

local hex = {
    ['߀'] = '&#x7c0;',
    ['߁'] = '&#x7c1;',
    ['߂'] = '&#x7c2;',
    ['߃'] = '&#x7c3;',
    ['߄'] = '&#x7c4;',
    ['߅'] = '&#x7c5;',
    ['߆'] = '&#x7c6;',
    ['߇'] = '&#x7c7;',
    ['߈'] = '&#x7c8;',
    ['߉'] = '&#x7c9;',
    ['ߊ'] = '&#x7ca;',
    ['ߋ'] = '&#x7cb;',
    ['ߌ'] = '&#x7cc;',
    ['ߍ'] = '&#x7cd;',
    ['ߎ'] = '&#x7ce;',
    ['ߏ'] = '&#x7cf;',
}

for k, v in pairs(hex) do
    test(v, k)
end
