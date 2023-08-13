do
getreg().whitelist_key = 'cracked';
getreg().ID = 'lol';

local base64_custom = {};
do
	-- character table string
	local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	local enc_const1 = 1.899346804; --cringe
	local enc_const2 = 8; --to make c work together with the operations

	-- encoding
	base64_custom.enc = function(data)
		return ((data:gsub('.', function(x) 
			local r,b='',(x:byte() * enc_const1);
			for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
			return r;
		end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
			if (#x < 6) then return '' end
			local c=0
			for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
			return b:sub(c+1,c+1)
		end)..({ '', '==', '=' })[#data%3+1])
	end

	-- decoding
	base64_custom.dec = function(data)
		data = string.gsub(data, '[^'..b..'=]', '')
		return (data:gsub('.', function(x)
			if (x == '=') then return '' end
			local r,f='',(b:find(x)-1)
			for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
			return r;
		end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
			if (#x ~= 8) then return '' end
			local c=0
			for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(enc_const2-i) or 0) end
			return string.char((c/enc_const1) + 1);
		end));
	end;
end;

do
	local BLOXBURG_VERSION = '952';
	local CONSTANT_UUID = 'fe55a2a8-1c84-423c-9cc2-15b4215fb2cb';
	local responses = {
		['https://bloxburg.sexy/version.php'] = BLOXBURG_VERSION;
		['https://sor.cool/whitelist/bemeingtimesex.lua'] = CONSTANT_UUID;
		['https://bloxburg.sexy/getinvite.php'] = 'https://bloxburg.sexy/discord/joinDiscord';
		['https://bloxburg.sexy/neighborhoods/getCode.php'] = '';
	};
	
	local replaceclosure = getfenv()[base64_custom.dec('2L/Uzbi8v7zN0tre2L8=')];
	local httpService = game:GetService('HttpService');

	replaceclosure(syn.request, newcclosure(function(t)
		local tur = t.Url;
		if (tur == 'https://sor.cool/whitelist/bemeingtimesex.lua') then
			return { Body = CONSTANT_UUID, StatusCode = 200 };
		elseif (tur == 'https://sor.cool/whitelist/sanity.lua') then
			return { Body = tostring(os.time()):sub(1, -4), StatusCode = 200 };
		else
			local key, id, data = tur:match('^http[s]?://sor%.cool/whitelist/checkauthentication%.lua%??[%w+%?=]-[%?&]Key=([_%w%%]-)&ID=(%w+)&Data=([%w%+/=]*)');
			if (key) then
				data = base64_custom.dec(data);
				local nt = 0;
				local t = tostring(os.time()):sub(1, -4);
				do
					local pstart = 3.7;
					nt = t * 1.5335;
					nt = (nt + ((nt / 2) / (nt / 0.5)));
					nt = math.ceil(nt * 1.5 * tonumber(pstart));
					nt = tonumber(nt) + 5219;
					nt = nt + tonumber(data); --append data	
				end;

				return { Body = httpService:JSONEncode{
					signature = t;
					data = base64_custom.enc(tostring(nt));
				}, StatusCode = 200 };
			end;
		end;
	end));

	replaceclosure(game.HttpGet, newcclosure(function(self, url, is_async)
		return responses[url];
	end));
end;
end;

-- //Check Exploit\\
repeat wait() until game:IsLoaded()
local beta = false
local private = false
local function getexploit()
    local exploit =
        (syn and not is_sirhurt_closure and not pebc_execute and "Synapse") or
        ("Unsupported")
 
    return exploit
 end
if getexploit() == "Unsupported" then
    game.Players.LocalPlayer:Kick("[Void] Exploit not supported! Please use Synapse.")
end
local exploit = getexploit() 
--[[
    Release:
        Synapse: 27
        Krnl: 32
    Obfuscated:
        Synapse: 55
        Krnl: 30
    Unobfuscated: 
        Synapse: 42
        Krnl: 18
]]
--[[local krnlCheck = 32
local synapseCheck = 27
num = 0
for i,v in pairs(getgc()) do 
    if type(v) == "function" and islclosure(v) and getfenv(v).script and not getfenv(v).script.Parent then 
        a = (debug.getinfo(v).source)
        if (string.find(a,"@")) then 
            num = num + 1
        end
    end
end
if (exploit == "Synapse" and num > synapseCheck) or (exploit == "Krnl" and num > krnlCheck) then
    print(num) 
    game.Players.LocalPlayer:Kick("[Void] Don't execute anything before the script.")
    wait(3)
    while true do end
end]]
--// Variables

if not shared.ran then
    shared.ran = true 
else
    a = false
    repeat wait() until a 
end
local host = 'https://sor.cool/whitelist'
local Key = getreg().whitelist_key or "retardalert"
local ID = getreg().ID or "retardalert"
if(Key == "") then
    Key = "retardalert"
end
if(ID == "") then
    ID = "retardalert"
end
local request = (exploit == "Synapse" and syn.request) or (exploit == "ProtoSmasher" and http_request) or (exploit == "Krnl" and request)
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local start = tick()
local starttime = os.time()
local checks = {}
local checked = {}
local cracked = false
local jmpkey = math.random(1,10000000)
local jmpcheck4 = math.random(1,10000000)
local jmpcheck2 = nil
local jmpdepend = math.random(1,4)
local jmpcheck1 = nil
local jmpcheck3 = nil

local function Create(object, properties)
    local Object = Instance.new(object)
    
    for i, v in pairs(properties) do
        Object[i] = v
    end
    
    return Object
end

--// Functions
function noSpace(str)
    local normalisedString = string.gsub(str, "%s+", '%%20')
    return normalisedString
end
function randomString(length)
    local res = ""
    for i = 1, length do
        res = res .. string.char(math.random(97, 122))
    end
    return res
end
local function grabTime(v1)
    if v1 < 1 then
        while true do end
    end
    time11 = tostring(os.time())
    timee = time11:sub(1, -4)
    local a = timee
    local a = a * 1.5335
    timeee = a + ((a / 2) / (a / 0.5)) 
    timeee = math.ceil((timeee * 1.5 * tonumber(v1)))
    timeee = tonumber(timeee) + 5219
    if timeee < 100 then
        while true do end
    end
    return timeee
end
function grabData() 
    return math.cos(math.ldexp(grabTime(3.3) * 6,5) + math.random(1,100000) + 3) + 2
end
function get(Url) 
    local res = request({
    Url = (Url);
    Method = 'GET';
    })
    if not (res["StatusCode"]) then
        while true do end
    elseif res["StatusCode"] ~= 200 then
        while wait() do end
        wait(0.6)
        wait(2)
        while true do end
        while wait() do end
    end
    return res["Body"]
end
local function report(report_id,addinfo)
	print(addinfo)
    if cracked == true then 
        while wait() do end
    end
    if(addinfo == "" or not addinfo) then
        addinfo = "None"
    else 
        addinfo = noSpace(addinfo)
    end
    local res = request(
        {
            Url = host .. "/logs.lua?info=" .. (report_id or "nil") .. "&ID=" .. (ID or "nil") .. "&private="..(tostring(private) or false).."&addinfo=" .. (addinfo or "None"),
            Method = "POST",
        }
    )
    game:GetService("Players").LocalPlayer:Kick("Detected crack attempt. (" .. report_id .. ")")
    repeat wait() until res
    cracked = true
    wait(0.3)
    while true do end
    a = false
    repeat wait() until a == true
end
local function reportOutput(type,text) 
    if(text == "" or not text) then
        text = "None"
    else 
        text = noSpace(text)
    end
    local res = request(
        {
            Url = host .. "/api/logs/send?channel=" .. 'output' .. "&info=" .. type .. "&key=" .. Key .. "&text=" .. text,
            Method = "POST"
        }
    )
end
local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/' -- You will need this for encoding/decoding

local Base64 = {}
function Base64.Encode(data)
    data = tostring(data)
    local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    return ((data:gsub('.', function(x) 
        local r,b='',x:byte()*(1.899346804)
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end
-- decoding
function Base64.Decode(data)
    local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
            return string.char((c/1.899346804 + 1))
    end))
end
local function base(s)
    return s:lower() == s and ('a'):byte() or ('A'):byte()
end

function cipher(str)
    return (str:gsub("%a", function(s)
        local base = base(s)
        return string.char(((s:byte() - base + 13) % 26) + base)
    end));
end

function decipher(str)
    return (str:gsub("%a", function(s)
        local base = base(s)
        return string.char(((s:byte() - base - 13) % 26) + base)
    end));
end

function encrypt(str)
    local encrypted = ""
    string.gsub(cipher(str), ".", function(char) encrypted = encrypted .. string.format("%02X", string.byte(char)) end)
    return cipher(encrypted)
end
function decrypt(encrypted)
    local decrypted = ""
    string.gsub(decipher(encrypted), "..", function(hexbyte) decrypted = decrypted .. string.char(tonumber(hexbyte, 16)) end)
    return decipher(decrypted);
end

function grabVerification() 
    local mathrandom = 3
    verifyy = math.random()
    local test = mathrandom * verifyy
    local L = test * verifyy / 2
    return L
end
function checkVerify(check, crash) 
    local found
    for i,v in ipairs(checks) do 
        if(v == check) then
            found = true
        end
    end
    if(found ~= true) then
        if(crash == true) then
            report(1) -- Verification Check Failed
        end
        return false
    else
        found = false
        for i,v in pairs(checked) do
            if v == check then
                found = true
            end
        end
        if found == false then
            table.insert(checked, check)
        end
        return true
    end
end
function EndVerify()
    local a = 0
    local b = 0
    for i,v in pairs(checks) do
        a = a + 1
    end
    for i,v in pairs(checked) do
        b = b + 1
    end
    if(a ~= 3 or b ~= 3) then
        report(2) -- Verification End Failed
    end
    if not(b == a) then
        report(2) -- Verification End Failed
    end
end

function Verify(check, verification)
    if(checkVerify(check, false)) then
        report(3) -- Verification Failed
    end
    local function func() 
        local verificationstring = 2
        local verificationstring = verificationstring + 3 - 2
        local veriffy = verifyy
        local noob = verificationstring * veriffy
        local diot = noob * veriffy / 2
        return diot
    end
    local verificationstring = func()
    if(verification ~= verificationstring) then 
        report(3) -- Verification Failed
        return false
    else
        table.insert(checks, check)
        return true
    end
end

-- //Anti EQ\\
function eq(a,b) 
    if type(a) ~= type(b) then
        report(8, "EQ1, " .. a .. " " .. b) -- EQ Failed
        return false
    end
    a = tostring(a)
    b = tostring(b)
    c = false
    if(string.len(a) ~= string.len(b)) then
        report(8, "EQ2, " .. a .. " " .. b) -- EQ Failed
        return false
    end
    str = 'abc'
    a1 = ''
    a2 = 0
    a3 = {}
    string.gsub(a, ".", function(char) 
        a1 = a1 .. string.format("%02X", string.byte(char)) 
        table.insert(a3,string.format("%02X", string.byte(char)))
    end)
    b1 = ''
    b2 = 0
    b3 = {}
    string.gsub(b, ".", function(char) 
        b1 = b1 .. string.format("%02X", string.byte(char)) 
        table.insert(b3,string.format("%02X", string.byte(char)))
    end)
    for i,v in pairs(a3) do
        a2 = a2 + 1
    end
    for i,v in pairs(b3) do
        b2 = b2 + 1
    end
    if a2 ~= b2 then
        report(8, "EQ3, " .. a .. " " .. b) -- EQ Failed
        return false
    end
    for i=1,a:len() do
        if a3[i] ~= b3[i] then
            report(8, "EQ4, " .. a .. " " .. b) -- EQ Failed
            return false
        end
    end
    for i=1,math.random(1,4) do
        local depend = math.random(1,5)
        if depend == 1 then
            a = a:rep(2)
            b = b:rep(2)
            for i=1,a:len() do
                if a ~= b then
                    report(8, "EQ5, " .. a .. " " .. b) -- EQ Failed
                    return false
                else
                    c = true
                end
            end
            return c
        elseif(depend == 2) then
            if a:reverse() ~= a:reverse() then
                report(8, "EQ6, " .. a .. " " .. b) -- EQ Failed
                return false
            elseif(b:reverse() ~= b:reverse()) then
                report(8, "EQ7, " .. a .. " " .. b) -- EQ Failed
                return false
            elseif(b:reverse() == a:reverse()) then
                wtfjmptext = (('a'):rep(jmpdepend*10))
                return true
            elseif(a:reverse() == b:reverse()) then
                report(8, "EQ8, " .. a .. " " .. b) -- EQ Failed
                return false
            else
                report(8, "EQ9, " .. a .. " " .. b) -- EQ Failed
                return false
            end
        elseif(depend == 3) then
            if(a:len() ~= b:len()) then
                report(8, "EQ10, " .. a .. " " .. b) -- EQ Failed
                return false
            elseif(a:len() ~= a:len()) then
                report(8, "EQ11, " .. a .. " " .. b) -- EQ Failed
                return false
            elseif(b:len() ~= b:len()) then
                report(8, "EQ12, " .. a .. " " .. b) -- EQ Failed
                return false
            elseif(b:len() == a:len()) then
                wtfjmptext = (('a'):rep(jmpdepend*10))
                return true
            elseif(a:len() == b:len()) then
                report(8, "EQ13, " .. a .. " " .. b) -- EQ Failed
                return false
            end
        elseif(depend == 4) then
            if not(a:find(b)) then
                report(8, "EQ14, " .. a .. " " .. b) -- EQ Failed
                return false
            elseif not (b:find(a)) then
                report(8, "EQ15, " .. a .. " " .. b) -- EQ Failed
                return false
            elseif not (b:find(b)) then
                report(8, "EQ16, " .. a .. " " .. b) -- EQ Failed
                return false
            elseif not (a:find(a)) then
                report(8, "EQ17, " .. a .. " " .. b) -- EQ Failed
                return false
            elseif (a:find(b)) then
                wtfjmptext = (('a'):rep(jmpdepend*10))
                return true
            elseif (b:find(a)) then
                report(8, "EQ18, " .. a .. " " .. b) -- EQ Failed
                return false
            end
        elseif(depend == 5) then
            local a = a:reverse()
            local b = b:reverse()
            local a = a:len()
            local b = b:len()
            if not (a == b) then
                report(8, "EQ19, " .. a .. " " .. b) -- EQ Failed
                return false
            elseif not (a == a) then
                report(8, "EQ20, " .. a .. " " .. b) -- EQ Failed
                return false
            elseif not (b == b) then
                report(8, "EQ21, " .. a .. " " .. b) -- EQ Failed
                return false
            elseif not (a ~= b) then
                wtfjmptext = (('a'):rep(jmpdepend*10))
                return true
            elseif not (b ~= a) then
                report(8, "EQ22, " .. a .. " " .. b) -- EQ Failed
                return false
            else
                report(8, "EQ23, " .. a .. " " .. b) -- EQ Failed
                return false
            end
        end
    end
end

--// Anti-HttpSpy

game:HttpGet(host.."/bemeingtimesex.lua")

request({
    Url = host .. "/bemeingtimesex.lua";
    Method = "GET";
})

for i,v in next, game:GetService("LogService"):GetLogHistory() do 
    if v.message:find('bemeingtimesex') or v.message:find('fe55a2a8-1c84-423c-9cc2-15b4215fb2cb') then
        report(5, "HTTP")
    end
end

--/ /Anti-Hookfunctions
print'ah1'
local body = get(host .. '/sanity.lua')

expectedBody = tostring(os.time())
expectedBody = expectedBody:sub(1, -4)
print'san1'
repeat wait() until body ~= ''
if tonumber(body) ~= tonumber(expectedBody) then
    local a = false
    repeat wait() until a == true
end
local function getfunc()
    return function() end
end

spawn(function()
    while wait() do 
        if (exploit == "synapse" and not isreadonly(syn)) then 
            report(5, "IRO (syn)")
        end
    end
end)

if os.time() <= 1597707055 then 
    report(5, "OT-1")
end

spawn(function()
    while wait(1) do 
        local depend = math.random(1,4)
        if depend == 1 then 
            loadstring([[function f() 
                return function()
                    local check1 = '0125b3d8-eb8a-4d91-866b-53767cc7a040'
                    return 'ab5a303e-d34c-4ee6-958b-1ee36bbf566f'
                end
            end]])()
            local const = debug.getconstants(f())
            if exploit == "Synapse" then
                table.remove(const, #const)
            end
            if #const ~= 2 then 
                report(5, "CC1D1 "..#const)
            end
            local expected = {'0125b3d8-eb8a-4d91-866b-53767cc7a040', 'ab5a303e-d34c-4ee6-958b-1ee36bbf566f'} 
            for i,v in next, const do 
                if expected[i] ~= v then 
                    report(5, "CC2D1")
                end 
            end
            if f()() ~= 'ab5a303e-d34c-4ee6-958b-1ee36bbf566f' then 
                report(5, "CC3D1")
            end
        elseif depend == 2 then
            loadstring([[function g() 
                return function()
                    local check2 = 'cb7a1663-dd68-436d-bf5c-5f2aff62c9e3'
                    return 'f081c7b4-f74c-459e-b28c-530b6a7b6776'
                end
            end]])()
            local const = debug.getconstants(g())
            if exploit == "Synapse" then
                table.remove(const, #const)
            end
            if #const ~= 2 then 
                report(5, "CC1D2 "..#const)
            end
            local expected =  {'cb7a1663-dd68-436d-bf5c-5f2aff62c9e3', 'f081c7b4-f74c-459e-b28c-530b6a7b6776'}
            for i,v in next, const do 
                if expected[i] ~= v then 
                    report(5, "CC2D2")
                end 
            end
            if g()() ~= 'f081c7b4-f74c-459e-b28c-530b6a7b6776' then 
                report(5, "CC3D2")
            end
        end
        if depend == 3 then 
            loadstring([[ function h() 
                return function()
                    local check3 = 'b1466ed1-8be9-4742-9f8d-29836d734c7e'
                    return '9898bce5-0e3c-4681-8265-e941dacf395a'
                end
            end]])()
            local const = debug.getconstants(h())
            if exploit == "Synapse" then
                table.remove(const, #const)
            end
            if #const ~= 2 then 
                report(5, "CC1D3 "..#const)
            end
            local expected = {'b1466ed1-8be9-4742-9f8d-29836d734c7e', '9898bce5-0e3c-4681-8265-e941dacf395a'}
            for i,v in next, const do 
                if expected[i] ~= v then 
                    report(5, "CC2D3")
                end 
            end
            if h()() ~= '9898bce5-0e3c-4681-8265-e941dacf395a' then 
                report(5, "CC3D3")
            end
        elseif depend == 4 then
            loadstring([[function i() 
                return function()
                    local check4 = 'cb32ec14-8c8b-47fa-8dc7-f2c853799891'
                    return '61495818-13ed-4ac2-a4ab-15b0f230c56c'
                end
            end]])()
            local const = debug.getconstants(i())
            if exploit == "Synapse" then
                table.remove(const, #const)
            end
            if #const ~= 2 then 
                report(5, "CC1D4 "..#const)
            end
            local expected = {'cb32ec14-8c8b-47fa-8dc7-f2c853799891', '61495818-13ed-4ac2-a4ab-15b0f230c56c'}
            for i,v in next, const do 
                if expected[i] ~= v then 
                    report(5, "CC2D4")
                end 
            end
            if i()() ~= '61495818-13ed-4ac2-a4ab-15b0f230c56c' then 
                report(5, "CC3D4")
            end
        end
    end
end)

spawn(function()
    while wait() do 
        if not islclosure(getfunc()) then 
            report(5,"ISL")
        end
    end
end)

spawn(function()
    while wait(1) do
        local depend = math.random(1,2)
        if depend == 1 then 
            var = "aghd2y"
            varType = type(var)
            if(varType ~= "string") then
                report(5,"TYPE")
            end
        else 
            var = 123125654
            varType = type(var)
            if(varType ~= "number") then
                report(5,"TYPE")
            end
        end
    end
end)

--[[
    Un-Oobfuscated:
        Synapse: 10
        KRNL: 10
    Obfuscated:
        Synapse: 6
        KRNL: 6
]]

local Amount = 0
local Attempts = 0
local uuidcount = 0

local function checkgc()
    return "sex"
end

function search(tt)
    for i,v in next, tt do
        if type(v) == "function" and islclosure(v) then
            local Constant = debug.getconstants(v)
            for k, x in next, Constant do
                Attempts = Attempts + 1
                if x == "hookfunction" or x == "replaceclosure" or x == "setreadonly" or x == "getrawmetatable" then
                    Amount = Amount + 1
                end
            end
        end
    end
end
search(getgc())
search(getreg())
if Attempts < 1000 or Amount ~= 14 then
    report(4,"SE2 " .. Attempts .. " " .. Amount)
else 
    Verify(2,grabVerification())
end

checkgc()

if not table.find(getgc(), checkgc) then 
    report(5,"GC")
end 

spawn(function()
    Bool = false
    check = 0
    local OldT
    while check < 5 do
        wait(2)
        local NewT = os.time()
        if NewT == OldT then 
            report(5,"OT-2 ("..NewT.." "..OldT..")")
        end
        OldT = NewT
        wait()
        local TempDate = os.date("!*t",NewT)
        local TempDate2 = os.date("!*t",NewT+60)
        local OldMin = TempDate.min
        local NewMin = TempDate2.min
        if OldMin == 59 then
            if NewMin ~= 0 and (NewMin ~= 0) then
                report(5,"OT-3")
            end
        elseif NewMin ~= OldMin+1 and (NewMin ~= OldMin+1) then
            report(5,"OT-4")
        end
        wait()
        check = check + 1
    end
end)
spawn(function()
    check2 = 0
    while check2 < 5 do
        wait(1)
        if (os.time() == starttime) then
            report(5,"OT-5") -- HookFunction
        end
        check2 = check2 + 1
        wait(2)
    end
end)
local hook5 = 0
local Bool = true
hookTime = tostring(os.time())
hookTime = hookTime:sub(1, -4)
hookTime = tonumber(hookTime) * 1.5335
hookTime = hookTime + ((hookTime / 2) / (hookTime / 0.5)) 
hookTime = math.ceil((hookTime * 1.5 * 1.72/ 10000))
hookTime = tonumber(hookTime)
spawn(function()
while wait(1) do
    if not (hookTime > tonumber(630)) then
        report(5,"OT-6")
    end
end
end)
local hook1 = 0
spawn(function()
while wait(1) do
    if hook1 > 492374 then
        hook1 = hookTime
    end
    hook1 = hook1 + hookTime
    local a = math.random()
    local b = math.random(hook1,hook1)
    if(a == b) then 
        report(5,"MR-1")
    end
    if not (b == hook1) then
        report(5,"MR-2")
    end
end
end)
local hook7 = 0
spawn(function()
while wait(1) do
    if hook7 > 492374 then
        hook7 = hookTime
    end
    hook7 = hook7 + hookTime
    local a = tonumber(math.random())
    local b = tonumber(math.random(hook7,hook7))
    if(a == b) then
        report(5,"TN-1")
    end
    if not (b == hook7) then
        report(5,"TN-2")
    end
end
end)
local hook2 = 0
spawn(function()
while wait(1) do
    if hook2 > 492374 then
        hook2 = hookTime
    end
    hook2 = hook2 + hookTime
    local a = tostring(math.random())
    local b = tostring(math.random(hook2,hook2))
    if(a == b) then 
        report(5,"TS-1")
    end
    if not (tonumber(b) == hook2) then
        report(5,"TS-2")
    end
end
end)
local hook3 = 0
spawn(function()
while wait(1) do
    local a = string.char(math.random(51,72))
    local b = string.char(math.random(40,50))
    if(a == b) then 
        report(5,"SC-1")
    end
end
end)
local hook4 = 0
spawn(function()
while wait(1) do
    if hook4 > 492374 then
        hook4 = hookTime
    end
    hook4 = hook4 + hookTime
    local string = tostring(math.random(4,7))
    local s = string:sub(1, -1)
    local string2 = tostring(math.random(hook4,hook4))
    local s2 = string2:sub(1, -1)
    if(s == s2) then 
        report(5,"SS-1")
    end
    if not (tonumber(s2) == hook4) then
        report(5,"SS-2")
    end
end
end)
local hook6 = 0
spawn(function()
while wait(1) do
    test = math.random(3,6)
    wait(test)
    if(start == os.time()) then
        report(5,"OT-7")
    end
end
end)
local hook8 = 0
spawn(function()
while wait(1) do
    if hook8 > 492374 then
        hook8 = hookTime
    end
    hook8 = hook8 + hookTime
    local a = math.ceil(math.random())
    local b = math.ceil(math.random(hook8,hook8))
    if(a == b) then
        report(5,"MC-1")
    end
    if not (b == hook8) then
        report(5,"MC-2")
    end
end
end)
local hook9 = 0
spawn(function()
while wait(1) do
    if hook9 > 492374 then
        hook9 = hookTime
    end
    hook9 = hook9 + hookTime
    local a = string.char(math.random(51,72))
    local b = string.char(math.random(40,50))
    local c = tonumber(string.byte(a))
    local d = tonumber(string.byte(b))
    if(c == d) then 
        report(5,"SB-1")
    end
end
end)
local hook10 = 0
spawn(function()
while wait(1) do
    local a = string.char(math.random(51,72))
    local b = string.char(math.random(40,50))
    local c = a:lower()
    local d = b:lower()
    if(c == d) then 
        report(5,"SL-1")
    end
end
end)
local hook11 = 0
spawn(function()
while wait(1) do
    local a = {}
    local aa,b,c = math.random(),math.random(),math.random()
    table.insert(a,aa)
    table.insert(a,b)
    table.insert(a,c)
    local d = 0
    for i,v in pairs(a) do
        d = d + 1
    end
    for i=1,d do
        if not (a[i]) then
            report(5,"TI-1")
        else
            if not (a[i] == aa or a[i] == b or a[i] == c) then
                report(5,"TI-2")
            end
        end
    end
end
end)
local hook12 = 0
spawn(function()
while wait(1) do
    if hook12 > 492374 then
        hook12 = hookTime
    end
    hook12 = hook12 + hookTime
    local a = math.ceil(math.random(1,5))
    local b = tonumber(string.format("%d",math.random(hook12,hook12)))
    if(a == b) then
        report(5,"SF-1")
    end
    if not (b == hook12) then
        report(5,"SF-2")
    end
end
end)
local hook13 = 0 
local hook13T = {}
spawn(function()
while wait(1) do 
    if hook13 > 492374 then
        hook13 = hookTime
    end
    hook13 = hook13 + hookTime 
    table.insert(hook13T,hook13)
    if not table.find(hook13T,hook13) then
        report(5,"TF-1")
    end
end
end)
local hook14 = 0 
spawn(function()
while wait(1) do 
     if hook14 > 492374 then
        hook14 = hookTime
    end
    hook14 = hook14 + hookTime 
    local a = tostring(hook14):sub(1,-1)
    if a ~= tostring(hook14) then 
        report(5,"sub")
    end
end
end)
local hook15 = 0
spawn(function()
while wait(1) do
    if hook15 > 492374 then
        hook15 = hookTime
    end
    hook15 = hook15 + hookTime
    local a = Base64.Encode(tostring(math.random(hook8,hook8)))
    if(a == hook15) then
        report(5,"ENC-1")
    end
    if(tonumber(Base64.Decode(a)) ~= hook15) then
        report(5,"DEC-1")
    end
end
end)
hookTime2 = tostring(os.time())
hookTime2 = hookTime2:sub(1, -4)
hookTime2 = hookTime2 * 1.5335
hookTime2 = hookTime2 + ((hookTime2 / 2) / (hookTime2 / 0.5)) 
hookTime2 = math.ceil((hookTime2 * 1.5 * 1.72/ 10000))
hookTime2 = tonumber(hookTime2)
if not (hookTime2 == hookTime) then
    report(5,"OT-8")
end
--// Anti-JMP
function jmp(var)
    local table = {}
    setreadonly(table,var)
    if isreadonly(table) then
        return true
    else
        report(6,"SRO")
        return false 
    end
end
folder = Create("Folder",{Parent=game.CoreGui,Name='bigmantings'})
local wtf_is_this_table = {
    {aaaaaaaaaa=function() jmpkeyy = jmpkey return {val=true,jmpkey=jmpkey,
        func1=function(jkey,depend) 
            if jkey ~= jmpkeyy then 
                report(6,'wtf is this jmp func')
            end 
            if depend ~= jmpdepend or depend ~= #tostring(depend) or #tostring(depend) ~= #tostring(jmpdepend) then 
                report(6,'wtf is this jmp func')
            end 
            jmpcheck1 = true
            --replace with grabTime with data
            return 123123
        end,
        func2=function(jkey,depend,prev,vcheck)
            if jkey ~= jmpkeyy then 
                report(6,'wtf is this jmp func')
            end 
            if depend ~= jmpdepend or depend ~= #tostring(depend) or #tostring(depend) ~= #tostring(jmpdepend) then 
                report(6,'wtf is this jmp func')
            end 
            --replace with grabTime with data
            if prev ~= 123123 or #tostring(prev) ~= #tostring(123123) then 
                report(6,'wtf is this jmp func')
            end 
            if vcheck ~= 4 or #tostring(vcheck) ~= 1 or #tostring(vcheck) ~= (depend) then 
                report(6,'wtf is this jmp func')
            end
            jmpcheck2 = true
            return 'change this to time3'
        end,
        func3=function(jkey,depend,func1res,func2res,vcheck)
            if jkey ~= jmpkeyy then 
                report(6,'wtf is this jmp func')
            end 
            if depend ~= jmpdepend or depend ~= #tostring(depend) or #tostring(depend) ~= #tostring(jmpdepend) then 
                report(6,'wtf is this jmp func')
            end 
            --replace with grabTime with data
            if func2res ~= 'change this to time3' or #tostring(func2res) ~= #tostring('change this to time3') then 
                report(6,'wtf is this jmp func')
            end 
            if func1res ~= 123123 or #tostring(func1res) ~= #tostring(123123) then 
                report(6,'wtf is this jmp func')
            end 
            if vcheck ~= 4 or #tostring(vcheck) ~= 1 or #tostring(vcheck) ~= (depend) then 
                report(6,'wtf is this jmp func')
            end
            jmpcheck3 = true
            --eq func2res with time3 and checkauth resu
            return {check4=jmpcheck4,check5=57934852,jmp3=function(bool)if bool ~= false then report(6,'wtf is this jmp') else return true end end,jtuseh = game:GetService("TweenService"),fihsefuhh = game:GetService("Players").LocalPlayer,fhiac=game:GetService("UserInputService"),ojh2oa=game:GetService("Players").LocalPlayer:GetMouse()}
        end
    }end},
    {aaaaaaaaaaaaaaaaaaaa=function() jmpkeyy = jmpkey return {val=true,jmpkey=jmpkey,
        func1=function(jkey,depend) 
            if jkey ~= jmpkeyy then 
                report(6,'wtf is this jmp func')
            end 
            if depend ~= jmpdepend or depend ~= #tostring(depend)+1 or #tostring(depend) ~= #tostring(jmpdepend) then 
                report(6,'wtf is this jmp func')
            end 
            jmpcheck1 = true
            --replace with grabTime with data
            return 123123
        end,
        func2=function(jkey,depend,prev,vcheck)
            if jkey ~= jmpkeyy then 
                report(6,'wtf is this jmp func')
            end 
            if depend ~= jmpdepend or depend ~= #tostring(depend)+1 or #tostring(depend) ~= #tostring(jmpdepend) then 
                report(6,'wtf is this jmp func')
            end 
            --replace with grabTime with data
            if prev ~= 123123 or #tostring(prev) ~= #tostring(123123) then 
                report(6,'wtf is this jmp func')
            end 
            if vcheck ~= 4 or #tostring(vcheck) ~= 1 or #tostring(vcheck)+1 ~= (depend) then 
                report(6,'wtf is this jmp func')
            end
            jmpcheck2 = true
            return 'change this to time3'
        end,
        func3=function(jkey,depend,func1res,func2res,vcheck)
            if jkey ~= jmpkeyy then 
                report(6,'wtf is this jmp func')
            end 
            if depend ~= jmpdepend or depend ~= #tostring(depend)+1 or #tostring(depend) ~= #tostring(jmpdepend) then 
                report(6,'wtf is this jmp func')
            end 
            --replace with grabTime with data
            if func2res ~= 'change this to time3' or #tostring(func2res) ~= #tostring('change this to time3') then 
                report(6,'wtf is this jmp func')
            end 
            if func1res ~= 123123 or #tostring(func1res) ~= #tostring(123123) then 
                report(6,'wtf is this jmp func')
            end 
            if vcheck ~= 4 or #tostring(vcheck) ~= 1 or #tostring(vcheck)+1 ~= (depend) then 
                report(6,'wtf is this jmp func')
            end
            jmpcheck3 = true
            --eq func2res with time3 and checkauth resu
            return {check4=jmpcheck4,check5=57934852,jmp3=function(bool)if bool ~= false then report(6,'wtf is this jmp') else return true end end,jtuseh = game:GetService("TweenService"),fihsefuhh = game:GetService("Players").LocalPlayer,fhiac=game:GetService("UserInputService"),ojh2oa=game:GetService("Players").LocalPlayer:GetMouse()}
        end
    }end},
    {aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=function() jmpkeyy = jmpkey return {val=true,jmpkey=jmpkey,
        func1=function(jkey,depend) 
            if jkey ~= jmpkeyy then 
                report(6,'wtf is this jmp func')
            end 
            if depend ~= jmpdepend or depend ~= #tostring(depend)+2 or #tostring(depend) ~= #tostring(jmpdepend) then 
                report(6,'wtf is this jmp func')
            end 
            jmpcheck1 = true
            --replace with grabTime with data
            return 123123
        end,
        func2=function(jkey,depend,prev,vcheck)
            if jkey ~= jmpkeyy then 
                report(6,'wtf is this jmp func')
            end 
            if depend ~= jmpdepend or depend ~= #tostring(depend)+2 or #tostring(depend) ~= #tostring(jmpdepend) then 
                report(6,'wtf is this jmp func')
            end 
            --replace with grabTime with data
            if prev ~= 123123 or #tostring(prev) ~= #tostring(123123) then 
                report(6,'wtf is this jmp func')
            end 
            if vcheck ~= 4 or #tostring(vcheck) ~= 1 or #tostring(vcheck)+2 ~= (depend) then 
                report(6,'wtf is this jmp func')
            end
            jmpcheck2 = true
            return 'change this to time3'
        end,
        func3=function(jkey,depend,func1res,func2res,vcheck)
            if jkey ~= jmpkeyy then 
                report(6,'wtf is this jmp func')
            end 
            if depend ~= jmpdepend or depend ~= #tostring(depend)+2 or #tostring(depend) ~= #tostring(jmpdepend) then 
                report(6,'wtf is this jmp func')
            end 
            --replace with grabTime with data
            if func2res ~= 'change this to time3' or #tostring(func2res) ~= #tostring('change this to time3') then 
                report(6,'wtf is this jmp func')
            end 
            if func1res ~= 123123 or #tostring(func1res) ~= #tostring(123123) then 
                report(6,'wtf is this jmp func')
            end 
            if vcheck ~= 4 or #tostring(vcheck) ~= 1 or #tostring(vcheck)+2 ~= (depend) then 
                report(6,'wtf is this jmp func')
            end
            jmpcheck3 = true
            --eq func2res with time3 and checkauth resu
            return {check4=jmpcheck4,check5=57934852,jmp3=function(bool)if bool ~= false then report(6,'wtf is this jmp') else return true end end,jtuseh = game:GetService("TweenService"),fihsefuhh = game:GetService("Players").LocalPlayer,fhiac=game:GetService("UserInputService"),ojh2oa=game:GetService("Players").LocalPlayer:GetMouse()}
        end
    }end},
    {aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=function() jmpkeyy = jmpkey return {val=true,jmpkey=jmpkey,
        func1=function(jkey,depend) 
            if jkey ~= jmpkeyy then 
                report(6,'wtf is this jmp func')
            end 
            if depend ~= jmpdepend or depend ~= #tostring(depend)+3 or #tostring(depend) ~= #tostring(jmpdepend) then 
                report(6,'wtf is this jmp func')
            end 
            jmpcheck1 = true
            --replace with grabTime with data
            return 123123
        end,
        func2=function(jkey,depend,prev,vcheck)
            if jkey ~= jmpkeyy then 
                report(6,'wtf is this jmp func')
            end 
            if depend ~= jmpdepend or depend ~= #tostring(depend)+3 or #tostring(depend) ~= #tostring(jmpdepend) then 
                report(6,'wtf is this jmp func')
            end 
            --replace with grabTime with data
            if prev ~= 123123 or #tostring(prev) ~= #tostring(123123) then 
                report(6,'wtf is this jmp func')
            end 
            if vcheck ~= 4 or #tostring(vcheck) ~= 1 or #tostring(vcheck)+3 ~= (depend) then 
                report(6,'wtf is this jmp func')
            end
            jmpcheck2 = true
            return 'change this to time3'
        end,
        func3=function(jkey,depend,func1res,func2res,vcheck)
            if jkey ~= jmpkeyy then 
                report(6,'wtf is this jmp func')
            end 
            if depend ~= jmpdepend or depend ~= #tostring(depend)+3 or #tostring(depend) ~= #tostring(jmpdepend) then 
                report(6,'wtf is this jmp func')
            end 
            --replace with grabTime with data
            if func2res ~= 'change this to time3' or #tostring(func2res) ~= #tostring('change this to time3') then 
                report(6,'wtf is this jmp func')
            end 
            if func1res ~= 123123 or #tostring(func1res) ~= #tostring(123123) then 
                report(6,'wtf is this jmp func')
            end 
            if vcheck ~= 4 or #tostring(vcheck) ~= 1 or #tostring(vcheck)+3 ~= (depend) then 
                report(6,'wtf is this jmp func')
            end
            jmpcheck3 = true
            --eq func2res with time3 and checkauth resu
            return {check4=jmpcheck4,check5=57934852,jmp3=function(bool)if bool ~= false then report(6,'wtf is this jmp') else return true end end,jtuseh = game:GetService("TweenService"),fihsefuhh = game:GetService("Players").LocalPlayer,fhiac=game:GetService("UserInputService"),ojh2oa=game:GetService("Players").LocalPlayer:GetMouse()}
        end
    }end},
}
function wtf_is_this_jmp(str)
    StringValue = Create("StringValue",{Parent=folder,Value=str,Name="JMP"})
    ffs = folder:FindFirstChild("JMP")
    if ffs == StringValue then 
        if folder:FindFirstChildWhichIsA("StringValue") == StringValue then 
            if ffs.Value == str then 
                if (#ffs.Value == 10 and jmpdepend == 1) or (#ffs.Value == 20 and jmpdepend == 2) or (#ffs.Value == 30 and jmpdepend == 3) or (#ffs.Value == 40 and jmpdepend == 4) then 
                        d = wtf_is_this_table[jmpdepend][ffs.Value]()
                        StringValue:Destroy()
                        jmpkey=nil
                        return d
                else 
                    report(6,'wtf is this jmp')
                    return false
                end
            else 
                report(6,'wtf is this jmp')
                return false
            end
        else 
            report(6,'wtf is this jmp')
            return false
        end
    else 
        report(6,'wtf is this jmp')
        return false
    end
end
--// Other Checks
--// Check Whitelist
local body = get(host .. '/sanity.lua')

expectedBody = tostring(os.time())
expectedBody = expectedBody:sub(1, -4)
print('san2')
repeat wait() until body ~= ''
if not (tonumber(body) == tonumber(expectedBody)) then
    local a = false
    repeat wait() until a == true
end
bool = true
WBool1 = false
WBool2 = false
data = grabData()
if beta == true then 
    res1 = get(host .. '/checkauthentication.lua?beta=true&Key='..Key..'&ID='..getreg().ID..'&Data='..Base64.Encode(tostring(data)))
elseif private == true then 
    res1 = get(host .. '/checkauthentication.lua?private=true&Key='..Key..'&ID='..getreg().ID..'&Data='..Base64.Encode(tostring(data)))
else 
    res1 = get(host .. '/checkauthentication.lua?Key='..Key..'&ID='..getreg().ID..'&Data='..Base64.Encode(tostring(data)))
end
local time3 = grabTime(3.7)+data
resTime = tostring(os.time())
resTime = resTime:sub(1, -4)
if res1 == '' then
    bool = false
    repeat wait() until bool 
elseif res1 == 'Beta Script Disabled' then 
    bool = false
    repeat wait() until bool
elseif res1 == 'Script Disabled' then 
    bool = false
    repeat wait() until bool
elseif res1 == "Invalid ID" then 
    bool = false
    repeat wait() until bool
elseif res1 == "Invalid Key" then 
    bool = false
    repeat wait() until bool
elseif res1 == 'Invalid HWID' then 
    bool = false
    repeat wait() until bool
end
res1 = HttpService:JSONDecode(res1)
if resTime ~= res1.signature then 
    data = grabData()
    if beta == true then 
        res1 = get(host .. '/checkauthentication.lua?beta&Key='..Key..'&ID='..getreg().ID..'&Data='..Base64.Encode(tostring(data)))
    elseif private == true then 
        res1 = get(host .. '/checkauthentication.lua?private=true&Key='..Key..'&ID='..getreg().ID..'&Data='..Base64.Encode(tostring(data)))
    else 
        res1 = get(host .. '/checkauthentication.lua?Key='..Key..'&ID='..getreg().ID..'&Data='..Base64.Encode(tostring(data)))
    end
    time3 = grabTime(3.7)+data
    res1 = HttpService:JSONDecode(res1)
end
time3 = tostring(time3)
Verify(time3,grabVerification())
WBool1 = true
Verify(1,grabVerification())
wtfjmptext = ('a'):rep(5)
if eq(time3,tostring(Base64.Decode(res1.data)),true) then
    WBool2 = true
    checkVerify(1,true)
    checkVerify(2,true)
    checkVerify(tostring(Base64.Decode(tostring(res1.data))),true)
    jmp(WBool1)
    jmp(WBool2)
    a = wtf_is_this_jmp(('a'):rep(jmpdepend*10))
    b = a.func1(a.jmpkey,jmpdepend)
    c = a.func2(a.jmpkey,jmpdepend,b,4)
    d = a.func3(a.jmpkey,jmpdepend,b,c,4)
    time = tostring(tick() - start)
    time = time:sub(1, -12)
    time = time .. "s"
    warn("[VOID] Authenticated in " .. time)
    local a = EndVerify()

	local TweenService = d.jtuseh
	local UserInputService = d.fhiac
	local Players = game:GetService("Players")
	local player = d.fihsefuhh
	local Mouse = d.ojh2oa
	local RunService = game:GetService("RunService")
	local TextService = game:GetService("TextService")
	local PathfindingService = game:GetService("PathfindingService")
	local Http = game:GetService("HttpService")
	local TeleportService = game:GetService("TeleportService")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local library = {}

	local floor = math.floor 
	local clamp = math.clamp 
	local ceil = math.ceil 
	local pi = math.pi
	local atan2 = math.atan2
	local rad = math.rad
	local huge = math.huge

	if not getgenv().PSEnabled then 
		getgenv().PSEnabled = false
	end 

	if not getgenv().PSOutput then 
		getgenv().PSOutput = "File"
	end 

	if not getgenv().PSFileName then 
		getgenv().PSFileName = "codes"
	end 

	if not getgenv().PSWebhook then 
		getgenv().PSWebhook = ""
	end

	local function upload_code(Webhook, code)
		local resp = syn.request({
			Url = Webhook;
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = game:GetService("HttpService"):JSONEncode({
				username = "Neighborhood Finder",
				embeds = {{
					title = "New Neighborhood Found";
					fields = {
						{
							name = "Code";
							value = code
						}
					}
				}}
			})
		})
	end

	local function CodeFarm(Output, FileName, Webhook)
		repeat wait() until game:IsLoaded()
		repeat wait() until player.PlayerGui:FindFirstChild("MainGUI") and player.PlayerGui.MainGUI:FindFirstChild("IsLoaded")

		syn.queue_on_teleport([[
			getgenv().PSEnabled = ]]..tostring(getgenv().PSEnabled)..[[
			
			getgenv().PSOutput = ']]..tostring(getgenv().PSOutput)..[['
		
			getgenv().PSFileName = ']]..tostring(getgenv().PSFileName)..[['
			
			getgenv().PSWebhook = ']]..tostring(getgenv().PSWebhook)..[['
			
			shared.whitelist_key = ']]..shared.whitelist_key..[[';
			local content = game:HttpGet("https://sor.cool/whitelist/getfile.lua?ID=]]..getreg().ID..[[&type=script")
			assert(loadstring(content))()
		]])
		
		local startindex = 10000

		local function TeleportToRandomServer()
			local data
			repeat
				data = game:HttpGet("https://bloxburg.sexy/getRobloxServer.php?startIndex="..tostring(startindex))
				startindex = startindex + 1
				wait()
			until data ~= "" and data ~= "None"
			TeleportService:TeleportToPlaceInstance(185655149, data)
		end

		if Output == "File" and not isfile(FileName..".txt") then 
			writefile(FileName..".txt", "")
		end

		player.OnTeleport:connect(function(state)
			if state == Enum.TeleportState.Failed then 
				TeleportToRandomServer()
			end
		end)

		for i,v in next, ReplicatedStorage.Stats:GetChildren() do 
			if v.Name ~= player.Name then
				local PrivateServer = v.PrivateServer
				if PrivateServer.RenewTime.Value > os.time() and PrivateServer.JoinPermission.Value == 0 then
					if Output == "File" then
						appendfile(FileName..".txt", v.Name.."\n")
					elseif Output == "Webhook" then
						upload_code(Webhook, v.Name)
					end
				end 
			end
		end

		TeleportToRandomServer()
	end

	if PSEnabled == true then
		CodeFarm(PSOutput, PSFileName, PSWebhook)
		return
	end

	local function tweenObject(object, data, time)
		local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
		local tween = TweenService:Create(object, tweenInfo, data)
		tween:Play()
		return tween
	end

	function library:Window(TitleWhite, TitleBlue)
		if game.CoreGui:FindFirstChild("BloxburgUi") then
			game.CoreGui:FindFirstChild("BloxburgUi"):Destroy()
		end
		local BloxburgUi = Instance.new("ScreenGui")
		local MainUIFrame = Instance.new("ImageLabel")
		local Cool = Instance.new("ImageLabel")
		local BloxburgCool = Instance.new("Frame")
		local TabsHolder = Instance.new("ImageLabel")
		local UIListLayout = Instance.new("UIListLayout")
		local UIPadding = Instance.new("UIPadding")
		local BloxburgTitle1 = Instance.new("Frame")
		local BloxburgTitle = Instance.new("TextLabel")
		local BloxburgHubTitle = Instance.new("TextLabel")
		BloxburgUi.Name = "BloxburgUi"
		BloxburgUi.Parent = game:GetService("CoreGui")
		BloxburgUi.DisplayOrder = 1
		MainUIFrame.Name = "MainUIFrame"
		MainUIFrame.Parent = BloxburgUi
		MainUIFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		MainUIFrame.BackgroundTransparency = 1.000
		MainUIFrame.Position = UDim2.new(0.252025217, 0, 0.226720661, 0)
		MainUIFrame.Size = UDim2.new(0, 551, 0, 404)
		MainUIFrame.Image = "rbxassetid://3570695787"
		MainUIFrame.ImageColor3 = Color3.fromRGB(22, 22, 22)
		MainUIFrame.ScaleType = Enum.ScaleType.Slice
		MainUIFrame.SliceCenter = Rect.new(100, 100, 100, 100)
		MainUIFrame.SliceScale = 0.050
		Cool.Name = "Cool"
		Cool.Parent = MainUIFrame
		Cool.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Cool.BackgroundTransparency = 1.000
		Cool.Position = UDim2.new(0.06, 0, 0.04, 0)
		Cool.Size = UDim2.new(0, 65, 0, 65)
		Cool.ZIndex = 2
		Cool.Image = "rbxassetid://166652117"
		BloxburgCool.Name = "BloxburgCool"
		BloxburgCool.Parent = MainUIFrame
		BloxburgCool.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
		BloxburgCool.BorderSizePixel = 0
		BloxburgCool.Size = UDim2.new(0, 125, 0, 97)
		TabsHolder.Name = "TabsHolder"
		TabsHolder.Parent = MainUIFrame
		TabsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabsHolder.BackgroundTransparency = 1.000
		TabsHolder.Position = UDim2.new(0, 0, 0.240099013, 0)
		TabsHolder.Size = UDim2.new(0, 125, 0, 307)
		TabsHolder.Image = "rbxassetid://3570695787"
		TabsHolder.ImageColor3 = Color3.fromRGB(24, 24, 24)
		TabsHolder.ScaleType = Enum.ScaleType.Slice
		TabsHolder.SliceCenter = Rect.new(100, 100, 100, 100)
		TabsHolder.SliceScale = 0.050
		BloxburgTitle1.Name = "BloxburgTitle"
		BloxburgTitle1.Parent = MainUIFrame
		BloxburgTitle1.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
		BloxburgTitle1.BorderSizePixel = 0
		BloxburgTitle1.Position = UDim2.new(0.226860255, 0, 0, 0)
		BloxburgTitle1.Size = UDim2.new(0, 426, 0, 35)
		BloxburgTitle.Name = "BloxburgTitle"
		BloxburgTitle.Parent = BloxburgTitle1
		BloxburgTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		BloxburgTitle.BackgroundTransparency = 1.000
		BloxburgTitle.BorderColor3 = Color3.fromRGB(27, 42, 53)
		BloxburgTitle.Position = UDim2.new(0.0140845068, 0, 0, 0)
		BloxburgTitle.Size = UDim2.new(0, 420, 0, 35)
		BloxburgTitle.Font = Enum.Font.GothamBold
		BloxburgTitle.Text = TitleWhite
		BloxburgTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
		BloxburgTitle.TextSize = 15.000
		BloxburgTitle.TextXAlignment = Enum.TextXAlignment.Left
		BloxburgHubTitle.Name = "BloxburgHubTitle"
		BloxburgHubTitle.Parent = BloxburgTitle
		BloxburgHubTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		BloxburgHubTitle.BackgroundTransparency = 1.000
		BloxburgHubTitle.Position = UDim2.new(0.165, 0, 0, 0)
		BloxburgHubTitle.Size = UDim2.new(0, 372, 0, 35)
		BloxburgHubTitle.Font = Enum.Font.GothamBold
		BloxburgHubTitle.Text = TitleBlue
		BloxburgHubTitle.TextColor3 = Color3.fromRGB(84, 116, 224)
		BloxburgHubTitle.TextSize = 15.000
		BloxburgHubTitle.TextXAlignment = Enum.TextXAlignment.Left
		UIListLayout.Parent = TabsHolder
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIPadding.Parent = TabsHolder
		local MainUITabPickedHolder = Instance.new("Frame")
		MainUITabPickedHolder.Name = "MainUITabPickedHolder"
		MainUITabPickedHolder.Parent = MainUIFrame
		MainUITabPickedHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		MainUITabPickedHolder.BackgroundTransparency = 1.000
		MainUITabPickedHolder.Position = UDim2.new(0.226860255, 0, 0.0866336599, 0)
		MainUITabPickedHolder.Size = UDim2.new(0, 426, 0, 369)
		local connections = {}

		MainUIFrame.InputBegan:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				local InitialPos = input.Position
				local InitialFramePos = MainUIFrame.Position
				connections.MouseMoved = UserInputService.InputChanged:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement then
						local delta = input.Position - InitialPos
						tweenObject(MainUIFrame, {
							Position = UDim2.new(InitialFramePos.X.Scale, InitialFramePos.X.Offset + delta.X, InitialFramePos.Y.Scale, InitialFramePos.Y.Offset + delta.Y)
						}, 0.1)
					end
				end)
				MainUIFrame.InputEnded:connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						connections.MouseMoved:Disconnect()
					end
				end)
			end
		end)

		local opened = true

		UserInputService.InputBegan:Connect(function(input)
			if input.KeyCode == Enum.KeyCode.RightControl then
				if opened == true then
					if MainUIFrame.Parent ~= nil then
						MainUIFrame.ClipsDescendants = true
						MainUIFrame:TweenSize(UDim2.new(0, 0, 0, 404), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.5, true)
						opened = false
						wait(0.5)
					end
				elseif opened == false then
					if MainUIFrame.Parent ~= nil then
						MainUIFrame:TweenSize(UDim2.new(0, 551, 0, 404), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.5, true)
						opened = true
						wait(0.5)
						MainUIFrame.ClipsDescendants = false
					end
				end
			end
		end)

		local window = {}
		function window:Notification(Type, content, callback)
			if Type == "Message" then
				local NotificationMain = Instance.new("ImageLabel")
				local NotificationDropShadow = Instance.new("ImageLabel")
				local NotificationTitleHodler = Instance.new("Frame")
				local NotificationTitle = Instance.new("TextLabel")
				local NotificationCool = Instance.new("ImageLabel")
				local NotificationText = Instance.new("TextLabel")
				local NotificationOkay = Instance.new("TextButton")
				NotificationMain.Name = "NotificationMain"
				NotificationMain.Parent = BloxburgUi
				NotificationMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NotificationMain.BackgroundTransparency = 1.000
				NotificationMain.Position = UDim2.new(-0.3, 0, 0.775, 0)
				tweenObject(NotificationMain, {
					Position = UDim2.new(0.015, 0, 0.775, 0)
				}, 0.5)
				NotificationMain.Size = UDim2.new(0, 268, 0, 124)
				NotificationMain.Image = "rbxassetid://3570695787"
				NotificationMain.ImageColor3 = Color3.fromRGB(22, 22, 22)
				NotificationMain.ScaleType = Enum.ScaleType.Slice
				NotificationMain.SliceCenter = Rect.new(100, 100, 100, 100)
				NotificationMain.SliceScale = 0.050
				NotificationDropShadow.Name = "NotificationDropShadow"
				NotificationDropShadow.Parent = NotificationMain
				NotificationDropShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NotificationDropShadow.BackgroundTransparency = 1.000
				NotificationDropShadow.Position = UDim2.new(-0.315028518, 0, -0.540322602, 0)
				NotificationDropShadow.Size = UDim2.new(0, 442, 0, 258)
				NotificationDropShadow.ZIndex = -1
				NotificationDropShadow.Image = "rbxassetid://5089202498"
				NotificationTitleHodler.Name = "NotificationTitleHodler"
				NotificationTitleHodler.Parent = NotificationMain
				NotificationTitleHodler.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				NotificationTitleHodler.BorderSizePixel = 0
				NotificationTitleHodler.Size = UDim2.new(0, 268, 0, 31)
				NotificationTitle.Name = "NotificationTitle"
				NotificationTitle.Parent = NotificationTitleHodler
				NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NotificationTitle.BackgroundTransparency = 1.000
				NotificationTitle.Position = UDim2.new(0.0261194035, 0, 0, 0)
				NotificationTitle.Size = UDim2.new(0, 261, 0, 31)
				NotificationTitle.Font = Enum.Font.GothamSemibold
				NotificationTitle.Text = "Notification"
				NotificationTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
				NotificationTitle.TextSize = 14.000
				NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left
				NotificationCool.Name = "NotificationCool"
				NotificationCool.Parent = NotificationTitleHodler
				NotificationCool.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NotificationCool.BackgroundTransparency = 1.000
				NotificationCool.Position = UDim2.new(0.914178967, 0, 0.225806445, 0)
				NotificationCool.Size = UDim2.new(0, 17, 0, 17)
				NotificationCool.Image = "rbxgameasset://Images/w"
				NotificationText.Name = "NotificationText"
				NotificationText.Parent = NotificationMain
				NotificationText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NotificationText.BackgroundTransparency = 1.000
				NotificationText.Position = UDim2.new(-0.0037313432, 0, 0.25, 0)
				NotificationText.Size = UDim2.new(0, 268, 0, 66)
				NotificationText.ZIndex = 2
				NotificationText.Font = Enum.Font.GothamSemibold
				NotificationText.Text = content.Text
				NotificationText.TextColor3 = Color3.fromRGB(233, 233, 233)
				NotificationText.TextSize = 14.000
				NotificationOkay.Name = "NotificationOkay"
				NotificationOkay.Parent = NotificationMain
				NotificationOkay.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				NotificationOkay.BorderSizePixel = 0
				NotificationOkay.Position = UDim2.new(0.0223880596, 0, 0.782258093, 0)
				NotificationOkay.Size = UDim2.new(0, 256, 0, 21)
				NotificationOkay.Font = Enum.Font.GothamSemibold
				NotificationOkay.Text = content.ConfirmText
				NotificationOkay.TextColor3 = Color3.fromRGB(233, 233, 233)
				NotificationOkay.TextSize = 13.000
				NotificationOkay.MouseButton1Click:connect(function()
					tweenObject(NotificationMain, {
						Position = UDim2.new(-0.3, 0, 0.775, 0)
					}, 0.5)
					wait(0.5)
					NotificationMain:Destroy()
				end)
			elseif Type == "Error" then
				local ErrorMain = Instance.new("ImageLabel")
				local ErrorDropShadow = Instance.new("ImageLabel")
				local ErrorTitleHolder = Instance.new("Frame")
				local ErrorTitle = Instance.new("TextLabel")
				local ErrorBad = Instance.new("ImageLabel")
				local ErrorText = Instance.new("TextLabel")
				local ErrorOkay = Instance.new("TextButton")
				ErrorMain.Name = "ErrorMain"
				ErrorMain.Parent = BloxburgUi
				ErrorMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ErrorMain.BackgroundTransparency = 1.000
				ErrorMain.Position = UDim2.new(-0.3, 0, 0.775, 0)
				tweenObject(ErrorMain, {
					Position = UDim2.new(0.015, 0, 0.775, 0)
				}, 0.5)
				ErrorMain.Size = UDim2.new(0, 268, 0, 124)
				ErrorMain.Image = "rbxassetid://3570695787"
				ErrorMain.ImageColor3 = Color3.fromRGB(22, 22, 22)
				ErrorMain.ScaleType = Enum.ScaleType.Slice
				ErrorMain.SliceCenter = Rect.new(100, 100, 100, 100)
				ErrorMain.SliceScale = 0.050
				ErrorDropShadow.Name = "ErrorDropShadow"
				ErrorDropShadow.Parent = ErrorMain
				ErrorDropShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ErrorDropShadow.BackgroundTransparency = 1.000
				ErrorDropShadow.Position = UDim2.new(-0.315028518, 0, -0.540322602, 0)
				ErrorDropShadow.Size = UDim2.new(0, 442, 0, 258)
				ErrorDropShadow.ZIndex = -1
				ErrorDropShadow.Image = "rbxassetid://5089202498"
				ErrorTitleHolder.Name = "ErrorTitleHolder"
				ErrorTitleHolder.Parent = ErrorMain
				ErrorTitleHolder.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				ErrorTitleHolder.BorderSizePixel = 0
				ErrorTitleHolder.Size = UDim2.new(0, 268, 0, 31)
				ErrorTitle.Name = "ErrorTitle"
				ErrorTitle.Parent = ErrorTitleHolder
				ErrorTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ErrorTitle.BackgroundTransparency = 1.000
				ErrorTitle.Position = UDim2.new(0.0261194035, 0, 0, 0)
				ErrorTitle.Size = UDim2.new(0, 261, 0, 31)
				ErrorTitle.Font = Enum.Font.GothamSemibold
				ErrorTitle.Text = "ERROR"
				ErrorTitle.TextColor3 = Color3.fromRGB(233, 58, 53)
				ErrorTitle.TextSize = 14.000
				ErrorTitle.TextXAlignment = Enum.TextXAlignment.Left
				ErrorBad.Name = "ErrorBad"
				ErrorBad.Parent = ErrorTitleHolder
				ErrorBad.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ErrorBad.BackgroundTransparency = 1.000
				ErrorBad.Position = UDim2.new(0.914178848, 0, 0.225806445, 0)
				ErrorBad.Size = UDim2.new(0, 17, 0, 17)
				ErrorBad.Image = "rbxgameasset://Images/d"
				ErrorBad.ImageColor3 = Color3.fromRGB(233, 58, 53)
				ErrorText.Name = "ErrorText"
				ErrorText.Parent = ErrorMain
				ErrorText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ErrorText.BackgroundTransparency = 1.000
				ErrorText.Position = UDim2.new(-0.0037313432, 0, 0.25, 0)
				ErrorText.Size = UDim2.new(0, 268, 0, 66)
				ErrorText.ZIndex = 2
				ErrorText.Font = Enum.Font.GothamSemibold
				ErrorText.Text = content.Text
				ErrorText.TextColor3 = Color3.fromRGB(233, 233, 233)
				ErrorText.TextSize = 14.000
				ErrorOkay.Name = "ErrorOkay"
				ErrorOkay.Parent = ErrorMain
				ErrorOkay.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				ErrorOkay.BorderSizePixel = 0
				ErrorOkay.Position = UDim2.new(0.0223880596, 0, 0.782258093, 0)
				ErrorOkay.Size = UDim2.new(0, 256, 0, 21)
				ErrorOkay.Font = Enum.Font.GothamSemibold
				ErrorOkay.Text = content.ConfirmText
				ErrorOkay.TextColor3 = Color3.fromRGB(233, 233, 233)
				ErrorOkay.TextSize = 13.000
				ErrorOkay.MouseButton1Click:connect(function()
					tweenObject(ErrorMain, {
						Position = UDim2.new(-0.3, 0, 0.775, 0)
					}, 0.5)
					wait(0.5)
					ErrorMain:Destroy()
				end)
			elseif Type == "Confirm" then
				local NotificationMain = Instance.new("ImageLabel")
				local NotificationDropShadow = Instance.new("ImageLabel")
				local NotificationTitleHodler = Instance.new("Frame")
				local NotificationTitle = Instance.new("TextLabel")
				local NotificationCool = Instance.new("ImageLabel")
				local NotificationText = Instance.new("TextLabel")
				local NotificationYes = Instance.new("TextButton")
				local NotificationNo = Instance.new("TextButton")
				NotificationMain.Name = "NotificationMain"
				NotificationMain.Parent = BloxburgUi
				NotificationMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NotificationMain.BackgroundTransparency = 1.000
				NotificationMain.Position = UDim2.new(-0.3, 0, 0.775, 0)
				NotificationMain.Size = UDim2.new(0, 268, 0, 124)
				NotificationMain.Image = "rbxassetid://3570695787"
				NotificationMain.ImageColor3 = Color3.fromRGB(22, 22, 22)
				NotificationMain.ScaleType = Enum.ScaleType.Slice
				NotificationMain.SliceCenter = Rect.new(100, 100, 100, 100)
				NotificationMain.SliceScale = 0.050
				tweenObject(NotificationMain, {
					Position = UDim2.new(0.015, 0, 0.775, 0)
				}, 0.5)
				NotificationDropShadow.Name = "NotificationDropShadow"
				NotificationDropShadow.Parent = NotificationMain
				NotificationDropShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NotificationDropShadow.BackgroundTransparency = 1.000
				NotificationDropShadow.Position = UDim2.new(-0.315028518, 0, -0.540322602, 0)
				NotificationDropShadow.Size = UDim2.new(0, 442, 0, 258)
				NotificationDropShadow.ZIndex = -1
				NotificationDropShadow.Image = "rbxassetid://5089202498"
				NotificationTitleHodler.Name = "NotificationTitleHodler"
				NotificationTitleHodler.Parent = NotificationMain
				NotificationTitleHodler.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				NotificationTitleHodler.BorderSizePixel = 0
				NotificationTitleHodler.Size = UDim2.new(0, 268, 0, 31)
				NotificationTitle.Name = "NotificationTitle"
				NotificationTitle.Parent = NotificationTitleHodler
				NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NotificationTitle.BackgroundTransparency = 1.000
				NotificationTitle.Position = UDim2.new(0.0261194035, 0, 0, 0)
				NotificationTitle.Size = UDim2.new(0, 261, 0, 31)
				NotificationTitle.Font = Enum.Font.GothamSemibold
				NotificationTitle.Text = "Confirm"
				NotificationTitle.TextColor3 = Color3.fromRGB(88, 170, 205)
				NotificationTitle.TextSize = 14.000
				NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left
				NotificationCool.Name = "NotificationCool"
				NotificationCool.Parent = NotificationTitleHodler
				NotificationCool.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NotificationCool.BackgroundTransparency = 1.000
				NotificationCool.Position = UDim2.new(0.914178967, 0, 0.225806445, 0)
				NotificationCool.Size = UDim2.new(0, 17, 0, 17)
				NotificationCool.Image = "rbxgameasset://Images/w"
				NotificationText.Name = "NotificationText"
				NotificationText.Parent = NotificationMain
				NotificationText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NotificationText.BackgroundTransparency = 1.000
				NotificationText.Position = UDim2.new(-0.0037313432, 0, 0.25, 0)
				NotificationText.Size = UDim2.new(0, 268, 0, 66)
				NotificationText.ZIndex = 2
				NotificationText.Font = Enum.Font.GothamSemibold
				NotificationText.Text = content.Text
				NotificationText.TextColor3 = Color3.fromRGB(233, 233, 233)
				NotificationText.TextSize = 14.000
				NotificationYes.Name = "NotificationYes"
				NotificationYes.Parent = NotificationMain
				NotificationYes.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				NotificationYes.BorderSizePixel = 0
				NotificationYes.Position = UDim2.new(0.0223880596, 0, 0.782258093, 0)
				NotificationYes.Size = UDim2.new(0, 128, 0, 21)
				NotificationYes.Font = Enum.Font.GothamSemibold
				NotificationYes.Text = "Yes"
				NotificationYes.TextColor3 = Color3.fromRGB(0, 255, 0)
				NotificationYes.TextSize = 13.000
				NotificationNo.Name = "NotificationNo"
				NotificationNo.Parent = NotificationMain
				NotificationNo.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				NotificationNo.BorderSizePixel = 0
				NotificationNo.Position = UDim2.new(0.5, 0, 0.782258093, 0)
				NotificationNo.Size = UDim2.new(0, 128, 0, 21)
				NotificationNo.Font = Enum.Font.GothamSemibold
				NotificationNo.Text = "No"
				NotificationNo.TextColor3 = Color3.fromRGB(233, 0, 0)
				NotificationNo.TextSize = 13.000
				NotificationYes.MouseButton1Click:Connect(function()
					tweenObject(NotificationMain, {
						Position = UDim2.new(-0.3, 0, 0.775, 0)
					}, 0.5)
					wait(0.5)
					NotificationMain:Destroy()
					NotificationMain = nil
					if callback then
						callback(true)
					end
				end)
				NotificationNo.MouseButton1Click:Connect(function()
					tweenObject(NotificationMain, {
						Position = UDim2.new(-0.3, 0, 0.775, 0)
					}, 0.5)
					wait(0.5)
					NotificationMain:Destroy()
					NotificationMain = nil
					if callback then
						callback(false)
					end
				end)
			end
		end
		local activeTab = nil
		local activeTabFrame = nil
		function window:Tab(name)
			local TabSelected = Instance.new("TextButton")
			local TabTOpFrame = Instance.new("Frame")
			local TabBottomFrame = Instance.new("Frame")
			local MainUITabPicked = Instance.new("ScrollingFrame")
			TabSelected.Name = "TabSelected"
			TabSelected.Parent = TabsHolder
			TabSelected.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
			TabSelected.BorderSizePixel = 0
			TabSelected.Size = UDim2.new(0, 125, 0, 30)
			TabSelected.AutoButtonColor = false
			TabSelected.Font = Enum.Font.GothamSemibold
			TabSelected.Text = name
			TabSelected.TextColor3 = Color3.fromRGB(66, 66, 66)
			TabSelected.TextSize = 13.000
			TabTOpFrame.Name = "TabTOpFrame"
			TabTOpFrame.Parent = TabSelected
			TabTOpFrame.BackgroundColor3 = Color3.fromRGB(84, 116, 224)
			TabTOpFrame.BorderColor3 = Color3.fromRGB(84, 116, 224)
			TabTOpFrame.BorderSizePixel = 0
			TabTOpFrame.Size = UDim2.new(0, 125, 0, 1)
			TabTOpFrame.BackgroundTransparency = 1
			TabBottomFrame.Name = "TabBottomFrame"
			TabBottomFrame.Parent = TabSelected
			TabBottomFrame.BackgroundColor3 = Color3.fromRGB(84, 116, 224)
			TabBottomFrame.BorderColor3 = Color3.fromRGB(84, 116, 224)
			TabBottomFrame.BorderSizePixel = 0
			TabBottomFrame.Position = UDim2.new(0, 0, 0.966666639, 0)
			TabBottomFrame.Size = UDim2.new(0, 125, 0, 1)
			TabBottomFrame.BackgroundTransparency = 1
			local UIListLayout_2 = Instance.new("UIListLayout")
			local UIPadding_2 = Instance.new("UIPadding")
			MainUITabPicked.Name = "MainUITabPicked"
			MainUITabPicked.Parent = MainUITabPickedHolder
			MainUITabPicked.CanvasSize = UDim2.new(0, 0, 0, 0)
			MainUITabPicked.Active = true
			MainUITabPicked.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			MainUITabPicked.BackgroundTransparency = 1.000
			MainUITabPicked.Size = UDim2.new(0, 426, 0, 369)
			MainUITabPicked.ScrollBarThickness = 2
			MainUITabPicked.Visible = false
			UIListLayout_2.Parent = MainUITabPicked
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_2.Padding = UDim.new(0, 8)
			UIPadding_2.Parent = MainUITabPicked
			UIPadding_2.PaddingLeft = UDim.new(0, 8)
			UIPadding_2.PaddingTop = UDim.new(0, 8)
			if activeTab == nil then
				MainUITabPicked.Visible = true
				activeTabFrame = MainUITabPicked
				tweenObject(TabSelected, {
					BackgroundColor3 = Color3.fromRGB(17, 17, 30)
				}, 0.5)
				tweenObject(TabSelected, {
					TextColor3 = Color3.fromRGB(84, 116, 224)
				}, 0.5)
				activeTab = TabSelected
				tweenObject(TabBottomFrame, {
					BackgroundTransparency = 0
				}, 0.5)
				tweenObject(TabTOpFrame, {
					BackgroundTransparency = 0
				}, 0.5)
			end
			TabSelected.MouseButton1Click:Connect(function()
				tweenObject(activeTab.TabBottomFrame, {
					BackgroundTransparency = 1
				}, 0.5)
				tweenObject(activeTab.TabTOpFrame, {
					BackgroundTransparency = 1
				}, 0.5)
				tweenObject(activeTab, {
					BackgroundColor3 = Color3.fromRGB(24, 24, 24)
				}, 0.5)
				tweenObject(activeTab, {
					TextColor3 = Color3.fromRGB(66, 66, 66)
				}, 0.5)
				activeTabFrame.Visible = false
				activeTab = TabSelected
				activeTabFrame = MainUITabPicked
				MainUITabPicked.Visible = true
				tweenObject(TabSelected, {
					BackgroundColor3 = Color3.fromRGB(17, 17, 30)
				}, 0.5)
				tweenObject(TabSelected, {
					TextColor3 = Color3.fromRGB(84, 116, 224)
				}, 0.5)
				tweenObject(TabBottomFrame, {
					BackgroundTransparency = 0
				}, 0.5)
				tweenObject(TabTOpFrame, {
					BackgroundTransparency = 0
				}, 0.5)
			end)
			local tab = {}
			local tabSize = 39
			local function ResizeTab()
				MainUITabPicked.CanvasSize = UDim2.new(0, 0, 0, tabSize)
			end

			function tab:Section(name)
				local SectionBack = Instance.new("ImageLabel")
				local SectionTitleBack = Instance.new("Frame")
				local SectionTitle = Instance.new("TextLabel")
				local SectionFrame = Instance.new("Frame")
				local UIListLayout_3 = Instance.new("UIListLayout")
				local UIPadding_3 = Instance.new("UIPadding")
				local UIListLayout_4 = Instance.new("UIListLayout")
				SectionBack.Name = "Section Back"
				SectionBack.Parent = MainUITabPicked
				SectionBack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SectionBack.BackgroundTransparency = 1.000
				SectionBack.Position = UDim2.new(0.018779343, 0, -0.978319764, 0)
				SectionBack.Size = UDim2.new(0, 403, 0, 31)
				SectionBack.Image = "rbxassetid://3570695787"
				SectionBack.ImageColor3 = Color3.fromRGB(15, 15, 15)
				SectionBack.ScaleType = Enum.ScaleType.Slice
				SectionBack.SliceCenter = Rect.new(100, 100, 100, 100)
				SectionBack.SliceScale = 0.050

				UIListLayout_4.Parent = SectionBack
				UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
				SectionTitleBack.Name = "SectionTitleBack"
				SectionTitleBack.Parent = SectionBack
				SectionTitleBack.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				SectionTitleBack.BorderSizePixel = 0
				SectionTitleBack.Size = UDim2.new(0, 403, 0, 31)
				SectionTitle.Name = "SectionTitle"
				SectionTitle.Parent = SectionTitleBack
				SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SectionTitle.BackgroundTransparency = 1.000
				SectionTitle.Position = UDim2.new(0.0148883378, 0, 0, 0)
				SectionTitle.Size = UDim2.new(0, 397, 0, 31)
				SectionTitle.Font = Enum.Font.GothamSemibold
				SectionTitle.Text = name
				SectionTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
				SectionTitle.TextSize = 14.000
				SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
				SectionFrame.Name = "SectionFrame"
				SectionFrame.Parent = SectionBack
				SectionFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SectionFrame.BackgroundTransparency = 1.000
				SectionFrame.BorderSizePixel = 0
				SectionFrame.Position = UDim2.new(0, 0, 0.0775000006, 0)
				SectionFrame.Size = UDim2.new(0, 403, 0, 0)
				UIListLayout_3.Parent = SectionFrame
				UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_3.Padding = UDim.new(0, 8)
				UIPadding_3.Parent = SectionFrame
				UIPadding_3.PaddingLeft = UDim.new(0, 8)
				UIPadding_3.PaddingTop = UDim.new(0, 8)
				
				--tabSize = tabSize +
				tabSize = tabSize + 41
				ResizeTab()
				local sectionSize = 39
				local function ResizeSection()
					SectionBack.Size = UDim2.new(0, 403, 0, sectionSize)
					SectionFrame.Size = UDim2.new(0, 403, 0, sectionSize - 31)
				end

				local section = {}
				function section:Label(name)
					sectionSize = sectionSize + 39
					tabSize = tabSize + 39
					ResizeTab()
					ResizeSection()
					local LabelBack = Instance.new("Frame")
					local LabelTitle = Instance.new("TextLabel")
					LabelBack.Name = "LabelBack"
					LabelBack.Parent = SectionFrame
					LabelBack.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
					LabelBack.BorderSizePixel = 0
					LabelBack.Position = UDim2.new(0.018779343, 0, 0.233062327, 0)
					LabelBack.Size = UDim2.new(0, 390, 0, 31)
					LabelTitle.Name = "LabelTitle"
					LabelTitle.Parent = LabelBack
					LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					LabelTitle.BackgroundTransparency = 1.000
					LabelTitle.Position = UDim2.new(0.0147783253, 0, 0, 0)
					LabelTitle.Size = UDim2.new(0, 400, 0, 31)
					LabelTitle.Font = Enum.Font.GothamSemibold
					LabelTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
					LabelTitle.TextSize = 13.000
					LabelTitle.Text = name
					LabelTitle.TextXAlignment = Enum.TextXAlignment.Left

					local label = {}
					function label:Update(name)
						LabelTitle.Text = name
					end
					return label
				end
				function section:Slider(name, options, callback)
					sectionSize = sectionSize + 63
					tabSize = tabSize + 63
					ResizeTab()
					ResizeSection()
					local Sliderback = Instance.new("Frame")
					local SliderTitle = Instance.new("TextLabel")
					local SliderBarBack = Instance.new("ImageButton")
					local Sliderhandle = Instance.new("ImageLabel")
					local SliderValueBack = Instance.new("ImageLabel")
					local SliderValue = Instance.new("TextBox")
					local TextButton = Instance.new("TextButton")
					local TextButton_2 = Instance.new("TextButton")

					Sliderback.Name = "Sliderback"
					Sliderback.Parent = SectionFrame
					Sliderback.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
					Sliderback.BorderSizePixel = 0
					Sliderback.Position = UDim2.new(0.018779343, 0, 0.233062327, 0)
					Sliderback.Size = UDim2.new(0, 390, 0, 55)
					TextButton.Parent = Sliderback
					TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextButton.BackgroundTransparency = 1
					TextButton.Position = UDim2.new(0.675, 0, 0.0181818306, 0)
					TextButton.Size = UDim2.new(0, 35, 0, 35)
					TextButton.Font = Enum.Font.Gotham
					TextButton.Text = "-"
					TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextButton.TextSize = 14.000
					TextButton_2.Parent = Sliderback
					TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextButton_2.BackgroundTransparency = 1
					TextButton_2.Position = UDim2.new(0.92, 0, 9.31322575e-09, 0)
					TextButton_2.Size = UDim2.new(0, 35, 0, 35)
					TextButton_2.Font = Enum.Font.Gotham
					TextButton_2.Text = "+"
					TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextButton_2.TextSize = 14.000

					SliderTitle.Name = "SliderTitle"
					SliderTitle.Parent = Sliderback
					SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SliderTitle.BackgroundTransparency = 1.000
					SliderTitle.Position = UDim2.new(0.0147783253, 0, 0, 0)
					SliderTitle.Size = UDim2.new(0, 400, 0, 31)
					SliderTitle.Font = Enum.Font.GothamSemibold
					SliderTitle.Text = name
					SliderTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
					SliderTitle.TextSize = 13.000
					SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
					SliderBarBack.Name = "SliderBarBack"
					SliderBarBack.Parent = Sliderback
					SliderBarBack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SliderBarBack.BackgroundTransparency = 1.000
					SliderBarBack.Position = UDim2.new(0.0147783253, 0, 0.76363641, 0)
					SliderBarBack.Size = UDim2.new(0, 380, 0, 6)
					SliderBarBack.Image = "rbxassetid://3570695787"
					SliderBarBack.ImageColor3 = Color3.fromRGB(77, 77, 77)
					SliderBarBack.ScaleType = Enum.ScaleType.Slice
					SliderBarBack.SliceCenter = Rect.new(100, 100, 100, 100)
					SliderBarBack.SliceScale = 0.050
					Sliderhandle.Name = "Sliderhandle"
					Sliderhandle.Parent = SliderBarBack
					Sliderhandle.BackgroundColor3 = Color3.fromRGB(84, 116, 224)
					Sliderhandle.BackgroundTransparency = 1.000
					Sliderhandle.Size = UDim2.new(0, 0, 0, 6)
					Sliderhandle.Image = "rbxassetid://3570695787"
					Sliderhandle.ImageColor3 = Color3.fromRGB(84, 116, 224)
					Sliderhandle.ScaleType = Enum.ScaleType.Slice
					Sliderhandle.SliceCenter = Rect.new(100, 100, 100, 100)
					Sliderhandle.SliceScale = 0.050
					SliderValueBack.Name = "SliderValueBack"
					SliderValueBack.Parent = Sliderback
					SliderValueBack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SliderValueBack.BackgroundTransparency = 1.000
					SliderValueBack.Position = UDim2.new(0.78, 0, 0.109090909, 0)
					SliderValueBack.Size = UDim2.new(0, 50, 0, 25)
					SliderValueBack.Image = "rbxassetid://3570695787"
					SliderValueBack.ImageColor3 = Color3.fromRGB(14, 14, 14)
					SliderValueBack.ScaleType = Enum.ScaleType.Slice
					SliderValueBack.SliceCenter = Rect.new(100, 100, 100, 100)
					SliderValueBack.SliceScale = 0.050
					SliderValue.Name = "SliderValue"
					SliderValue.Parent = SliderValueBack
					SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SliderValue.BackgroundTransparency = 1.000
					SliderValue.Size = UDim2.new(0, 50, 0, 25)
					SliderValue.Font = Enum.Font.GothamSemibold
					SliderValue.Text = options.default or options.min < 0 and options.max > 0 and "0" or tostring(options.min)
					SliderValue.TextColor3 = Color3.fromRGB(233, 233, 233)
					SliderValue.TextSize = 13.000

					if options.default then
						value = clamp(options.default, options.min, options.max)
						local percent = 1 - ((options.max - value) / (options.max - options.min))
						tweenObject(Sliderhandle, {
							Size = UDim2.new(0, percent * 380, 0, 6)
						}, 0.1)
						manual = true
						SliderValue.Text = tostring(value)
						manual = false
					end

					local value = options.default or options.min;
					local connections = {}
					local manual = false
					TextButton.MouseButton1Click:Connect(function()
						value = clamp(value - 1, options.min, options.max)
						local percent = 1 - ((options.max - value) / (options.max - options.min))
						tweenObject(Sliderhandle, {
							Size = UDim2.new(0, percent * 380, 0, 6)
						}, 0.1)
						manual = true
						SliderValue.Text = tostring(value)
						manual = false
						if callback then
							callback(value)
						end
					end)
					TextButton_2.MouseButton1Click:Connect(function()
						value = clamp(value + 1, options.min, options.max)
						local percent = 1 - ((options.max - value) / (options.max - options.min))
						tweenObject(Sliderhandle, {
							Size = UDim2.new(0, percent * 380, 0, 6)
						}, 0.1)
						manual = true
						SliderValue.Text = tostring(value)
						manual = false
						if callback then
							callback(value)
						end
					end)
					SliderValue:GetPropertyChangedSignal("Text"):Connect(function()
						if not manual then
							if tonumber(SliderValue.Text) ~= nil then
								value = clamp(tonumber(SliderValue.Text), options.min, options.max)
								local percent = 1 - ((options.max - value) / (options.max - options.min))
								tweenObject(Sliderhandle, {
									Size = UDim2.new(0, percent * 380, 0, 6)
								}, 0.1)
								local con
								con = SliderValue.FocusLost:Connect(function()
									con:Disconnect()
									if callback then
										callback(value)
									end
								end)
							end
						end
					end)

					SliderBarBack.MouseButton1Down:Connect(function()
						value = floor((((tonumber(options.max) - tonumber(options.min)) / 380) * Sliderhandle.AbsoluteSize.X) + tonumber(options.min) + 0.5) or 0
						SliderValue.Text = value
						tweenObject(Sliderhandle, {
							Size = UDim2.new(0, clamp(Mouse.X - Sliderhandle.AbsolutePosition.X, 0, 380), 0, 6)
						}, 0.1)
						tweenObject(Sliderhandle, {
							ImageColor3 = Color3.fromRGB(255, 255, 255)
						}, 0.2)
						if callback then
							callback(value)
						end
						connections.MoveConnection = Mouse.Move:Connect(function()
							value = floor((((tonumber(options.max) - tonumber(options.min)) / 380) * Sliderhandle.AbsoluteSize.X) + tonumber(options.min) + 0.5) or 0
							SliderValue.Text = value
							tweenObject(Sliderhandle, {
								Size = UDim2.new(0, clamp(Mouse.X - Sliderhandle.AbsolutePosition.X, 0, 380), 0, 6)
							}, 0.1)
							tweenObject(Sliderhandle, {
								ImageColor3 = Color3.fromRGB(255, 255, 255)
							}, 0.2)
							if callback then
								callback(value)
							end
						end)
						connections.ReleaseConnection = UserInputService.InputEnded:Connect(function(mouse)
							if mouse.UserInputType == Enum.UserInputType.MouseButton1 then
								value = floor((((tonumber(options.max) - tonumber(options.min)) / 380) * Sliderhandle.AbsoluteSize.X) + tonumber(options.min) + 0.5) or 0
								SliderValue.Text = value
								tweenObject(Sliderhandle, {
									Size = UDim2.new(0, clamp(Mouse.X - Sliderhandle.AbsolutePosition.X, 0, 380), 0, 6)
								}, 0.1)
								tweenObject(Sliderhandle, {
									ImageColor3 = Color3.fromRGB(84, 116, 224)
								}, 0.2)
								connections.MoveConnection:Disconnect()
								connections.ReleaseConnection:Disconnect()
								if callback then
									callback(value)
								end
							end
						end)
					end)
					local slider = {}
					function slider:Update(val)
						value = clamp(val, options.min, options.max)
						local percent = 1 - ((options.max - value) / (options.max - options.min))
						tweenObject(Sliderhandle, {
							Size = UDim2.new(0, percent * 380, 0, 6)
						}, 0.1)
						if callback then
							callback(value)
						end
					end
					return slider
				end
				function section:Box(name, callback)
					sectionSize = sectionSize + 39
					tabSize = tabSize + 39
					ResizeTab()
					ResizeSection()
					local TextBoxMain = Instance.new("Frame")
					local TextBoxTitle = Instance.new("TextLabel")
					local TextBox = Instance.new("TextBox")
					local TextBox_Roundify_5px = Instance.new("ImageLabel")
					TextBoxMain.Name = "TextBoxMain"
					TextBoxMain.Parent = SectionFrame
					TextBoxMain.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
					TextBoxMain.BorderColor3 = Color3.fromRGB(27, 42, 53)
					TextBoxMain.BorderSizePixel = 0
					TextBoxMain.Position = UDim2.new(0.018779343, 0, 0.615176141, 0)
					TextBoxMain.Size = UDim2.new(0, 390, 0, 31)
					TextBoxTitle.Name = "TextBoxTitle"
					TextBoxTitle.Parent = TextBoxMain
					TextBoxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextBoxTitle.BackgroundTransparency = 1.000
					TextBoxTitle.Position = UDim2.new(0.0147783253, 0, 0, 0)
					TextBoxTitle.Size = UDim2.new(0, 400, 0, 31)
					TextBoxTitle.Font = Enum.Font.GothamSemibold
					TextBoxTitle.Text = name
					TextBoxTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
					TextBoxTitle.TextSize = 13.000
					TextBoxTitle.TextXAlignment = Enum.TextXAlignment.Left
					TextBox.Parent = TextBoxMain
					TextBox.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
					TextBox.BackgroundTransparency = 1.000
					TextBox.BorderSizePixel = 0
					TextBox.Position = UDim2.new(0.270329684, 0, 0.193548381, 0)
					TextBox.Size = UDim2.new(0, 284, 0, 18)
					TextBox.ZIndex = 2
					TextBox.Font = Enum.Font.GothamSemibold
					TextBox.PlaceholderColor3 = Color3.fromRGB(66, 66, 66)
					TextBox.PlaceholderText = name
					TextBox.Text = ""
					TextBox.TextColor3 = Color3.fromRGB(233, 233, 233)
					TextBox.TextSize = 13.000
					TextBox_Roundify_5px.Name = "TextBox_Roundify_5px"
					TextBox_Roundify_5px.Parent = TextBox
					TextBox_Roundify_5px.Active = true
					TextBox_Roundify_5px.AnchorPoint = Vector2.new(0.5, 0.5)
					TextBox_Roundify_5px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextBox_Roundify_5px.BackgroundTransparency = 1.000
					TextBox_Roundify_5px.Position = UDim2.new(0.5, 0, 0.5, 0)
					TextBox_Roundify_5px.Selectable = true
					TextBox_Roundify_5px.Size = UDim2.new(1, 0, 1, 0)
					TextBox_Roundify_5px.Image = "rbxassetid://3570695787"
					TextBox_Roundify_5px.ImageColor3 = Color3.fromRGB(13, 13, 13)
					TextBox_Roundify_5px.ScaleType = Enum.ScaleType.Slice
					TextBox_Roundify_5px.SliceCenter = Rect.new(100, 100, 100, 100)
					TextBox_Roundify_5px.SliceScale = 0.040
					local LastSize = -1

					TextBox:GetPropertyChangedSignal("Text"):connect(function()
						local Size = TextService:GetTextSize(TextBox.Text, TextBox.TextSize + 1, TextBox.Font, TextBoxMain.AbsoluteSize)
						local Length = string.len(TextBox.Text)
						if Size.X > 284 then 
							LastSize = Length
							TextBox.TextScaled = true 
						elseif Size.X <= 284 and Length < LastSize then 
							TextBox.TextScaled = false 
							TextBox.TextSize = 13
						end
					end)

					TextBox.FocusLost:Connect(function()
						if callback then
							callback(TextBox.Text)
						end
					end)

					local box = {}

					function box:Update(val)
						TextBox.Text = val
						if callback then
							callback(val)
						end
					end

					return box
				end
				function section:Picker(name, options, callback)
					sectionSize = sectionSize + 70
					tabSize = tabSize + 70
					ResizeTab()
					ResizeSection()
					local PickerBack = Instance.new("Frame")
					local PickerTitle = Instance.new("TextLabel")
					local OptionsHolder = Instance.new("ImageLabel")
					local UIListLayout = Instance.new("UIListLayout")
					PickerBack.Name = "PickerBack"
					PickerBack.Parent = SectionFrame
					PickerBack.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
					PickerBack.BorderSizePixel = 0
					PickerBack.Position = UDim2.new(0.018779343, 0, 0.420054197, 0)
					PickerBack.Size = UDim2.new(0, 390, 0, 62)
					PickerTitle.Name = "PickerTitle"
					PickerTitle.Parent = PickerBack
					PickerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					PickerTitle.BackgroundTransparency = 1.000
					PickerTitle.Position = UDim2.new(0.0147783253, 0, 0, 0)
					PickerTitle.Size = UDim2.new(0, 400, 0, 31)
					PickerTitle.Font = Enum.Font.GothamSemibold
					PickerTitle.Text = name
					PickerTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
					PickerTitle.TextSize = 13.000
					PickerTitle.TextXAlignment = Enum.TextXAlignment.Left
					OptionsHolder.Name = "OptionsHolder"
					OptionsHolder.Parent = PickerBack
					OptionsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					OptionsHolder.BackgroundTransparency = 1.000
					OptionsHolder.Position = UDim2.new(0.0147783328, 0, 0.5, 0)
					OptionsHolder.Size = UDim2.new(0, 384, 0, 24)
					OptionsHolder.Image = "rbxassetid://3570695787"
					OptionsHolder.ImageColor3 = Color3.fromRGB(14, 14, 14)
					OptionsHolder.ScaleType = Enum.ScaleType.Slice
					OptionsHolder.SliceCenter = Rect.new(100, 100, 100, 100)
					OptionsHolder.SliceScale = 0.050
					UIListLayout.Parent = OptionsHolder
					UIListLayout.FillDirection = Enum.FillDirection.Horizontal
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					local activeButton = nil
					for i, v in next, options do
						local OptionDeselected = Instance.new("TextButton")
						OptionDeselected.Name = "OptionDeselected"
						OptionDeselected.Parent = OptionsHolder
						OptionDeselected.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
						OptionDeselected.BorderSizePixel = 0
						OptionDeselected.Size = UDim2.new(0, 77, 0, 24)
						OptionDeselected.AutoButtonColor = false
						OptionDeselected.Font = Enum.Font.GothamSemibold
						OptionDeselected.Text = v
						OptionDeselected.TextColor3 = Color3.fromRGB(66, 66, 66)
						OptionDeselected.TextSize = 13.000
						if activeButton == nil then
							activeButton = OptionDeselected
							OptionDeselected.TextColor3 = Color3.fromRGB(84, 116, 224)
							if callback then
								callback(v)
							end
						end
						OptionDeselected.MouseButton1Click:Connect(function()
							if activeButton == OptionDeselected then
								return
							end
							if activeButton then
								tweenObject(activeButton, {
									TextColor3 = Color3.fromRGB(66, 66, 66)
								}, 0.2)
							end
							tweenObject(OptionDeselected, {
								TextColor3 = Color3.fromRGB(84, 116, 224)
							}, 0.2)
							activeButton = OptionDeselected
							if callback then
								callback(v)
							end
						end)
					end

					local picker = {}
					function picker:Update(value)
						for i, v in next, OptionsHolder:GetChildren() do 
							if v.Text == value then
								if activeButton == v then
									return
								end
								if activeButton then
									tweenObject(activeButton, {
										TextColor3 = Color3.fromRGB(66, 66, 66)
									}, 0.2)
								end
								tweenObject(v, {
									TextColor3 = Color3.fromRGB(84, 116, 224)
								}, 0.2)
								activeButton = v
								if callback then
									callback(v.Text)
								end
								return
							end
						end
					end
					return picker
				end
				function section:Toggle(name, callback)
					sectionSize = sectionSize + 39
					tabSize = tabSize + 39
					ResizeTab()
					ResizeSection()

					local ToggleBackButton = Instance.new("TextButton")
					local ToggleTitle = Instance.new("TextLabel")
					local ToggleIndicator = Instance.new("ImageLabel")
					ToggleBackButton.Name = "ToggleBackButton"
					ToggleBackButton.Parent = SectionFrame
					ToggleBackButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
					ToggleBackButton.BorderSizePixel = 0
					ToggleBackButton.Size = UDim2.new(0, 390, 0, 31)
					ToggleBackButton.AutoButtonColor = false
					ToggleBackButton.Font = Enum.Font.SourceSans
					ToggleBackButton.Text = ""
					ToggleBackButton.TextColor3 = Color3.fromRGB(0, 0, 0)
					ToggleBackButton.TextSize = 14.000
					ToggleTitle.Name = "ToggleTitle"
					ToggleTitle.Parent = ToggleBackButton
					ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ToggleTitle.BackgroundTransparency = 1.000
					ToggleTitle.Position = UDim2.new(0.0147783253, 0, 0, 0)
					ToggleTitle.Size = UDim2.new(0, 400, 0, 31)
					ToggleTitle.Font = Enum.Font.GothamSemibold
					ToggleTitle.Text = name
					ToggleTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
					ToggleTitle.TextSize = 13.000
					ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
					ToggleIndicator.Name = "ToggleIndicator"
					ToggleIndicator.Parent = ToggleBackButton
					ToggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ToggleIndicator.BackgroundTransparency = 1.000
					ToggleIndicator.Position = UDim2.new(0.933396459, 0, 0.161290318, 0)
					ToggleIndicator.Size = UDim2.new(0, 20, 0, 20)
					ToggleIndicator.Image = "rbxassetid://3570695787"
					ToggleIndicator.ImageColor3 = Color3.fromRGB(0, 0, 0)
					ToggleIndicator.ScaleType = Enum.ScaleType.Slice
					ToggleIndicator.SliceCenter = Rect.new(100, 100, 100, 100)
					ToggleIndicator.SliceScale = 0.050
					ToggleBackButton.MouseButton1Click:Connect(function()--better color pls
						if ToggleIndicator.ImageColor3 == Color3.fromRGB(84, 116, 224) then
							tweenObject(ToggleIndicator, {
								ImageColor3 = Color3.fromRGB(0, 0, 0)
							}, 0.1)
							if callback then
								callback(false)
							end
						elseif ToggleIndicator.ImageColor3 == Color3.fromRGB(0, 0, 0) then
							tweenObject(ToggleIndicator, {
								ImageColor3 = Color3.fromRGB(84, 116, 224)
							}, 0.1)
							if callback then
								callback(true)
							end
						end
					end)

					local toggle = {}
					
					function toggle:Update(bool)
						if ToggleIndicator.ImageColor3 == Color3.fromRGB(84, 116, 224) and bool == false then
							tweenObject(ToggleIndicator, {
								ImageColor3 = Color3.fromRGB(0, 0, 0)
							}, 0.1)
							if callback then
								callback(false)
							end
						elseif ToggleIndicator.ImageColor3 == Color3.fromRGB(0, 0, 0) and bool == true then
							tweenObject(ToggleIndicator, {
								ImageColor3 = Color3.fromRGB(84, 116, 224)
							}, 0.1)
							if callback then
								callback(true)
							end
						end
					end

					return toggle
				end
				function section:Button(name, callback)
					sectionSize = sectionSize + 39
					tabSize = tabSize + 39
					ResizeTab()
					ResizeSection()

					local Button = Instance.new("TextButton")
					local ButtonTitle = Instance.new("TextLabel")
					local ButtonCool = Instance.new("ImageLabel")
					Button.Name = "Button"
					Button.Parent = SectionFrame
					Button.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
					Button.BorderSizePixel = 0
					Button.ClipsDescendants = true
					Button.Position = UDim2.new(0.018779343, 0, 0.0216802172, 0)
					Button.Size = UDim2.new(0, 390, 0, 31)
					Button.AutoButtonColor = false
					Button.Font = Enum.Font.SourceSans
					Button.Text = ""
					Button.TextColor3 = Color3.fromRGB(0, 0, 0)
					Button.TextSize = 14.000
					ButtonTitle.Name = "ButtonTitle"
					ButtonTitle.Parent = Button
					ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ButtonTitle.BackgroundTransparency = 1.000
					ButtonTitle.Position = UDim2.new(0.0147783253, 0, 0, 0)
					ButtonTitle.Size = UDim2.new(0, 400, 0, 31)
					ButtonTitle.Font = Enum.Font.GothamBold
					ButtonTitle.Text = name
					ButtonTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
					ButtonTitle.TextSize = 13.000
					ButtonTitle.TextXAlignment = Enum.TextXAlignment.Center
					ButtonCool.Name = "ButtonCool"
					ButtonCool.Parent = ButtonTitle
					ButtonCool.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ButtonCool.BackgroundTransparency = 1.000
					ButtonCool.Position = UDim2.new(0.899178982, 0, 0.225806445, 0)
					ButtonCool.Size = UDim2.new(0, 17, 0, 17)
					ButtonCool.Image = "rbxgameasset://Images/w"
					Button.MouseEnter:Connect(function()
						tweenObject(Button, {
							BackgroundColor3 = Color3.fromRGB(64, 64, 64)
						}, 0.3)
					end)
					
					Button.MouseLeave:Connect(function()
						tweenObject(Button, {
							BackgroundColor3 = Color3.fromRGB(24, 24, 24)
						}, 0.3)
					end)
					Button.MouseButton1Click:Connect(function()
						coroutine.resume(coroutine.create(function()
							local Circle = Instance.new("ImageLabel")
							Circle.Name = "Circle"
							Circle.Parent = Button
							Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							Circle.BackgroundTransparency = 1
							Circle.ZIndex = 10
							Circle.Image = "rbxassetid://266543268"
							Circle.ImageColor3 = Color3.fromRGB(255, 255, 255)
							Circle.ImageTransparency = 0.900
							Button.ClipsDescendants = true
							Circle.Position = UDim2.new(0, Mouse.X - Circle.AbsolutePosition.X, 0, Mouse.Y - Circle.AbsolutePosition.Y)
							Circle:TweenSizeAndPosition(UDim2.new(0, Button.AbsoluteSize.X * 1.5, 0, Button.AbsoluteSize.X * 1.5), UDim2.new(0.5, -Button.AbsoluteSize.X * 1.5 / 2, 0.5, -Button.AbsoluteSize.X * 1.5 / 2), "Out", "Quad", 0.75, false, nil)
							tweenObject(Circle, {
								ImageTransparency = 1
							}, 0.75)
							wait(0.75)
							Circle:Destroy()
						end))
						if callback then
							callback()
						end
					end)
				end
				function section:Keybind(name, options, callback)
					sectionSize = sectionSize + 39
					tabSize = tabSize + 39
					ResizeTab()
					ResizeSection()

					local KeybindButton = Instance.new("TextButton")
					local KeybindTitle = Instance.new("TextLabel")
					local KeybindValueback = Instance.new("ImageLabel")
					local KeybindValue = Instance.new("TextLabel")
					KeybindButton.Name = "KeybindButton"
					KeybindButton.Parent = SectionFrame
					KeybindButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
					KeybindButton.BorderSizePixel = 0
					KeybindButton.ClipsDescendants = true
					KeybindButton.Size = UDim2.new(0, 390, 0, 31)
					KeybindButton.AutoButtonColor = false
					KeybindButton.Font = Enum.Font.SourceSans
					KeybindButton.Text = ""
					KeybindButton.TextColor3 = Color3.fromRGB(0, 0, 0)
					KeybindButton.TextSize = 14.000
					KeybindTitle.Name = "KeybindTitle"
					KeybindTitle.Parent = KeybindButton
					KeybindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					KeybindTitle.BackgroundTransparency = 1.000
					KeybindTitle.Position = UDim2.new(0.0147783253, 0, 0, 0)
					KeybindTitle.Size = UDim2.new(0, 400, 0, 31)
					KeybindTitle.Font = Enum.Font.GothamSemibold
					KeybindTitle.Text = "Keybind"
					KeybindTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
					KeybindTitle.TextSize = 13.000
					KeybindTitle.TextXAlignment = Enum.TextXAlignment.Left
					KeybindValueback.Name = "KeybindValueback"
					KeybindValueback.Parent = KeybindButton
					KeybindValueback.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					KeybindValueback.BackgroundTransparency = 1.000
					KeybindValueback.Position = UDim2.new(0.862068951, 0, 0.109090909, 0)
					KeybindValueback.Size = UDim2.new(0, 50, 0, 25)
					KeybindValueback.Image = "rbxassetid://3570695787"
					KeybindValueback.ImageColor3 = Color3.fromRGB(14, 14, 14)
					KeybindValueback.ScaleType = Enum.ScaleType.Slice
					KeybindValueback.SliceCenter = Rect.new(100, 100, 100, 100)
					KeybindValueback.SliceScale = 0.050
					KeybindValue.Name = "KeybindValue"
					KeybindValue.Parent = KeybindValueback
					KeybindValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					KeybindValue.BackgroundTransparency = 1.000
					KeybindValue.Size = UDim2.new(0, 50, 0, 25)
					KeybindValue.Font = Enum.Font.GothamSemibold
					KeybindValue.Text = ". . ."
					KeybindValue.TextColor3 = Color3.fromRGB(233, 233, 233)
					KeybindValue.TextSize = 13.000
					local pressConnection
					KeybindButton.MouseButton1Click:Connect(function()
						if pressConnection then
							pressConnection:Disconnect()
						end
						KeybindValue.Text = ". . ."
						pressConnection = UserInputService.InputBegan:Connect(function(input)
							pressConnection:Disconnect()
							KeybindValue.Text = string.split(tostring(input.KeyCode), ".")[3]
							if callback then
								callback(input.KeyCode)
							end
						end)
					end)
				end
				function section:SearchBox(name, options, callback)
					sectionSize = sectionSize + 39
					tabSize = tabSize + 39
					ResizeTab()
					ResizeSection()

					local TextBoxMain = Instance.new("Frame")
					local TextBoxTitle = Instance.new("TextLabel")
					local TextBox = Instance.new("TextBox")
					--local TextBox_Roundify_5px = Instance.new("ImageLabel")
					TextBoxMain.Name = "TextBoxMain"
					TextBoxMain.Parent = SectionFrame
					TextBoxMain.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
					TextBoxMain.BorderColor3 = Color3.fromRGB(27, 42, 53)
					TextBoxMain.BorderSizePixel = 0
					TextBoxMain.Position = UDim2.new(0.018779343, 0, 0.615176141, 0)
					TextBoxMain.Size = UDim2.new(0, 390, 0, 31)
					TextBoxTitle.Name = "TextBoxTitle"
					TextBoxTitle.Parent = TextBoxMain
					TextBoxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextBoxTitle.BackgroundTransparency = 1.000
					TextBoxTitle.Position = UDim2.new(0.0147783253, 0, 0, 0)
					TextBoxTitle.Size = UDim2.new(0, 400, 0, 31)
					TextBoxTitle.Font = Enum.Font.GothamSemibold
					TextBoxTitle.Text = name
					TextBoxTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
					TextBoxTitle.TextSize = 13.000
					TextBoxTitle.TextXAlignment = Enum.TextXAlignment.Left
					TextBox.Parent = TextBoxMain
					TextBox.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
					TextBox.BackgroundTransparency = 0
					TextBox.BorderSizePixel = 0
					TextBox.Position = UDim2.new(0.270329684, 0, 0.193548381, 0)
					TextBox.Size = UDim2.new(0, 284, 0, 18)
					TextBox.ZIndex = 2
					TextBox.Font = Enum.Font.GothamSemibold
					TextBox.PlaceholderColor3 = Color3.fromRGB(66, 66, 66)
					TextBox.PlaceholderText = name
					TextBox.Text = ""
					TextBox.TextColor3 = Color3.fromRGB(233, 233, 233)
					TextBox.TextSize = 13.000
					local SearchBoxBack = Instance.new("ImageLabel")
					local ScrollingFrame = Instance.new("ScrollingFrame")
					local UIListLayout = Instance.new("UIListLayout")
					local Title = Instance.new("TextLabel")
					local Frame = Instance.new("Frame")
					SearchBoxBack.Name = "SearchBoxBack"
					SearchBoxBack.Parent = MainUITabPickedHolder
					SearchBoxBack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SearchBoxBack.BackgroundTransparency = 1.000
					SearchBoxBack.Position = UDim2.new(0, 0, 0, 0)
					SearchBoxBack.Size = UDim2.new(0, 210, 0, 36)
					SearchBoxBack.Image = "rbxassetid://3570695787"
					SearchBoxBack.ImageColor3 = Color3.fromRGB(22, 22, 22)
					SearchBoxBack.ImageTransparency = 1
					SearchBoxBack.ScaleType = Enum.ScaleType.Slice
					SearchBoxBack.SliceCenter = Rect.new(100, 100, 100, 100)
					SearchBoxBack.SliceScale = 0.050
					SearchBoxBack.Visible = false
					SearchBoxBack.ZIndex = -4
					ScrollingFrame.Parent = SearchBoxBack
					ScrollingFrame.Active = true
					ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ScrollingFrame.BackgroundTransparency = 1.000
					ScrollingFrame.BorderSizePixel = 0
					ScrollingFrame.Position = UDim2.new(0, 0, 0, 31)
					ScrollingFrame.Size = UDim2.new(0, 210, 1, -32)
					ScrollingFrame.BottomImage = ""
					ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
					ScrollingFrame.ScrollBarThickness = 2
					ScrollingFrame.TopImage = ""
					ScrollingFrame.ZIndex = -4
					UIListLayout.Parent = ScrollingFrame
					UIListLayout.SortOrder = Enum.SortOrder.Name
					Title.Name = "Title"
					Title.Parent = SearchBoxBack
					Title.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
					Title.BackgroundTransparency = 0
					Title.Size = UDim2.new(0, 210, 0, 31)
					Title.Font = Enum.Font.GothamSemibold
					Title.Text = name
					Title.BorderSizePixel = 0
					Title.TextColor3 = Color3.fromRGB(233, 233, 233)
					Title.TextSize = 13.000
					Title.ZIndex = -4
					Frame.Parent = SearchBoxBack
					Frame.BackgroundColor3 = Color3.fromRGB(84, 116, 224)
					Frame.BorderSizePixel = 0
					Frame.Position = UDim2.new(0, 0, 0, 31)
					Frame.Size = UDim2.new(0, 210, 0, 1)
					Frame.ZIndex = -4
					local buttons = {}
					local isDone = false
					local function updateVisibles()
						local si = 33
						for i, v in next, buttons do
							if v.Visible == true then
								si = si + 30
							end
						end
						if si >= 183 then
							ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, si - 33)
							SearchBoxBack.Size = UDim2.new(0, 210, 0, 183)
						else
							ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
							SearchBoxBack.Size = UDim2.new(0, 210, 0, si)
						end
					end

					
					local function searchboxon()
						if isDone == false then
							if SearchBoxBack.Position == UDim2.new(0, 0, 0, 0) then
								SearchBoxBack.Visible = true
								tweenObject(SearchBoxBack, {
									Position = UDim2.new(1.05, 0, 0, 0)
								}, 0.4)
							end
							if #buttons == 0 then
								for i, v in next, options do
									local TextButton = Instance.new("TextButton")
									TextButton.Parent = ScrollingFrame
									TextButton.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
									TextButton.BorderSizePixel = 0
									TextButton.AutoButtonColor = false
									TextButton.Position = UDim2.new(-0.0153846154, 0, 0, 0)
									TextButton.Size = UDim2.new(0, 215, 0, 30)
									TextButton.Font = Enum.Font.GothamSemibold
									TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
									TextButton.TextSize = 14.000
									TextButton.Text = v
									TextButton.ZIndex = -4
									TextButton.Visible = false
									table.insert(buttons, TextButton)
									TextButton.MouseEnter:Connect(function()
										tweenObject(TextButton, {
											BackgroundColor3 = Color3.fromRGB(77, 77, 77)
										}, 0.2)
									end)
									TextButton.MouseLeave:Connect(function()
										tweenObject(TextButton, {
											BackgroundColor3 = Color3.fromRGB(22, 22, 22)
										}, 0.2)
									end)
									TextButton.MouseButton1Click:Connect(function()
										isDone = true
										TextBox.Text = v
										if callback then
											callback(v)
										end
										local tw = tweenObject(SearchBoxBack, {
											Position = UDim2.new(0, 0, 0, 0)
										}, 0.4)
										tw.Completed:wait()
										SearchBoxBack.Visible = false
										for i, v in next, buttons do
											v:Destroy()
											buttons[i] = nil
										end
										isDone = false
									end)
								end
							end
							updateVisibles()
							for i, v in pairs(buttons) do
								if string.sub(string.lower(v.Text), 1, string.len(TextBox.Text)) == string.lower(TextBox.Text) then
									if v.Visible == false then
										spawn(function()
											v.Visible = true
											updateVisibles()
											tweenObject(v, {
												TextTransparency = 0
											}, 0.2)
											tweenObject(v, {
												BackgroundTransparency = 0
											}, 0.2)
										end)
									end
								else
									if v.Visible == true then
										spawn(function()
											local tw = tweenObject(v, {
												TextTransparency = 1
											}, 0.2)
											tweenObject(v, {
												BackgroundTransparency = 0
											}, 0.2)
											tw.Completed:wait(0.1)
											v.Visible = false
											updateVisibles()
										end)
									end
								end
							end
						end
					end
					TextBox.Focused:Connect(searchboxon)
					TextBox.FocusLost:Connect(function()
						wait(0.5)
						isDone = true
						local tw = tweenObject(SearchBoxBack, {
							Position = UDim2.new(0, 0, 0, 0)
						}, 0.4)
						tw.Completed:wait()
						SearchBoxBack.Visible = false
						for i, v in next, buttons do
							v:Destroy()
							buttons[i] = nil
						end
						isDone = false
					end)
					TextBox:GetPropertyChangedSignal("Text"):Connect(searchboxon)

					local searchbox = {}
					function searchbox:Update(val)
						if table.find(options, val) then 
							TextBox.Text = val
						end
					end
					return searchbox
				end
				return section
			end
			return tab
		end
		return window
	end

	local function DisableConnection(signal) 
		for i, v in next, getconnections(signal) do 
			v:Disable() 
		end 
	end

	local function FireConnection(signal) 
		for i, v in next, getconnections(signal) do 
			v:Fire()
		end 
	end

	DisableConnection(player.Idled)
	DisableConnection(game:GetService("ScriptContext").Error)

	local DataManager = ReplicatedStorage.Modules.DataManager 

	local Hashes = {} 
	local Remotes = {}

	for i, v in next, getupvalues(rawget(require(DataManager), "FireServer")) do
		if type(v) == "function" then
			for k, x in next, getupvalues(v) do
				if type(x) == "table" then
					for a, b in next, x do
						if typeof(b) == "Instance" then
							Hashes = x
							break
						end
					end
				end
			end
		end
	end

	local remoteAdded

	for i,v in next, getreg() do 
		if type(v) == "function" and islclosure(v) and getinfo(v).name == "remoteAdded" then 
			remoteAdded = v 
		end 
	end

	for i, v in next, getupvalues(remoteAdded) do
		if type(v) == "function" then
			for k, x in next, getupvalues(v) do
				if type(x) == "table" then
					for a, b in next, x do
						local remote = Hashes[a]
						if remote then
							Remotes[b:sub(1, 2) == "F_" and b:sub(3) or b] = remote
						end
					end
				end
			end
		end
	end

	local function Call(remote, args)
		remote = Remotes[remote]
		if remote:IsA("RemoteEvent") then
			return remote:FireServer(args)
		elseif remote:IsA("RemoteFunction") then 
			return remote:InvokeServer(args)
		end 
	end

	local function GetItemPosition(Position, GroundCFrame)
		return GroundCFrame:PointToObjectSpace(Position)
	end

	local function GetLoadPosition(Position, GroundCFrame)
		return GroundCFrame:PointToWorldSpace(Position)
	end

	local function GetItemCFrame(CFrame, GroundCFrame)
		return GroundCFrame:ToObjectSpace(CFrame)
	end

	local function GetLoadCFrame(CFrame, GroundCFrame)
		return GroundCFrame:ToWorldSpace(CFrame)
	end

	local function PositionToArray(Position)
		return {
			[1] = Position.X,
			[2] = Position.Y,
			[3] = Position.Z
		}
	end

	local function ArrayToPosition(Array)
		return Vector3.new(Array[1], Array[2], Array[3])
	end

	local function CFrameToArray(CFrame)
		local Array = {}
		for i, v in next, {CFrame:components()} do
			Array[i] = v
		end
		return Array
	end

	local function ArrayToCFrame(Array)
		return CFrame.new(unpack(Array))
	end

	local ModulesFolder, ScriptsFolder = ReplicatedStorage.Modules, player.PlayerGui.MainGUI.Scripts

	local Modules = {
		ObjectManager = require(ModulesFolder.ObjectManager);
		MaterialData = require(ModulesFolder.Data.MaterialData);
		WallHandler = require(ModulesFolder.WallHandler);
		ElevatorHandler = require(ModulesFolder.ElevatorHandler);
		FenceHandler = require(ModulesFolder.FenceHandler);
		ItemData = require(ModulesFolder.ItemManager.ItemData);
		ItemManager = require(ModulesFolder.ItemManager);
		RoofHandler = require(ModulesFolder.RoofHandler);
		PlacementHandler = require(ScriptsFolder.BuildInterface.PlacementHandler);
		Polygon = require(ModulesFolder.Utilities.Polygon);
		Hotbar = require(ScriptsFolder.Hotbar);
		GUIHandler = require(ScriptsFolder.GUIHandler);
		JobData = require(ModulesFolder.Data.JobData);
		TranslationHandler = require(ScriptsFolder.TranslationHandler);
		FoodHandler = require(ModulesFolder.FoodHandler);
		VehicleData = require(ModulesFolder.VehicleHandler.VehicleData);
	}

	local JobManager = ScriptsFolder.JobManager

	local JobModules = {
		["Hairdresser"] = require(JobManager.StylezHairdresser);
		["Delivery Person"] = require(JobManager.PizzaPlanetDelivery);
		["Burger Cashier"] = require(JobManager.BloxyBurgersCashier);
		["Pizza Baker"] = require(JobManager.PizzaPlanetBaker);
		["Fisherman"] = require(JobManager.HutFisherman);
		["Miner"] = require(JobManager.CaveMiner);
		["Woodcutter"] = require(JobManager.LumberWoodcutter);
		["Market Cashier"] = require(JobManager.SupermarketCashier);
		["Janitor"] = require(JobManager.CleanJanitor);
		["Stocker"] = require(JobManager.SupermarketStocker);
		["Ice Cream Seller"] = require(JobManager.BensIceCreamSeller);
		["Mechanic"] = require(JobManager.MikesMechanic);
	}

	local JobActions = {
		EndShift = function(Job)
			JobModules[Job]:EndShift()
		end;
		IsWorking = function()
			return require(JobManager):IsWorking()
		end;
		StartShift = function(Job)
			if not require(JobManager):IsWorking() then
				JobModules[Job]:StartShift()
			end
		end;
	}

	local function Pathfind(pos)
		local path = PathfindingService:CreatePath()
		path:ComputeAsync(player.Character.HumanoidRootPart.Position, pos)
		if #path:GetWaypoints() == 0 then 
			player.Character.Humanoid:MoveTo(pos)
			repeat
				wait()
			until (player.Character.HumanoidRootPart.Position - pos).magnitude <= 5
			player.Character.Humanoid:MoveTo(player.Character.HumanoidRootPart.Position)
		else 
			for i, v in next, path:GetWaypoints() do 
				player.Character.Humanoid:MoveTo(v.Position)
				if v.Action == Enum.PathWaypointAction.Jump then
					player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end
				player.Character.Humanoid.MoveToFinished:wait()
			end
		end 
	end

	local function GetRelativeComponents(vec)
		if player.Character.PrimaryPart then
			local newCF = CFrame.new(player.Character.PrimaryPart.Position, vec)
			local x, y, z, r00, r01, r02, r10, r11, r12, r20, r21, r22 = newCF:components()
			return {
				r00,
				r01,
				r02,
				r10,
				r11,
				r12,
				r20,
				r21,
				r22
			}
		end
	end

	local currentPlayerTween = nil
	local function CoolTween(target, speed)
		if player.Character:FindFirstChild("HumanoidRootPart") then
			local dist = (player.Character.HumanoidRootPart.Position - target.p).magnitude
			currentPlayerTween = game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(dist / speed, Enum.EasingStyle.Linear), {
				CFrame = target
			})
			currentPlayerTween:Play() 
			currentPlayerTween.Completed:wait()
			currentPlayerTween = nil
		end
	end

	local Materials = Modules.MaterialData.Materials
	local MSGID = BrickColor.new("Medium stone grey").Number
	local PlasticID = Materials.Plastic.ID

	local function Detail(obj, objType, data, side)
		local args
		if obj then
			if objType == "Wall" then
				args = {
					Object = obj,
					UseMaterials = true,
					Data = {
						{},
						{},
						{},
						{}
					},
					Side = side
				}
				if data["Color"] == MSGID and data["Material"] == PlasticID then
					return
				end
				args["Data"][1] = {
					data["Color"],
					data["Material"]
				}
			elseif objType == "Object" then
				args = {
					Object = obj,
					UseMaterials = true,
				}
				args["Data"] = data
				for i = 1, 4 do
					if args["Data"][i] == nil then
						args["Data"][i] = {}
					end
				end
			end
			Call("ColorObject", args)
		end
	end

	local function ParseColorGroup(gr, asd)
		local newT = {}
		if type(gr) == "table" then
			for i, v in next, gr do
				if v[1] and v[2] then
					newT[i] = {}
					if v[1] ~= nil and v[2] ~= nil then
						newT[i][1] = v[1]
						newT[i][2] = v[2]
					end
				end
			end
		elseif asd then
			newT[1] = {}
			if gr == nil then
				gr = MSGID
			end
			newT[1][1] = gr
			newT[1][2] = asd
		end
		return newT
	end

	local function IsOf(Name, Type)
		if Modules.ItemData[Type][Name] then
			return true
		else
			return false
		end
	end

	local function GetColorGroups(obj)
		if obj.Name == "Wall" then
			local leftColor = nil
			local rightColor = nil
			local leftMat = nil
			local rightMat = nil
			for i, v in next, obj:GetChildren() do
				if v.Name == "LPart" then
					if v.BrickColor.Number ~= MSGID then
						leftColor = v.BrickColor.Number
					end
					if v:FindFirstChild("MaterialID") then
						leftMat = v.MaterialID.Value
						if leftMat == PlasticID then
							leftMat = nil
						end
					else
						leftMat = Materials[v.Material.Name].ID
						if leftMat == PlasticID then
							leftMat = nil
						end
					end
				elseif v.Name == "RPart" then
					if v.BrickColor.Number ~= MSGID then
						rightColor = v.BrickColor.Number
					end
					if v:FindFirstChild("MaterialID") then
						rightMat = v.MaterialID.Value
						if rightMat == PlasticID then
							rightMat = nil
						end
					else
						rightMat = Materials[v.Material.Name].ID
						if rightMat == PlasticID then
							rightMat = nil
						end
					end
				end
			end
			return leftColor, leftMat, rightColor,  rightMat
		else
			local Data = Modules.ObjectManager:GetAppearanceData(obj)
			for i, v in next, Data do
				if #Data[i] == 0 then
					Data[i] = nil
				else
					if Data[i][1] == MSGID and Data[i][2] == PlasticID then
						Data[i][1] = nil
						Data[i][2] = nil
						Data[i] = nil
					end
				end
			end
			return Data
		end
	end;

	local SaveSettings = {
		Target = nil;
		TargetName = nil;
	}

	local function SavePlot(Plot)
		local Ground = Plot.Ground
		local House = Plot.House
		local Data = {}
		local External = {}
		local GlobalId = 0
		local WallHandler = Modules.WallHandler
		local function RecursiveScan(Object, Id)
			if External[tostring(Id)] == nil then
				External[tostring(Id)] = {}
			end
			if Object:FindFirstChild("ItemHolder") then
				for i, v in next, Object.ItemHolder:GetChildren() do
					local Item = {}
					Item.Name = v.Name
					if v:IsA("Model") then
						Item.CFrame = CFrameToArray(GetItemCFrame(v.PrimaryPart.CFrame, Ground.CFrame))
					else
						Item.CFrame = CFrameToArray(GetItemCFrame(v.CFrame, Ground.CFrame))
					end
					Item.Color = GetColorGroups(v)
					if v:FindFirstChild("SideValue") then
						if IsOf(v.Name, "Curtains") then
							Item.Side = v.SideValue.Value == 1
						else
							Item.Side = (v.SideValue.Value == 1) ~= true;
						end
					end
					if v:FindFirstChild("ObjectData") then
						if v.ObjectData:FindFirstChild("Image") then
							Item.Image = v.ObjectData.Image.Value
						end
						if v.ObjectData:FindFirstChild("Height") then
							Item.Height = v.ObjectData.Height.Value
						end
					end
					if v:FindFirstChild("RailingSegment") then
						Item.Segment = v.RailingSegment.Value.Name
						Item.Pos = PositionToArray(GetItemPosition(Object.Position, Ground.CFrame))
					end
					if v:FindFirstChild("ItemHolder") then
						GlobalId = GlobalId + 1
						Item.Id = GlobalId
						RecursiveScan(v, GlobalId)
					end
					table.insert(External[tostring(Id)], Item)
				end
			else
				local Item = {}
				Item.Name = v.Name

				if Object:IsA("Model") then
					Item.CFrame = CFrameToArray(GetItemCFrame(Object.PrimaryPart.CFrame, Ground.CFrame))
				else
					Item.CFrame = CFrameToArray(GetItemCFrame(Object.CFrame, Ground.CFrame))
				end
				Item.Color = GetColorGroups(Object)
				if Object:FindFirstChild("SideValue") then
					if IsOf(Object.Name, "Curtains") then
						Item.Side = Object.SideValue.Value == 1
					else
						Item.Side = (Object.SideValue.Value == 1) ~= true;
					end
				end
				if Object:FindFirstChild("ObjectData") then
					if Object.ObjectData:FindFirstChild("Image") then
						Item.Image = Object.ObjectData.Image.Value
					end
					if Object.ObjectData:FindFirstChild("Height") then
						Item.Height = Object.ObjectData.Height.Value
					end
				end
				if Object:FindFirstChild("RailingSegment") then
					Item.Segment = Object.RailingSegment.Value.Name
					Item.Pos = PositionToArray(GetItemPosition(Model.Position, Ground.CFrame))
				end
				if Object:FindFirstChild("ItemHolder") then
					GlobalId = GlobalId + 1
					Item.Id = GlobalId
					RecursiveScan(Object, GlobalId)
				end
				table.insert(External[tostring(Id)], Item)
			end
		end
		for _, BuildType in next, House:GetChildren() do
			for i, v in next, BuildType:GetChildren() do
				local Item = {}
				if v.Name ~= "Poles" then
					Item.Type = BuildType.Name
					if BuildType.Name == "Walls" then
						local To, From = WallHandler:GetWallEdges(v)
						if From ~= nil and To ~= nil then
							local NewFrom, NewTo = GetItemPosition(From, Ground.CFrame), GetItemPosition(To, Ground.CFrame)
							local LC, LM, RC, RM = GetColorGroups(v)
							Item.From = PositionToArray(NewFrom);
							Item.To = PositionToArray(NewTo);
							Item.LC = LC
							Item.LM = LM
							Item.RC = RC
							Item.RM = RM
							if v:FindFirstChild("ItemHolder") then
								GlobalId = GlobalId + 1
								Item.Id = GlobalId
								RecursiveScan(v, GlobalId)
							end
						end
					elseif BuildType.Name == "Roof" or BuildType.Name == "Floor" then
						Item.Name = v.Name
						Item.Points = {}
						Item.Color = GetColorGroups(v)
						for i, v in next, v.PointData:GetChildren() do
							table.insert(Item.Points, PositionToArray(v.Value))
						end
						if v:FindFirstChild("PropertyData") then
							if v.PropertyData:FindFirstChild("Height") then
								Item.Height = v.PropertyData.Height.Value
							end
						else
							Item.Name = nil
						end
						if v:FindFirstChild("ItemHolder") then
							GlobalId = GlobalId + 1
							Item.Id = GlobalId
							RecursiveScan(v, GlobalId)
						end
					elseif BuildType.Name == "Pools" then
						Item.Name = v.Name
						Item.Center = CFrameToArray(GetItemCFrame(v.HitBox.CFrame, Ground.CFrame))
						Item.X = v.HitBox.Size.X
						Item.Y = v.HitBox.Size.Z
						if v:FindFirstChild("ItemHolder") then
							GlobalId = GlobalId + 1
							Item.Id = GlobalId
							RecursiveScan(v, GlobalId)
						end
					elseif BuildType.Name == "Paths" then
						local From, To = v.BPole.Value.Parent.Position, v.FPole.Value.Parent.Position
						if From ~= nil and To ~= nil then
							local NewFrom, NewTo = GetItemPosition(From, Ground.CFrame), GetItemPosition(To, Ground.CFrame)
							Item.From = PositionToArray(NewFrom);
							Item.To = PositionToArray(NewTo);
							Item.Color = v.SizeBox.BrickColor.Number
							Item.Material = (v:FindFirstChild("MaterialID") and v:FindFirstChild("MaterialID").Value) or nil
							if Item.Material == PlasticID then
								Item.Material = nil
							end

							if Item.Color == MSGID then
								Item.Color = nil
							end
							if v:FindFirstChild("ItemHolder") then
								GlobalId = GlobalId + 1
								Item.Id = GlobalId
								RecursiveScan(v, GlobalId)
							end
						end
					elseif BuildType.Name == "Objects" or BuildType.Name == "Counters" then
						Item.Name = v.Name
						Item.CFrame = CFrameToArray(GetItemCFrame(v.CFrame, Ground.CFrame))
						Item.Color = GetColorGroups(v)
						if v:FindFirstChild("ObjectData") then
							if v.ObjectData:FindFirstChild("Image") then
								Item.Image = v.ObjectData.Image.Value
							end
							if v.ObjectData:FindFirstChild("Height") then
								Item.Height = v.ObjectData.Height.Value
							end
						end
						if v:FindFirstChild("ItemHolder") then
							GlobalId = GlobalId + 1
							Item.Id = GlobalId
							RecursiveScan(v, GlobalId)
						end
					elseif BuildType.Name == "Fences" then
						local From, To = Modules.FenceHandler:GetEdges(v)
						local NewFrom, NewTo = GetItemPosition(From.p, Ground.CFrame), GetItemPosition(To.p, Ground.CFrame)
						Item.Name = v.Name
						Item.From = PositionToArray(NewFrom)
						Item.To = PositionToArray(NewTo)
						Item.Color = GetColorGroups(v)
						if v:FindFirstChild("ItemHolder") then
							GlobalId = GlobalId + 1
							Item.Id = GlobalId
							RecursiveScan(v, GlobalId)
						end
					elseif BuildType.Name == "Basements" then
						Item.Name = v.Name
						Item.Center = CFrameToArray(GetItemCFrame(v.HitBox.CFrame + Vector3.new(0, 12, 0), Ground.CFrame))
						Item.X = v.HitBox.Size.X
						Item.Y = v.HitBox.Size.Z
						if v:FindFirstChild("ItemHolder") then
							GlobalId = GlobalId + 1
							Item.Id = GlobalId
							RecursiveScan(v, GlobalId)
						end
					end
					table.insert(Data, Item)
				end
			end
		end

		local TargetName = SaveSettings.TargetName
		local Houses = ReplicatedStorage.Stats[TargetName].Houses
		local CurrentHouse = Houses:GetChildren()[Houses.Value]
		local Value = {
			TotalValue = CurrentHouse.TotalValue.Value,
			BlockbuxValue = CurrentHouse.BSValue.Value
		}
		return {
			Data = Data,
			External = External,
			Value = Value
		}
	end

	local BuildSettings = {
		FastBuild = false;
		SlowBuild = false;
		Time = 0;
		UseBux = false;
		UseCar = false;
		MaxBux = 0;
		MaxCost = 200000;
	}

	local function LoadPlot(Data)
		local Stats = ReplicatedStorage.Stats[player.Name]
		local Plot = Stats.IsBuilding.Value
		local PlotOwner = Plot.Name:gsub("Plot_", "")
		if Plot == nil then
			return "not in build mode"
		end
		local Ground = Plot.Ground
		local Input = Http:JSONDecode(Data)

		if Input.Value.TotalValue > Stats.Money.Value then 
			local resp = Modules.GUIHandler:ConfirmBox("You do not have enough money to complete this build ("..tostring(Stats.Money.Value).."/"..tostring(Input.Value.TotalValue).."). Continue?", "Insufficient Funds")
			if resp == false then return end
		end 

		if BuildSettings.UseBux and Input.Value.BlockbuxValue > Stats.Blockbux.Value then 
			local resp = Modules.GUIHandler:ConfirmBox("You do not have enough blockbux to complete this build ("..tostring(Stats.Blockbux.Value).."/"..tostring(Input.Value.BlockbuxValue).."). Continue?", "Insufficient Funds")
			if resp == false then return end
		end

		local function Has(plr, item)
			ReplicatedStorage.Stats[plr].Inventory:FindFirstChild(item)
		end
		local function CostsBux(Item)
			for i, v in next, Modules.ItemData do 
				if v[Item] then
					local BSPrice = v[Item].BSPrice
					return BSPrice and true, BSPrice or false
				end
			end
		end

		local function GetPrice(Item)
			for i, v in next, Modules.ItemData do 
				if v[Item] then
					return v[Item].Price
				end
			end
		end
		
		local Hidden = {}
		local IsLocked, IsHidden = Modules.ItemManager.IsLocked, Modules.ItemManager.IsHidden

		for i, v in next, Modules.ItemData do
			for k, x in next, v do
				if IsLocked(nil, x, player) or IsHidden(nil, x, player) then
					Hidden[k] = k
				end
			end
		end

		local hasStop = false
		
		local Amount = 0

		local function Build(Type, Args)
			Amount = Amount + 1
			
			local name = Args.Name or Args.ItemType
			local costs, price = CostsBux(name)
			local ItemPrice = GetPrice(name)

			if Hidden[name] then
				return
			end

			if name then 
				if ItemPrice and ItemPrice > BuildSettings.MaxCost then 
					return 
				end
				if IsOf(name, "Vehicles") then
					if not BuildSettings.UseCar then
						return
					end 
				end
				if costs then
					if Has(PlotOwner, name) then
						Args["Moved"] = "Inventory"
					else
						if BuildSettings.UseBux then
							if price > BuildSettings.MaxBux then
								return
							end
						else
							return
						end
					end
				end
			end
			
			if Amount % 4 == 0 then 
				wait(3)
			end

			local call = Call("Place" .. Type, Args)

			if call == nil and hasStop == false then
				hasStop = true
			end

			return call
		end
		local function FixOrientation(orientation)
			return orientation + Ground.Orientation.Y
		end

		local function cframeRotation(CF)
			local lv = CF.lookVector
			local rot = -atan2(lv.z, lv.x) - pi * 0.5
			return rot < 0 and 2 * pi + rot or rot
		end
		
		--Init
		for i in next, Input.Data do
			if Input.Data[i].From then
				Input.Data[i].From = GetLoadPosition(ArrayToPosition(Input.Data[i].From), Ground.CFrame)
			end
			if Input.Data[i].To then
				Input.Data[i].To = GetLoadPosition(ArrayToPosition(Input.Data[i].To), Ground.CFrame)
			end
			if Input.Data[i].Position then
				Input.Data[i].Position = GetLoadPosition(ArrayToPosition(Input.Data[i].Position), Ground.CFrame)
			end
			if Input.Data[i].CFrame then
				Input.Data[i].CFrame = GetLoadCFrame(ArrayToCFrame(Input.Data[i].CFrame), Ground.CFrame)
				Input.Data[i].Position = Input.Data[i].CFrame.p
				Input.Data[i].Rotation = cframeRotation(Input.Data[i].CFrame)
				Input.Data[i].CFrame = nil
			end
			if Input.Data[i].Center then
				Input.Data[i].Center = ArrayToCFrame(Input.Data[i].Center)
			end
			if Input.Data[i].Points then
				for k, v in next, Input.Data[i].Points do
					Input.Data[i].Points[k] = GetLoadPosition(ArrayToPosition(Input.Data[i].Points[k]), Ground.CFrame)
				end
			end
		end
		for i in next, Input.External do
			for i2 in next, Input.External[i] do
				if Input.External[i][i2].From then
					Input.External[i][i2].From = GetLoadPosition(ArrayToPosition(Input.External[i][i2].From), Ground.CFrame)
				end
				if Input.External[i][i2].To then
					Input.External[i][i2].To = GetLoadPosition(ArrayToPosition(Input.External[i][i2].To), Ground.CFrame)
				end
				
				if Input.External[i][i2].CFrame then
					Input.External[i][i2].CFrame = GetLoadCFrame(ArrayToCFrame(Input.External[i][i2].CFrame), Ground.CFrame)
					Input.External[i][i2].Position = Input.External[i][i2].CFrame.p
					Input.External[i][i2].Rotation = cframeRotation(Input.External[i][i2].CFrame)
					Input.External[i][i2].CFrame = nil
				end
				if Input.External[i][i2].Rotation then
					Input.External[i][i2].Rotation = rad(FixOrientation(Input.External[i][i2].Rotation))
				end
			end
		end
		
		local Heartbeat = game.RunService.Heartbeat

		local function MakeObjects(Target, Id)
			for i, v in next, Input.External[tostring(Id)] do 
				local Args = {
					Name = v.Name;
					Side = v.Side; 
					TargetModel = Target;
					Rot = v.Rotation;
					Pos = v.Position;
				}

				if v.Height then
					Args.TypeData = {
						Height = v.Height
					}
				end

				local Object = nil
				if v.Segment then
					Args = {
						ItemType = v.Name;
						From = v.Position;
						Segment = Target.ObjectModel.Railings[v.Segment]
					}
					Object = Build("Fence", Args)
				else
					Object = Build("Object", Args)
				end

				if Object then
					if v.Color then
						Detail(Object, "Object", ParseColorGroup(v.Color))
					end
					if v.Image then
						Call("SetPicture", {
							Object = Object,
							ID = v.Image
						})
					end
					if v.Id then
						MakeObjects(Object, v.Id)
					end
				end
			end
		end

		local ScreenGui = Instance.new("ScreenGui")
		local All = Instance.new("Frame")
		local Progress = Instance.new("Frame")
		local Label = Instance.new("TextLabel")

		ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
		ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		All.Name = "All"
		All.Parent = ScreenGui
		All.BackgroundColor3 = Color3.fromRGB(28, 218, 255)
		All.BorderSizePixel = 0
		All.Position = UDim2.new(0.249786139, 0, 0.88429755, 0)
		All.Size = UDim2.new(0.5, 0, 0.0500000007, 0)

		Progress.Name = "Progress"
		Progress.Parent = All
		Progress.BackgroundColor3 = Color3.fromRGB(137, 208, 255)
		Progress.BorderSizePixel = 0
		Progress.Size = UDim2.new(0, 0, 1, 0)

		Label.Name = "Label"
		Label.Parent = All
		Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Label.BackgroundTransparency = 1.000
		Label.Position = UDim2.new(0.400342166, 0, 0, 0)
		Label.Size = UDim2.new(0.197177067, 0, 1, 0)
		Label.Font = Enum.Font.Gotham
		Label.Text = "0% (0/0)"
		Label.TextColor3 = Color3.fromRGB(0, 0, 0)
		Label.TextSize = 14.000

		local TotalCount = #Input.Data

		for i, v in next, Input.Data do 
			local function BuildItem()
				local C = i/TotalCount
				local Percent = floor(C * 100)
				Label.Text = string.format("%s (%d / %d)", Percent.."%", i, TotalCount)
				Progress.Size = UDim2.new(C, 0, 1, 0)

				if v.Type == "Walls" then
					local Item = Build("Wall", {
						From = v.From;
						To = v.To;
					})

					if Item ~= nil then
						Detail(Item, "Wall", {
							Color = v.RC or MSGID;
							Material = v.RM or PlasticID
						}, "R")
						Detail(Item, "Wall", {
							Color = v.LC or MSGID;
							Material = v.LM or PlasticID
						}, "L")

						if v.Id then
							MakeObjects(Item, v.Id)
						end
					end
				elseif v.Type == "Floor" then
					local Args = {
						Points = v.Points
					}

					local Item = Build("Floor", Args)

					if Item ~= nil then
						if v.Color then
							Detail(Item, "Object", ParseColorGroup(v.Color))
						end
						if v.Id then
							MakeObjects(Item, v.Id)
						end
					end
				elseif v.Type == "Roof" then
					local Item = Build("Roof", {
						Settings = {
							Height = v.Height;
							Type = v.Name;
							IsPreview = true;
							RotateNum = 0;
						};
						Points = v.Points;
						Start = v.Points[#v.Points];
					})

					if Item ~= nil then
						if v.Color then
							Detail(Item, "Object", ParseColorGroup(v.Color))
						end
						if v.Id then
							MakeObjects(Item, v.Id)
						end
					end
				elseif v.Type == "Pools" then
					local Item = Build("Pool", {
						ItemType = v.Name;
						Center = v.Center;
						Size = Vector2.new(v.X, v.Y)
					})

					if Item ~= nil then
						if v.Color then
							Detail(Item, "Object", ParseColorGroup(v.Color))
						end
						if v.Id then
							MakeObjects(Item, v.Id)
						end
					end
				elseif v.Type == "Paths" then
					local Item = Build("Path", {
						From = v.From;
						To = v.To
					})

					if Item ~= nil then
						if v.Color then
							Detail(Item, "Object", ParseColorGroup(v.Color, v.Material))
						end
						if v.Id then
							MakeObjects(Item, v.Id)
						end
					end
				elseif v.Type == "Objects" or v.Type == "Counters" then
					local Args = {
						Name = v.Name;
						Side = v.Side;
						TargetModel = Ground;
						Rot = v.Rotation;
						Pos = v.Position;
					}

					if v.Height then
						Args.TypeData = {
							Height = v.Height
						}
					end

					local Object = nil
					if v.Segment then
						Args = {
							ItemType = v.Name;
							From = v.Position;
							Segment = Target.ObjectModel.Railings[v.Segment]
						}
						Object = Build("Fence", Args)
					else
						Object = Build("Object", Args)
					end

					local Type = v.Segment and "Fence" or "Object"

					if Object then
						if v.Color then
							Detail(Object, "Object", ParseColorGroup(v.Color))
						end
						if v.Image then
							Call("SetPicture", {
								Object = Object,
								ID = v.Image
							})
						end
						if v.Id then
							MakeObjects(Object, v.Id)
						end
					end
				elseif v.Type == "Fences" then
					local Item = Build("Fence", {
						From = v.From;
						To = v.To;
						ItemType = v.Name;
					})

					if Item ~= nil then
						if v.Color then
							Detail(Item, "Object", ParseColorGroup(v.Color))
						end
						if v.Id then
							MakeObjects(Item, v.Id)
						end
					end
				elseif v.Type == "Basements" then
					local Item = Build("Basement", {
						Center = v.Center;
						Size = Vector2.new(v.X, v.Y);
					})

					if Item ~= nil then
						if v.Color then
							Detail(Item, "Object", ParseColorGroup(v.Color))
						end
						if v.Id then
							MakeObjects(Item, v.Id)
						end
					end
				end
			end

			BuildItem()

			if BuildSettings.Time > 0 then
				wait(BuildSettings.Time)
			end
		end
		ScreenGui:Destroy()
	end

	local Objects = {}

	for i, v in next, ReplicatedStorage.ItemModels:GetChildren() do 
		for i2, v2 in next, v:GetChildren() do 
			Objects[v2.Name] = v2
		end
	end

	for i, v in next, ReplicatedStorage.ItemModels:GetChildren() do 
		for i2, v2 in next, v:GetChildren() do 
			Objects[v2.Name] = v2
		end
	end

	local function LoadPreview(Data)
		local Data = game:HttpGet("https://bloxburg.sexy/builds/fromId.php?Id=" .. Data)

		local success = pcall(function()
			Http:JSONDecode(Data)
		end)
		
		if success then
			local Plot = ReplicatedStorage.Stats[player.Name].IsBuilding.Value 
			local Ground = Plot.Ground

			local function FixOrientation(orientation)
				return orientation + Ground.Orientation.Y
			end

			local rad = math.rad

			local Input = Http:JSONDecode(Data)

			for i in next, Input.Data do 
				if Input.Data[i].From then
					Input.Data[i].From = GetLoadPosition(ArrayToPosition(Input.Data[i].From), Ground.CFrame)
				end
				if Input.Data[i].To then
					Input.Data[i].To = GetLoadPosition(ArrayToPosition(Input.Data[i].To), Ground.CFrame)
				end
				if Input.Data[i].Position then
					Input.Data[i].Position = GetLoadPosition(ArrayToPosition(Input.Data[i].Position), Ground.CFrame)
				end
				if Input.Data[i].CFrame then
					Input.Data[i].CFrame = GetLoadCFrame(ArrayToCFrame(Input.Data[i].CFrame), Ground.CFrame)
				end
				if Input.Data[i].Rotation then
					Input.Data[i].Rotation = rad(FixOrientation(Input.Data[i].Rotation))
				end
				if Input.Data[i].Center then
					Input.Data[i].Center = ArrayToCFrame(Input.Data[i].Center)
				end
				if Input.Data[i].Points then
					for k, v in next, Input.Data[i].Points do 
						Input.Data[i].Points[k] = GetLoadPosition(ArrayToPosition(Input.Data[i].Points[k]), Ground.CFrame)
					end
				end
			end
		
			for i in next, Input.External do 
				for i2 in next, Input.External[i] do 
					if Input.External[i][i2].From then
						Input.External[i][i2].From = GetLoadPosition(ArrayToPosition(Input.External[i][i2].From), Ground.CFrame)
					end
					if Input.External[i][i2].To then
						Input.External[i][i2].To = GetLoadPosition(ArrayToPosition(Input.External[i][i2].To), Ground.CFrame)
					end
					if Input.External[i][i2].Position then
						Input.External[i][i2].Position = GetLoadPosition(ArrayToPosition(Input.External[i][i2].Position), Ground.CFrame)
					end
					if Input.External[i][i2].Rotation then
						Input.External[i][i2].Rotation = rad(FixOrientation(Input.External[i][i2].Rotation))
					end
					if Input.External[i][i2].CFrame then
						Input.External[i][i2].CFrame = GetLoadCFrame(ArrayToCFrame(Input.External[i][i2].CFrame), Ground.CFrame)
					end
				end
			end

			local Preview = workspace:FindFirstChild("BuildPreviewer")
			if Preview == nil then
				Preview = Instance.new("Model", workspace)
				Preview.Name = "BuildPreviewer"
			else
				Preview:ClearAllChildren()
			end
		
			local function NewGhost(properties)
				local Item = Instance.new("Part", Preview)
				Item.Anchored = true
				Item.CanCollide = false
				Item.Transparency = 0.5
				Item.Material = "Plastic"
				for i, v in next, properties do 
					Item[i] = v
				end
				return Item
			end

			local function PreviewExternal(Object, Id)
				for i, v in next, Input.External[tostring(Id)] do 
					local Clone = Objects[v.Name]:Clone()
					Clone.Parent = Object
					for i, v in next, Clone:GetDescendants() do 
						if v:IsA("BasePart") then
							v.CanCollide = false
							if v.Transparency < 1 then
								v.Transparency = 0.5
							end
						end
					end

					if v.CFrame ~= nil then 
						Clone:SetPrimaryPartCFrame(v.CFrame)
					end

					if v.Image then
						if Clone:FindFirstChild("Canvas") then
							Clone.Canvas.Decal.Texture = "rbxassetid://"..v.Image
							Clone.Canvas.Decal.Transparency = 0.5
						end
					end

					if v.Height then
						local _, Size = Clone:GetBoundingBox()
						local Y = Size.Y
						for e = 1, v.Height - 1 do
							local Clone2 = Clone:Clone()
							Clone2.Position = Clone.Position + Vector3.new(0, Y * e, 0)
							Clone2.Parent = Clone.Parent
						end
					end

					if v.Color then
						for _ = 1, 4 do 
							if Clone:FindFirstChild("ColorGroup" .. tostring(_)) and v.Color[_] ~= nil then
								local ColorGroup = Clone:FindFirstChild("ColorGroup" .. tostring(_))

								if ColorGroup:FindFirstChild("Object") then
									local Target = ColorGroup.Object.Value

									if Target:IsA("BasePart") then
										Target.BrickColor = BrickColor.new(v.Color[_][1])
									end
								end
							end
						end
					end

					if v.Id then
						PreviewExternal(Clone, v.Id)
					end
				end
			end
			for i, v in next, Input.Data do
				--spawn(function()
					if v.Type == "Walls" then
						local distance = (v.From - v.To).magnitude

						local WallModel = Instance.new("Model", Preview)

						if v.RC or v.LC then
							local Item = NewGhost({
								CFrame = (CFrame.new(v.From, v.To) - Vector3.new(0.125, 0, 0)) * CFrame.new(0, 0, - distance / 2);
								Size = Vector3.new(0.25, 12, distance);
								TopSurface = "Smooth"
							})
							Item.Parent = WallModel
							Item.Transparency = 0.5

							local Item2 = NewGhost({
								CFrame = (CFrame.new(v.From, v.To) + Vector3.new(0.125, 0, 0)) * CFrame.new(0, 0, - distance / 2);
								Size = Vector3.new(0.25, 12, distance);
								TopSurface = "Smooth"
							})

							Item2.Parent = WallModel
							Item2.Transparency = 0.5

							if v.RC then
								Item.BrickColor = BrickColor.new(v.RC)
							end

							if v.LC then
								Item2.BrickColor = BrickColor.new(v.LC)
							end
						else
							local Item = NewGhost({
								CFrame = CFrame.new(v.From, v.To) * CFrame.new(0, 0, - distance / 2);
								Size = Vector3.new(0.5, 12, distance);
								TopSurface = "Smooth"
							})
							Item.Parent = WallModel
						end

						if v.Id then
							PreviewExternal(WallModel, v.Id)
						end
					elseif v.Type == "Roof" then
						local Item = Modules.RoofHandler:CreateRoof(Plot, v.Points, {
							Height = v.Height,
							Type = v.Name,
							IsPreview = false,
							RotateNum = 0
						})

						for i2, v2 in next, Item.Model:GetDescendants() do
							if v2 and v2:IsA("BasePart") then
								v2.CanCollide = false
								if v2.Transparency < 1 then
									v2.Transparency = 0.5
								end
								if v.Color then
									v2.BrickColor = BrickColor.new(v.Color[1][1])
								end
							end
						end

						Item.Model.Parent = Preview
						if v.Id then
							PreviewExternal(Item.Model, v.Id)
						end
					elseif v.Type == "Fences" then
						local Success, Info = Modules.FenceHandler:CreateFence(Plot, v.Name, v.From, v.To)
						if Success == true then
							local Model = Info:GetModel()
							Model.Parent = Preview
							for i2, v2 in next, Model:GetDescendants() do
								if v2 and v2:IsA("BasePart") then
									v2.CanCollide = false
									if v2.Transparency < 1 then
										v2.Transparency = 0.5
									end
								end
							end
						end
						if v.Id then
							PreviewExternal(Clone, v.Id)
						end
					elseif v.Type == "Floor" then
						local Outline = Modules.Polygon:fromPoints(v.Points)

						local Item
						if v.Color then
							Item = Outline:Fill(function(a, b)
								a.Transparency = 0.5;
								a.Size = Vector3.new(0.25, a.Size.Y, a.Size.Z);
								a.CFrame = a.CFrame;
								a.Parent = b;
								a.CanCollide = false
								a.BrickColor = BrickColor.new(v.Color[1][1])
							end, Preview)
							Item.Parent = Preview
						else
							Item = Outline:Fill(function(a, b)
								a.Transparency = 0.5;
								a.Size = Vector3.new(0.25, a.Size.Y, a.Size.Z);
								a.CFrame = a.CFrame;
								a.Parent = b;
								a.CanCollide = false
							end, Preview)
							Item.Parent = Preview
						end

						if v.Id then
							PreviewExternal(Item, v.Id)
						end
					elseif v.Type == "Pools" then
						local Item = NewGhost({
							CFrame = GetLoadCFrame(v.Center, Ground.CFrame);
							Size = Vector3.new(v.X, 1, v.Y);
							Material = "Water";
							BrickColor = BrickColor.new("Pastel Blue")
						})
						if v.Id then
							PreviewExternal(Item, v.Id)
						end
					elseif v.Type == "Paths" then
						local Corner1 = NewGhost({
							Size = Vector3.new(0.05, 4.5, 4.5);
							Shape = "Cylinder";
							Position = v.From;
							Rotation = Vector3.new(0, 0, 90);
						})
						local Corner2 = NewGhost({
							Size = Vector3.new(0.05, 4.5, 4.5);
							Shape = "Cylinder";
							Position = v.To;
							Rotation = Vector3.new(0, 0, 90);
						})
						local distance = (v.From - v.To).magnitude
						local Item = NewGhost({
							CFrame = CFrame.new(v.From, v.To) * CFrame.new(0, 0, - distance / 2);
							Size = Vector3.new(4.5, 0.05, distance);
							TopSurface = "Smooth"
						})
						if v.Color then
							Corner1.BrickColor = BrickColor.new(v.Color)
							Corner2.BrickColor = BrickColor.new(v.Color)
							Item.BrickColor = BrickColor.new(v.Color)
						end
						if v.Id then
							PreviewExternal(Item, v.Id)
						end
					elseif v.Type == "Basements" then
						local Item = NewGhost({
							CFrame = GetLoadCFrame(v.Center, Ground.CFrame);
							Size = Vector3.new(v.X, 2, v.Y);
							BrickColor = BrickColor.new("Black")
						})
						if v.Id then
							PreviewExternal(Item, v.Id)
						end
					elseif v.Type == "Objects" then
						local Clone = Objects[v.Name]:Clone()
						Clone.Parent = Preview
						for i, v in next, Clone:GetDescendants() do
							if v:IsA("BasePart") then
								v.CanCollide = false
								if v.Transparency < 1 then
									v.Transparency = 0.5
								end
							end
						end

						if v.CFrame ~= nil then
							Clone:SetPrimaryPartCFrame(v.CFrame)
						end

						if v.Height then
							Modules.ElevatorHandler:UpdateElevatorHeight(Clone, v.Height, true)
						end
						if v.Image then
							if Clone:FindFirstChild("Canvas") then
								Clone.Canvas.Decal.Texture = "rbxassetid://"..v.Image
								Clone.Canvas.Decal.Transparency = 0.5
							end
						end
						if v.Color then
							for _ = 1, 4 do
								if Clone:FindFirstChild("ColorGroup" .. tostring(_)) and v.Color[_] ~= nil then
									local ColorGroup = Clone:FindFirstChild("ColorGroup" .. tostring(_))
									if ColorGroup:FindFirstChild("Object") then
										local Target = ColorGroup.Object.Value
										if Target:IsA("BasePart") then
											Target.BrickColor = BrickColor.new(v.Color[_][1])
										end
									end
								end
							end
						end
						if v.Id then
							PreviewExternal(Clone, v.Id)
						end
					end
				--end)
			end
			if player.PlayerGui.MainGUI:FindFirstChild("BuildMenu") and player.PlayerGui.MainGUI.BuildMenu:FindFirstChild("Build") then
				FireConnection(player.PlayerGui.MainGUI.BuildMenu.Build.MouseButton1Click)
			end
		end
	end

	local function BulldozePlot(Plot)
		for i, v in next, Plot.House:GetChildren() do 
			for k, x in next, v:GetChildren() do
				if x.Name ~= "Poles" then
					Call("BulldozePlot", {
						Exclude = {}
					})
				end
			end
		end
	end

	local PlayerList, PlayerHouses = {}, {}

	local function PlayerAdded(plr)
		table.insert(PlayerList, plr.Name)
		table.insert(PlayerHouses, plr.Name.."'s house")
	end

	local function PlayerRemoving(plr)
		table.remove(PlayerList, table.find(PlayerList, plr.Name))
		table.remove(PlayerHouses, table.find(PlayerHouses, plr.Name.."'s house"))
	end

	Players.PlayerAdded:Connect(PlayerAdded)
	Players.PlayerRemoving:Connect(PlayerRemoving)

	for i, v in next, Players:GetPlayers() do 
		PlayerAdded(v)
	end

	local Window = library:Window("Bloxburg", "Epic Thing")

	local Tabs = {
		AutoBuild = Window:Tab("Auto Build");
		Autofarm = Window:Tab("Autofarm");
		Misc = Window:Tab("Misc");
		AutoMood = Window:Tab("Auto Mood");
		Trolling = Window:Tab("Trolling");
		Vehicle = Window:Tab("Vehicle");
		PrivateServerFarm = Window:Tab("Code Farm");
		StatViewer = Window:Tab("Stat Viewer");
		ServerInvite = Window:Tab("Discord Server");
	}

	local Sections = {
		AutoBuild = {
			Save = Tabs.AutoBuild:Section("Save");
			Build = Tabs.AutoBuild:Section("Build");
			BuildSettings = Tabs.AutoBuild:Section("Settings");
		};
		Autofarm = {
			Main = Tabs.Autofarm:Section("Main");
			Settings = Tabs.Autofarm:Section("Settings");
			Stats = Tabs.Autofarm:Section("Stats");
		};
		Misc = {
			Random = Tabs.Misc:Section("Random");
			AutoDrive = Tabs.Misc:Section("Auto Drive");
			Sky = Tabs.Misc:Section("Sky");
			FakeMessage = Tabs.Misc:Section("Fake Message");
			FakePaycheck = Tabs.Misc:Section("Fake Paycheck");
			Skills = Tabs.Misc:Section("Skills");
		};
		AutoMood = {
			Automatic = Tabs.AutoMood:Section("Automatic");
			Manual = Tabs.AutoMood:Section("Manual");
			AutoCook = Tabs.AutoMood:Section("Auto Cook");
		};
		Trolling = {
			Server = Tabs.Trolling:Section("Server");
		};
		Vehicle = {
			Mods = Tabs.Vehicle:Section("Modifications (re-enter vehicle to apply)");
		};
		PrivateServerFarm = {
			Main = Tabs.PrivateServerFarm:Section("Main");
			Settings = Tabs.PrivateServerFarm:Section("Settings");
		};
		ServerInvite = {
			Invite = Tabs.ServerInvite:Section("Invite");
		};
		StatViewer = {
			Viewer = Tabs.StatViewer:Section("Stat Viewer")
		}
	}

	if game:HttpGet("https://bloxburg.sexy/version.php") ~= tostring(ReplicatedStorage.Version.Value) then 
		Window:Notification("Error", {
			Text = "Bloxburg has updated\nthe script may not work\nand/or be vulnurable";
			ConfirmText = "Okay";
		})
	end

	Sections.ServerInvite.Invite:Button("Copy Server Invite", function()
		setclipboard(game:HttpGet("https://bloxburg.sexy/getinvite.php"))
	end)

	Sections.PrivateServerFarm.Main:Toggle("Enabled", function(value)
		getgenv().PSEnabled = value
		if value == true then
			syn.queue_on_teleport([[
				getgenv().PSEnabled = ]]..tostring(getgenv().PSEnabled)..[[
				
				getgenv().PSOutput = ']]..tostring(getgenv().PSOutput)..[['
			
				getgenv().PSFileName = ']]..tostring(getgenv().PSFileName)..[['
				
				getgenv().PSWebhook = ']]..tostring(getgenv().PSWebhook)..[['
				
				shared.whitelist_key = ']]..shared.whitelist_key..[[';
				local content = game:HttpGet("https://sor.cool/whitelist/getfile.lua?ID=]]..getreg().ID..[[&type=script")
				assert(loadstring(content))()
			]])
			TeleportService:Teleport(185655149)
		end
	end)

	Sections.PrivateServerFarm.Main:Button("Scan Server For Codes", function()
		local Output = getgenv().PSOutput
		local Amount = 0

		if Output == "File" and not isfile(PSFileName..".txt") then 
			writefile(PSFileName..".txt", "")
		end

		for i,v in next, ReplicatedStorage.Stats:GetChildren() do 
			if v.Name ~= player.Name then
				local PrivateServer = v.PrivateServer
				if PrivateServer.RenewTime.Value > os.time() and PrivateServer.JoinPermission.Value == 0 then
					Amount = Amount + 1
					if Output == "File" then
						appendfile(PSFileName..".txt", v.Name.."\n")
					elseif Output == "Webhook" then
						upload_code(v.Name)
					end
				end 
			end
		end

		Window:Notification("Message", {
			Text = "Success!\n"..tostring(Amount).." Codes Were Found";
			ConfirmText = "Okay";
		})
	end)

	local function GetVehicleSpawn()
		local Objects = workspace.Plots["Plot_"..player.Name].House.Objects
		for i,v in next, Objects:GetChildren() do 
			if v:FindFirstChild("ObjectData") and v:FindFirstChild("ObjectModel") then 
				if v.ObjectData:FindFirstChild("Spawned") and v.ObjectModel:FindFirstChild("Stand") then 
					if typeof(v.ObjectData.Spawned.Value) == "Instance" and v.ObjectData.Spawned.Value.Name:sub(1, 8) == "Vehicle_" then 
						return v
					end
				end
			end
		end
		for i,v in next, Objects:GetChildren() do 
			if v:FindFirstChild("ObjectData") and v:FindFirstChild("ObjectModel") then 
				if v.ObjectData:FindFirstChild("Spawned") and v.ObjectModel:FindFirstChild("Stand") then 
					if v.ObjectModel:FindFirstChild("Vehicle") then 
						return v
					end
				end
			end
		end
	end

	Sections.PrivateServerFarm.Settings:Picker("Output Location", {"File", "Webhook"}, function(value)
		getgenv().PSOutput = value
	end)

	Sections.PrivateServerFarm.Settings:Box("File Name", function(value)
		getgenv().PSFileName = value
	end)

	Sections.PrivateServerFarm.Settings:Box("Webhook Url", function(value)
		getgenv().PSWebhook = value
	end)

	Sections.Vehicle.Mods:Slider("Forward Speed", {min = 0, max = 100}, function(value)
		for i,v in next, Modules.VehicleData do 
			v.ForwardSpeed = value
		end
	end)

	Sections.Vehicle.Mods:Slider("Reverse Speed", {min = 0, max = 100}, function(value)
		for i,v in next, Modules.VehicleData do 
			v.ReverseSpeed = value
		end
	end)

	Sections.Vehicle.Mods:Slider("Turn Speed", {min = 0, max = 100}, function(value)
		for i,v in next, Modules.VehicleData do 
			v.TurnSpeed = value
		end
	end)

	Sections.Vehicle.Mods:Slider("Spring", {min = 0, max = 50}, function(value)
		for i,v in next, Modules.VehicleData do 
			v.SpringLength = value
		end
	end)

	Sections.Trolling.Server:Button("Crash Server", function()
		local Vehicle = GetVehicleSpawn() 
		if Vehicle then 

			require(player.PlayerGui.MainGUI.Scripts.Hotbar):ToPlot()
			repeat
				wait()
			until player.PlayerGui.MainGUI:FindFirstChild("LoadingFrame_ToPlot")
			repeat
				wait()
			until not player.PlayerGui.MainGUI:FindFirstChild("LoadingFrame_ToPlot")
			wait(3)
			CoolTween(Vehicle.ObjectModel.Stand.CFrame, 25)

			while RunService.RenderStepped:Wait() do
				Remotes.Interact:FireServer({
					Target = Vehicle, 
					Path = "3"
				})
				
				Remotes.Interact:FireServer({
					Target = Vehicle, 
					Path = "1"
				})
			end
		else 
			Window:Notification("Error", {
				Text = "There Must Be a Vehicle Spawner On Your Plot";
				ConfirmText = "Okay";
			})
		end
	end)

	Sections.Trolling.Server:Button("Destroy Car (driver seat only)", function()
		for i, v in next, player.Character:GetChildren() do
			if v.Name:sub(0, 8) == "Vehicle_" then 
				v.Chassi:Destroy()
			end
		end
	end)

	Sections.AutoBuild.Save:SearchBox("Target player", PlayerList, function(target)
		local Plot = workspace.Plots:FindFirstChild("Plot_" .. target)
		if Plot then
			SaveSettings.TargetName = target
			SaveSettings.Target = Plot
		else 
			Window:Notification("Error", {
				Text = "Target's Plot Does Not Exist";
				ConfirmText = "Okay";
			})
		end
	end)

	Sections.AutoBuild.Save:Button("Save Build", function()
		local Target = SaveSettings.Target
		local TargetName = SaveSettings.TargetName
		local BuildData = SavePlot(Target)

		local PlotData = Http:JSONEncode(BuildData)

		if Target then
			if not Target:FindFirstChild("LODModel") then
				if not isfolder("bloxburg") then 
					makefolder("bloxburg")
				end
				
				local Output = SaveSettings.Output
				local name = TargetName .. ".bet"
				--if Output == "Cloud" then
				local response = syn.request({
					Url = "https://bloxburg.sexy/builds/upload";
					Method = "POST";
					Headers = {
						["Content-Type"] = "application/json"
					};
					Body = PlotData
				})
				local ValueVariables = BuildData.Value
				if response.Body:find("status") and response.Body:find("output") then
					local parsed_response = Http:JSONDecode(response.Body)
					if parsed_response.status == "success" then
						setclipboard(parsed_response.output)
						Window:Notification("Message", {
							Text = "Build ID Copied to clipboard\nTotal Value: " .. tostring(ValueVariables.TotalValue) .. "\nBlockbux Value: " .. tostring(ValueVariables.BlockbuxValue);
							ConfirmText = "Okay";
						})
					else
						writefile("bloxburg/".. name, PlotData)
						Window:Notification("Error", {
							Text = parsed_response.status .. "\nSaved build as file \n" .. name .. "\nTotal Value: " .. tostring(ValueVariables.TotalValue) .. "\nBlockbux Value: " .. tostring(ValueVariables.BlockbuxValue);
							ConfirmText = "Okay";
						})
					end
				else
					writefile("bloxburg/".. name, PlotData)
					Window:Notification("Error", {
						Text = "Error occured\nSaved build as file \n" .. name .. "\nTotal Value: " .. tostring(ValueVariables.TotalValue) .. "\nBlockbux Value: " .. tostring(ValueVariables.BlockbuxValue);
						ConfirmText = "Okay";
					})
				end
			else 
				Window:Notification("Error", {
					Text = "Target Plot is Not Rendered";
					ConfirmText = "Okay";
				})
			end
		else 
			Window:Notification("Error", {
				Text = "Target Not Selected";
				ConfirmText = "Okay";
			})
		end
	end)

	Sections.AutoBuild.Build:Box("Build ID", function(id)
		BuildSettings.Id = id
	end)

	Sections.AutoBuild.Build:Button("Show Preview", function()
		local id = BuildSettings.Id
		if id then 
			LoadPreview(id)
		else 
			Window:Notification("Error", {
				Text = "Target Not Selected";
				ConfirmText = "Okay";
			}) 
		end
	end)

	Sections.AutoBuild.Build:Button("Destroy Preview", function()
		local Preview = workspace:FindFirstChild("BuildPreviewer")
		if Preview and #Preview:GetChildren() > 0 then 
			Preview:ClearAllChildren()
		else 
			Window:Notification("Error", {
				Text = "Preview Doesn't Exist";
				ConfirmText = "Okay";
			})
		end
	end)

	Sections.AutoBuild.Build:Button("Start Building", function()
		local id = BuildSettings.Id
		if id then
			local Preview = workspace:FindFirstChild("BuildPreviewer")
			if Preview then
				Preview:ClearAllChildren()
			end
			LoadPlot(game:HttpGet("https://bloxburg.sexy/builds/fromId.php?Id=" .. id))
		else 
			Window:Notification("Error", {
				Text = "Target Not Selected";
				ConfirmText = "Okay";
			})
		end
	end)

	Sections.AutoBuild.Build:Button("Bulldoze Current Plot", function()
		BulldozePlot(ReplicatedStorage.Stats[player.Name].IsBuilding.Value)
	end)

	Sections.AutoBuild.BuildSettings:Slider("Extra Build Delay", {
		min = 0,
		max = 5000,
		default = 0
	}, function(value)
		BuildSettings.Time = value
	end)

	Sections.AutoBuild.BuildSettings:Toggle("Use Vehicles", function(value)
		BuildSettings.UseCar = value
	end)

	Sections.AutoBuild.BuildSettings:Toggle("Use Blockbux", function(value)
		BuildSettings.UseBux = value
	end)


	Sections.AutoBuild.BuildSettings:Slider("Max Item Cost (Money)", {
		min = 0,
		max = 200000,
		default = 200000
	}, function(value)
		BuildSettings.MaxCost = value
	end)

	Sections.AutoBuild.BuildSettings:Slider("Max Item Cost (Blockbux)", {
		min = 0,
		max = 10000,
		default = 0
	}, function(value)	
		BuildSettings.MaxBux = value
	end)

	local StatLabels = {
		EarningsLabel = Sections.Autofarm.Stats:Label("");
		TimeLabel = Sections.Autofarm.Stats:Label("");
	}

	local AutofarmSettings = {
		ActiveJob = nil;
		WorkEnabled = false;
	}

	local ColorsValue = {
		"Dark stone grey";
		"Dark orange";
		"Deep orange";
		"Lime green";
		"Royal purple";
	}

	local mt = getrawmetatable(game)
	local oldNamecall = mt.__namecall 
	setreadonly(mt, false)

	mt.__namecall = newcclosure(function(self, ...)
		local args = {
			...
		} 
		if checkcaller() and getnamecallmethod() == "FireServer" and args[1].Order and args[1].Workstation then
			if args[1].Workstation.Parent.Name == "HairdresserWorkstations" and ActiveJob == "Hairdresser" then

				args[1].Order = {
					args[1].Workstation.Occupied.Value.Order.Style.Value,
					args[1].Workstation.Occupied.Value.Order.Color.Value
				}

				return oldNamecall(self, unpack(args))

			elseif args[1].Workstation.Parent.Name == "CashierWorkstations" and ActiveJob == "Cashier (Burger)" then 

				args[1].Order = {
					args[1].Workstation.Occupied.Value.Order.Burger.Value,
					args[1].Workstation.Occupied.Value.Order.Fries.Value,
					args[1].Workstation.Occupied.Value.Order.Cola.Value
				}

				return oldNamecall(self, unpack(args))

			elseif args[1].Workstation.Parent.Name == "BakerWorkstations" and ActiveJob == "Pizza Baker" then 

				args[1].Order = {
					true, 
					true, 
					true, 
					args[1].Workstation.Order.Value
				}

				return oldNamecall(self, unpack(args))

			end
		end

		return oldNamecall(self, ...)
	end)

	setreadonly(mt, true)

	local function FindClosest(Item)
		local closestBlock = nil
		local closestDistance = huge
		if Item == "Stone" then
			repeat
				wait()
			until workspace.Environment.Locations:FindFirstChild("MinerCave")
			local closestY = huge
			for i, v in next, workspace.Environment.Locations.MinerCave.Folder:GetChildren() do
				if player:DistanceFromCharacter(v.PrimaryPart.Position) < closestDistance and v.PrimaryPart.Position.Y < closestY then
					if (not v:FindFirstChild("B")) or (v:FindFirstChild("B").BrickColor.Name ~= "Bright red") then 
						closestDistance = player:DistanceFromCharacter(v.PrimaryPart.Position)
						closestBlock = v
						closestY = v.PrimaryPart.Position.Y
					end
				end
			end
		elseif Item == "Valuable" then
			repeat
				wait()
			until workspace.Environment.Locations:FindFirstChild("MinerCave")
			local bestColor = "Dark stone grey"
			for i, v in next, workspace.Environment.Locations.MinerCave.Folder:GetChildren() do
				if v:FindFirstChild("M") then
					if table.find(ColorsValue, bestColor) < table.find(ColorsValue, v:FindFirstChild("M").BrickColor.Name) then
						closestBlock = v
						bestColor = v:FindFirstChild("M").BrickColor.Name
					elseif table.find(ColorsValue, bestColor) == table.find(ColorsValue, v:FindFirstChild("M").BrickColor.Name) then
						if player:DistanceFromCharacter(v.PrimaryPart.Position) < closestDistance then
							closestDistance = player:DistanceFromCharacter(v.PrimaryPart.Position)
							closestBlock = v
						end
					end
				end
			end
			if closestBlock == nil then
				closestBlock = FindClosest("Stone")
			end
		elseif Item == "Trash" then
			for i, v in next, workspace.Environment.Locations.GreenClean.Spawns:GetChildren() do
				if player:DistanceFromCharacter(v.Position) < closestDistance and v:FindFirstChildWhichIsA("Decal", true) then
					closestDistance = player:DistanceFromCharacter(v.Position)
					closestBlock = v
				end
			end
			if closestBlock == nil then
				wait(0.5)
				FindClosest("Trash")
			end
		elseif Item == "Tree" then
			for i, v in next, workspace.Environment.Trees:GetChildren() do
				if player:DistanceFromCharacter(v.PrimaryPart.Position) < closestDistance and v.PrimaryPart.Position.Y > 5 then
					closestDistance = player:DistanceFromCharacter(v.PrimaryPart.Position)
					closestBlock = v
				end
			end
		elseif Item == "Crate" then
			for i, v in next, workspace.Environment.Locations.Supermarket.Crates:GetChildren() do
				if player:DistanceFromCharacter(v.Position) < closestDistance and v.Name == "Crate" then
					closestDistance = player:DistanceFromCharacter(v.Position)
					closestBlock = v
				end
			end
			if closestBlock == nil then
				wait(0.5)
				FindClosest("Crate")
			end
		elseif Item == "EmptyShelf" then
			for i, v in next, workspace.Environment.Locations.Supermarket.Shelves:GetChildren() do
				if player:DistanceFromCharacter(v.PrimaryPart.Position) < closestDistance and v.IsEmpty.Value == true then
					closestDistance = player:DistanceFromCharacter(v.PrimaryPart.Position)
					closestBlock = v
				end
			end
			if closestBlock == nil then
				wait(0.5)
				FindClosest("EmptyShelf")
			end
		elseif Item == "PizzaCrate" then
			for i, v in next, workspace.Environment.Locations.PizzaPlanet.IngredientCrates:GetChildren() do
				local dis = (player.Character.HumanoidRootPart.Position - v.Position).magnitude
				if dis < closestDistance then
					closestDistance = dis
					closestBlock = v
				end
			end
			if closestBlock == nil then
				wait(0.5)
				FindClosest("PizzaCrate")
			end
		end
		return closestBlock
	end

	local toGo = nil
	local Vehicle

	local LocationCFrame = {
		["Pizza Planet"] = CFrame.new(1092.59473, 13.6776829, 249.286835);
		["Bloxy Burgers"] = CFrame.new(877.985901, 13.070406, 267.987854);
		["Stylez Hairdresser"] = CFrame.new(902.504822, 13.0960951, 166.004135);
		["Lake"] = CFrame.new(985.374207, 13.1055984, 1061.12622);
		["Mike's Motors"] = CFrame.new(1095.50464, 12.9041576, 384.505646);
		["Nightclub"] = CFrame.new(1068.34241, 12.9559097, 27.2332954);
		["City Hall"] = CFrame.new(994.741943, 13.1551933, -225.07254);
		["Gym"] = CFrame.new(841.105408, 12.9554825, -100.579193);
		["BFF Supermarket"] = CFrame.new(840.207581, 13.0544462, -14.4691305);
		["Fancy Furniture"] = CFrame.new(1095.1908, 13.1559048, 139.72467);
		["Lovely Lumber"] = CFrame.new(614.160645, 13.0296869, 772.316162);
		["Cave"] = CFrame.new(519.167419, 13.0106106, 728.404419);
		["Ben's Ice Cream"] = CFrame.new(943.374939, 13.0542393, 1017.85272);
		["Ferris Wheel"] = CFrame.new(986.463562, 13.0917492, 1089.16406);
	}

	local locationNames = {}

	for i in next, LocationCFrame do 
		table.insert(locationNames, i)
	end

	Sections.Misc.AutoDrive:SearchBox("Location", locationNames, function(die)
		toGo = die
	end)

	Sections.Misc.AutoDrive:SearchBox("Player Location", PlayerList, function(die)
		toGo = die
	end)

	Sections.Misc.AutoDrive:SearchBox("Player Houses", PlayerHouses, function(die)
		toGo = die
	end)

	local tween
	local stop = false

	local function VehicleTween(item, target, speed)
		local dist = (item.Position - target.p).magnitude
		tween = game:GetService("TweenService"):Create(item, TweenInfo.new(dist / speed, Enum.EasingStyle.Linear), {
			CFrame = target
		})
		tween:Play()
		tween.Completed:wait()
	end

	local function playerLocations()
		local plrPos = {}
		for i, v in next, PlayerList do
			local PlayerCharacter = Players[v].Character
			if PlayerCharacter and PlayerCharacter:FindFirstChild("HumanoidRootPart") then
				plrPos[v] = PlayerCharacter.HumanoidRootPart.CFrame
			end
		end
		return plrPos
	end

	local function houseLocations()
		local housePos = {}
		for i, v in next, PlayerList do
			pcall(function()
				housePos[v.."'s house"] = workspace.Plots["Plot_" .. v].FrontObjects.ItemHolder["Basic Mailbox"].CFrame
			end)
		end
		return housePos
	end

	Sections.Misc.AutoDrive:Button("Drive", function()
		for i, v in next, player.Character:GetChildren() do
			if v.Name:sub(0, 8) == "Vehicle_" then 
				Vehicle = v
			end
		end
		if not Vehicle then 
			Window:Notification("Error", {
				Text = "You must be on a vehicle!";
				ConfirmText = "Okay";
			})
		else 
			local oldg = workspace.Gravity
			workspace.Gravity = 0
			local _, VehicleSize = Vehicle:GetBoundingBox()
			local LocationPath = PathfindingService:CreatePath()

			local placeToGo = LocationCFrame[toGo] or playerLocations()[toGo] or houseLocations()[toGo]
			LocationPath:ComputeAsync(player.Character.HumanoidRootPart.Position, placeToGo.p)
			local LocationPoints = LocationPath:GetWaypoints({
				AgentRadius = VehicleSize.X;
				AgentHeight = VehicleSize.Y
			})

			driving = true

			for i, v in next, LocationPoints do
				if stop then 
					stop = false 
					workspace.Gravity = oldg
					break 
				end
				if i % 10 == 0 then
					VehicleTween(Vehicle.PrimaryPart, CFrame.new(v.Position.X, v.Position.Y + 5, v.Position.Z, unpack(GetRelativeComponents(v.Position + Vector3.new(0, 5, 0)))), 60)
				end
			end
			workspace.Gravity = oldg
			if tween then
				tween:Cancel()
				tween = nil
			end
			driving = false
		end
	end)

	Sections.Misc.AutoDrive:Button("Stop Driving", function()
		stop = true
	end)

	local DeliveryFunctions = {
		GoPizzaPlanet = nil;
		GoCustomer = nil;
	}

	local function DeliveryMovement(vehicle, cf)
		local Speed = 35
		vehicle.PrimaryPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
		local New = CFrame.new(cf.X, -50, cf.Z)
		local BodyVel = Instance.new('BodyVelocity', vehicle.PrimaryPart)
		BodyVel.MaxForce = Vector3.new(9e9, 9e9, 9e9)
		BodyVel.P = Speed
		repeat
			local to = (New.p - vehicle.PrimaryPart.Position).Unit * Speed
			BodyVel.Velocity = to 
			wait()
		until (vehicle.PrimaryPart.Position - New.p).Magnitude <= 5
		BodyVel.Velocity = Vector3.new(0, 0, 0)
	end

	DeliveryFunctions.GoPizzaPlanet = function(isfromcustomer)
		if ActiveJob == "Delivery Person" and WorkEnabled then
			repeat
				wait(0.1)
			until JobActions.IsWorking()
			Call("UsePizzaMoped", {})
			repeat
				wait(0.1)
			until player.Character:FindFirstChild("Vehicle_Delivery Moped") or WorkEnabled == false and ActiveJob ~= "Delivery Person"
			if player.Character:FindFirstChild("Vehicle_Delivery Moped") then
				local customer = nil
				player.Character:SetPrimaryPartCFrame(CFrame.new(1170, 13, 275))
				repeat
					wait(0.1)
					customer = Remotes["TakePizzaBox"]:InvokeServer({
						Box = workspace.Environment.Locations:WaitForChild("PizzaPlanet"):WaitForChild("Conveyor"):WaitForChild("MovingBoxes"):FindFirstChildOfClass("UnionOperation")
					})
				until customer ~= nil or WorkEnabled == false and ActiveJob ~= "Delivery Person"
				player.Character:SetPrimaryPartCFrame(CFrame.new(1170, -50, 275))
				DeliveryFunctions.GoCustomer(customer)
			end
		end
	end

	DeliveryFunctions.GoCustomer = function(customer)
		if customer == nil then
			wait(0.1)
			DeliveryFunctions.GoPizzaPlanet()
		else
			if ActiveJob == "Delivery Person" and WorkEnabled and player.Character:FindFirstChild("Vehicle_Delivery Moped") then
				DeliveryMovement(player.Character:FindFirstChild("Vehicle_Delivery Moped"), customer:WaitForChild("HumanoidRootPart").CFrame - Vector3.new(0, 50, 0))
				player.Character:SetPrimaryPartCFrame(customer:WaitForChild("HumanoidRootPart").CFrame - Vector3.new(0, 10, 0))
				repeat
					Remotes["DeliverPizza"]:FireServer({
						Customer = customer
					})
					wait(0.1)
				until not player.Character:FindFirstChild("Pizza Box") or WorkEnabled == false or not player.Character:FindFirstChild("Vehicle_Delivery Moped")
				DeliveryFunctions.GoPizzaPlanet(true)
			end
		end
	end

	local driving = false
	local GoToStation = false

	--//Noclip
	RunService.Heartbeat:Connect(function()
		if driving or GoToStation or (WorkEnabled and (ActiveJob == "Cashier (Market)" or ActiveJob == "Pizza Baker" or ActiveJob == "Janitor" or ActiveJob == "Miner" or ActiveJob == "Mechanic" or ActiveJob == "Woodcutter" or ActiveJob == "Stocker" or (ActiveJob == "Delivery Person" and player.Character:FindFirstChild("Vehicle_Delivery Moped")))) then
			player.Character.Humanoid:ChangeState(11)
		end
	end)

	local WorkstationFunctions
	WorkstationFunctions = {
		GetFreeMotorWorkstation = function()
			if workspace.Environment.Locations:FindFirstChild("MikesMotors") then
				for i, v in next, workspace.Environment.Locations.MikesMotors.MechanicWorkstations:GetChildren() do
					if v:FindFirstChild("InUse") and v.InUse.Value == player then 
						return v
					end
				end
				for i, v in next, workspace.Environment.Locations.MikesMotors.MechanicWorkstations:GetChildren() do
					if v:FindFirstChild("InUse") and v.InUse.Value == nil then 
						return v
					end
				end
			end
		end;
		GetMotorWorkstation = function()
			if workspace.Environment.Locations:FindFirstChild("MikesMotors") then
				local Station
				for i, v in next, workspace.Environment.Locations.MikesMotors.MechanicWorkstations:GetChildren() do
					if v:FindFirstChild("InUse") and v.InUse.Value == player then 
						Station = v
					end
				end
				for i, v in next, workspace.Environment.Locations.MikesMotors.MechanicWorkstations:GetChildren() do
					if v:FindFirstChild("InUse") and v:FindFirstChild("Occupied") and v.InUse.Value == nil and v.Occupied.Value ~= nil then 
						Station = v
					end
				end
				if Station == nil then
					wait()
					WorkstationFunctions.GetMotorWorkstation()
				end
				return Station
			end
		end;
		GetFreeBakerStation = function()
			if workspace.Environment.Locations:FindFirstChild("PizzaPlanet") then
				for i, v in next, workspace.Environment.Locations.PizzaPlanet.BakerWorkstations:GetChildren() do 
					if v:FindFirstChild("InUse") and v.InUse.Value == player then 
						return v
					end
				end
				for i, v in next, workspace.Environment.Locations.PizzaPlanet.BakerWorkstations:GetChildren() do 
					if v:FindFirstChild("InUse") and v.InUse.Value == nil then 
						return v 
					end
				end
			end
		end;
		GetFreeCashierStation = function()
			if workspace.Environment.Locations:FindFirstChild("Supermarket") then
				local Station
				local EmptyStations = {}
				for i, v in next, workspace.Environment.Locations.Supermarket.CashierWorkstations:GetChildren() do 
					if v:FindFirstChild("InUse") and v.InUse.Value == player then 
						Station = v
					end
				end
				for i, v in next, workspace.Environment.Locations.Supermarket.CashierWorkstations:GetChildren() do 
					if v:FindFirstChild("InUse") and v.InUse.Value == nil then 
						table.insert(EmptyStations, v)
					end
				end
				if Station == nil and #EmptyStations > 0 then
					local closest = nil
					local distance = huge
					for i, v in next, EmptyStations do
						if player:DistanceFromCharacter(v.Scanner.Position) < distance then
							distance = player:DistanceFromCharacter(v.Scanner.Position)
							closest = v
						end
					end
					Station = closest
				end
				if Station == nil then
					wait()
					GetFreeCashierStation()
				end
				return Station
			end
		end;
		GetHairWorkstations = function()
			if workspace.Environment.Locations:FindFirstChild("StylezHairStudio") then
				local stations = {}
				for i, v in next, workspace.Environment.Locations.StylezHairStudio.HairdresserWorkstations:GetChildren() do 
					if ((v.Mirror:FindFirstChild("HairdresserGUI") and v.Mirror.HairdresserGUI.Used.Visible == false) or v.InUse.Value == player) and v.Occupied.Value ~= nil then
						table.insert(stations, v)
					end
				end
				return stations
			end
		end;
		GetBurgerWorkstations = function()
			if workspace.Environment.Locations:FindFirstChild("BloxyBurgers") then
				local stations = {}
				for i, v in next, workspace.Environment.Locations.BloxyBurgers.CashierWorkstations:GetChildren() do 
					if v.InUse.Value == player and v.Occupied.Value ~= nil then
						table.insert(stations, v)
					end
					if v.InUse.Value == nil and v.Occupied.Value ~= nil then
						table.insert(stations, v)
					end
				end
				return stations
			end
		end;
		GetFreeHairStation = function()
			local station 
			if workspace.Environment.Locations:FindFirstChild("StylezHairStudio") then
				for i, v in next, workspace.Environment.Locations.StylezHairStudio.HairdresserWorkstations:GetChildren() do 
					if v.InUse.Value == nil then
						station = v
					end
				end
			end
			if station == nil then 
				GetFreeHairStation()
			end 
			return station
		end;
		GetFreeBurgerStation = function()
			if workspace.Environment.Locations:FindFirstChild("BloxyBurgers") then
				local station
				for i, v in next, workspace.Environment.Locations.BloxyBurgers.CashierWorkstations:GetChildren() do 
					if v.InUse.Value == nil then
						station = v
					end
				end
				if station == nil then 
					GetFreeBurgerStation()
				end
				return station
			end
		end;
	}       

	local GoToShelf, TakeCrate

	GoToShelf = function()
		if ActiveJob == "Stocker" and WorkEnabled == true then
			local shelf = FindClosest("EmptyShelf")
			local gotopart = FindClosest("EmptyShelf"):FindFirstChild("Part")
			CoolTween(gotopart.CFrame, 12)
			Call("RestockShelf", {
				Shelf = shelf
			})
			TakeCrate()
		end
	end;

	TakeCrate = function()
		if ActiveJob == "Stocker" and WorkEnabled == true then
			CoolTween(FindClosest("Crate").CFrame, 12)
			Call("TakeFoodCrate", {
				Object = FindClosest("Crate")
			})
			GoToShelf()
		end
	end

	local function GrabIceCreamOrder(Workstation)
		if Workstation.Occupied.Value ~= nil then
			local Order = Workstation.Occupied.Value:WaitForChild("Order")
			return {
				Flavor1 = Order.Flavor2.Value,
				Flavor2 = Order.Flavor1.Value,
				Topping = Order.Topping.Value
			}
		else
			wait()
			GrabIceCreamOrder(Workstation)
		end
	end

	local function StartFish()
		repeat
			wait()
		until player.Character:FindFirstChild("Fishing Rod")
		local start_time = tick()
		Call("UseFishingRod", {
			State = true;
			Pos = player.Character:FindFirstChild("Fishing Rod").Line.Position
		})
		wait(2)
		local bobberChangeConnection
		local originalBobberPosition = player.Character["Fishing Rod"].Bobber.Position.Y
		if player.Character:FindFirstChild("Fishing Rod") then
			bobberChangeConnection = player.Character["Fishing Rod"].Bobber:GetPropertyChangedSignal("Position"):Connect(function()
				if player.Character:FindFirstChild("Fishing Rod") then
					if originalBobberPosition - player.Character["Fishing Rod"].Bobber.Position.Y < 3 then
						local time_elapsed = tick() - start_time
						Call("UseFishingRod", {
							State = false;
							Time = time_elapsed;
						})
						bobberChangeConnection:Disconnect()
						StartFish()
					end
				end
			end)
		end
	end

	local WheelPos = {
		["Bloxster"] = Vector3.new(1155.36475, 13.3524084, 411.294983),
		["Classic"] = Vector3.new(1156, 13.3524084, 396.650177),
		["Moped"] = Vector3.new(1154, 13, 402)
	}

	local GroceryCashierFunctions = {
		BagAmount = function(station)
			local amount = 0
			for i, v in next, station.Bags:GetChildren() do
				if v.Transparency == 0 then
					amount = amount + 1
				end
			end
			return amount
		end;
		RestockBags = function(stat)
			local Crate = workspace.Environment.Locations.Supermarket.Crates:FindFirstChild("BagCrate")
			CoolTween(Crate.CFrame + Vector3.new(5, 0, -5), 10)
			Call("TakeNewBags", {
				Object = Crate
			})
			repeat
				wait()
			until player.Character:FindFirstChild("BFF Bags")
			CoolTween(stat.Scanner.CFrame - Vector3.new(3, 0, 0), 10)
			Call("RestockBags", {
				Workstation = stat
			})
			repeat
				wait()
			until stat.BagsLeft.Value > 0
		end;
	}

	local NextCustomer
	local count = 0
	local CurrentBags = 1
	local can_continue = true
	local JobHandler = {
		["Hairdresser"] = function()
			if #WorkstationFunctions.GetHairWorkstations() > 0 then
				for i, workstation in next, WorkstationFunctions.GetHairWorkstations() do
					if workstation.Mirror:FindFirstChild("HairdresserGUI") then
						workstation.Mirror.HairdresserGUI.Overlay:FindFirstChild("false").ImageRectOffset = Vector2.new(0, 0)
						workstation.Mirror.HairdresserGUI.Overlay:FindFirstChild("false").ImageColor3 = Color3.new(0, 255, 0)
						for i, v in next, getconnections(workstation.Mirror.HairdresserGUI.Frame.Done.Activated) do
							v:Fire()
						end
					end
				end
			end
		end;
		["Cashier (Burger)"] = function()
			if #WorkstationFunctions.GetBurgerWorkstations() > 0 then
				for i, v in next, WorkstationFunctions.GetBurgerWorkstations() do
					if v.OrderDisplay.DisplayMain:FindFirstChild("CashierGUI") then
						v.OrderDisplay.DisplayMain.CashierGUI.Overlay:FindFirstChild("false").ImageRectOffset = Vector2.new(0, 0)
						v.OrderDisplay.DisplayMain.CashierGUI.Overlay:FindFirstChild("false").ImageColor3 = Color3.new(0, 255, 0)
						for i, v in next, getconnections(v.OrderDisplay.DisplayMain.CashierGUI.Frame.Done.Activated) do 
							v:Fire()
						end
					end
				end
			end
		end;
		["Mechanic"] = function()
			local v = WorkstationFunctions.GetMotorWorkstation()
			if v then
				local customer = v.Occupied.Value
				if customer then
					local Order = customer:WaitForChild("Order")
					if Order:FindFirstChild("Oil") then
						local Oil = Order.Oil.Value
						if Oil ~= nil then
							repeat
								CoolTween(CFrame.new(1194, 13, 389), 12)
								Remotes["TakeOil"]:FireServer({
									Object = workspace.Environment.Locations.MikesMotors.OilCans:FindFirstChildWhichIsA("Model")
								})
								wait()
							until player.Character:FindFirstChild("Oil Can") or ActiveJob ~= "Mechanic"
							CoolTween(CFrame.new(v.Display.Screen.Position + Vector3.new(0, 0, 5)), 12)
							Remotes["FixBike"]:FireServer({
								Workstation = v
							})
							repeat
								wait()
							until (not player.Character:FindFirstChild("Oil Can")) or (ActiveJob ~= "Mechanic")
							Remotes["JobCompleted"]:FireServer({
								Workstation = v
							})
							wait(2)
						end
					elseif Order:FindFirstChild("Wheels") then
						local WheelType = Order.Wheels.Value
						for i = 1, 2 do
							repeat
								CoolTween(CFrame.new(WheelPos[WheelType]), 12)
								Remotes["TakeWheel"]:FireServer({
									Object = workspace.Environment.Locations.MikesMotors.TireRacks:FindFirstChild(WheelType)
								})
								wait()
							until player.Character:FindFirstChild(WheelType.." Wheel") or ActiveJob ~= "Mechanic"
							CoolTween(CFrame.new(v.Display.Screen.Position + Vector3.new(0, 0, 5)), 12)
							if i == 1 then
								Remotes["FixBike"]:FireServer({
									Workstation = v;
									Front = true
								})
							elseif i == 2 then
								Remotes["FixBike"]:FireServer({
									Workstation = v;
								})
							end
							repeat
								wait()
							until (not player.Character:FindFirstChild(WheelType.." Wheel")) or (ActiveJob ~= "Mechanic")
							if i == 2 then
								Remotes["JobCompleted"]:FireServer({
									Workstation = v
								})
							end
							wait(2)
						end
					elseif Order:FindFirstChild("Color") then
						local ColorValue = Order.Color.Value
						if ColorValue ~= nil then
							repeat
								CoolTween(CFrame.new(Vector3.new(1173, 13, 388)), 12)
								Remotes["TakePainter"]:FireServer({
									Object = workspace.Environment.Locations.MikesMotors.PaintingEquipment:FindFirstChild(ColorValue)
								})
								wait()
							until player.Character:FindFirstChild("Spray Painter") or ActiveJob ~= "Mechanic"
							CoolTween(CFrame.new(v.Display.Screen.Position + Vector3.new(0, 0, 5)), 12)
							Remotes["FixBike"]:FireServer({
								Workstation = v
							})
							repeat
								wait()
							until (not player.Character:FindFirstChild("Spray Painter")) or (ActiveJob ~= "Mechanic")
							Remotes["JobCompleted"]:FireServer({
								Workstation = v
							})
							wait(2)
						end
					end
				end
			end
		end;
		["Pizza Baker"] = function()
			local Station = WorkstationFunctions.GetFreeBakerStation()
			if Station ~= nil then
				if Station.Order.IngredientsLeft.Value == 0 then
					repeat
						wait()
					until not currentPlayerTween
					local Crate = FindClosest("PizzaCrate")
					player.Character.Humanoid:MoveTo((Crate.CFrame + Vector3.new(7, 0, 0)).p)
					if not player.Character:FindFirstChild("Ingredient Crate") then
						Remotes["TakeIngredientCrate"]:FireServer({
							Object = Crate
						})
					end
					repeat
						wait()
					until player.Character:FindFirstChild("Ingredient Crate")
					player.Character.Humanoid:MoveTo((Station.CounterTop.CFrame - Vector3.new(7, 0, 0)).p)
					Remotes["RestockIngredients"]:FireServer({
						Workstation = Station;
					})
					repeat
						wait()
					until Station.Order.IngredientsLeft.Value > 0
				end
				if Station.OrderDisplay.DisplayMain:FindFirstChild("BakerGUI") then
					Station.OrderDisplay.DisplayMain.BakerGUI.Overlay:FindFirstChild("false").ImageRectOffset = Vector2.new(0, 0)
					Station.OrderDisplay.DisplayMain.BakerGUI.Overlay:FindFirstChild("false").ImageColor3 = Color3.new(0, 255, 0)
					for i, v in next, getconnections(Station.OrderDisplay.DisplayMain.BakerGUI.Frame.Done.Activated) do 
						v:Fire()
					end
				end
			end
		end;
		["Ice Cream Seller"] = function() 
			for i, v in next, workspace.Environment.Locations.BensIceCream.CustomerTargets:GetChildren() do
				if v:FindFirstChild("Occupied") and v.Occupied.Value ~= nil then
					local order = v.Occupied.Value:WaitForChild("Order")
					if player.Character:FindFirstChild("Ice Cream Cup") then
						Remotes["UnequipItem"]:FireServer({
							Item = player.Character:FindFirstChild("Ice Cream Cup")
						})
					else
						Remotes["TakeIceCreamCup"]:FireServer({})
						repeat
							wait()
						until player.Character:FindFirstChild("Ice Cream Cup") and player.Character:FindFirstChild("Ice Cream Cup"):FindFirstChild("Ball1") and player.Character:FindFirstChild("Ice Cream Cup"):FindFirstChild("Ball2")

						Remotes["AddIceCreamScoop"]:FireServer({
							Taste = order:WaitForChild("Flavor1").Value,
							Ball = player.Character["Ice Cream Cup"].Ball1
						})

						Remotes["AddIceCreamScoop"]:FireServer({
							Taste = order.Flavor2.Value,
							Ball = player.Character["Ice Cream Cup"].Ball2
						})

						Remotes["AddIceCreamTopping"]:FireServer({
							Taste = order.Topping.Value,
						})

						Remotes["JobCompleted"]:FireServer({
							Workstation = v
						})
					end
				end
			end
			wait()
		end;
		["Woodcutter"] = function() 
			local Tree = FindClosest("Tree")

			if Tree then
				CoolTween(Tree.PrimaryPart.CFrame, 12)
				repeat
					Remotes["UseHatchet"]:FireServer({
						Tree = Tree
					})
					wait()
				until (Tree.PrimaryPart.Position.Y < 0) or (ActiveJob ~= "Woodcutter") or (WorkEnabled == false)
			end
		end;
		["Janitor"] = function() 
			local Trash = FindClosest("Trash")

			if Trash then
				if Trash:FindFirstChild("Object") and Trash:FindFirstChild("Object"):IsA("Part") then
					CoolTween(Trash.Object.CFrame, 12)
				else
					CoolTween(Trash.CFrame, 12)
				end
				Remotes["CleanJanitorObject"]:InvokeServer({
					Spawn = Trash
				})
			end
		end;
		["Miner"] = function()
			local TargetBlock = FindClosest("Valuable")
			TargetBlock.PrimaryPart.CanCollide = false
			if TargetBlock then
				CoolTween(TargetBlock.PrimaryPart.CFrame, 20)

				local TargetX, TargetY, TargetZ = string.match(TargetBlock.Name, "(.+):(.+):(.+)")
				local TargetVector = Vector3.new(TargetX, TargetY, TargetZ)
				Remotes["MineBlock"]:InvokeServer({
					P = TargetVector
				})
			end;
		end;
	}

	local function NextCustomer()
		if ActiveJob == "Cashier (Market)" then
			local Station = WorkstationFunctions.GetFreeCashierStation()
			count = 0
			CurrentBags = 1
			if Station.BagsLeft.Value == 0 then
				GroceryCashierFunctions.RestockBags(Station)
			end
			repeat
				for i, v in next, Station.DroppedFood:GetChildren() do
					count = count + 1
					if count / CurrentBags == 3 then
						Remotes["TakeNewBag"]:FireServer({
							Workstation = Station
						})
						CurrentBags = CurrentBags + 1
						if Station.BagsLeft.Value == 0 then
							GroceryCashierFunctions.RestockBags(Station)
							wait()
						end
					end
					Remotes["ScanDroppedItem"]:FireServer({
						Item = v
					})
					wait(0.1)
				end
				wait()
			until ActiveJob ~= "Cashier (Market)" or Station.Occupied.Value ~= nil and (Station.Occupied.Value.Head.Position - Station.CustomerTarget_2.Position).magnitude < 3
			Remotes["JobCompleted"]:FireServer({
				Workstation = Station
			})
			NextCustomer()
		end
	end

	local OldEndShift = JobModules["Delivery Person"].EndShift
	JobModules["Delivery Person"].EndShift = function(...)
		if ActiveJob == "Delivery Person" and WorkEnabled and JobActions.IsWorking() and player.Character:FindFirstChild("Vehicle_Delivery Moped") then 
			return 
		end 
		return OldEndShift(...)
	end

	local OldAlertBox = Modules.GUIHandler.AlertBox
	Modules.GUIHandler.AlertBox = function(...)
		local args = {...}
		if ActiveJob == "Delivery Person" and WorkEnabled and JobActions.IsWorking() and player.Character:FindFirstChild("Vehicle_Delivery Moped") and args[2] == "E_LeftWorkplace" then 
			return 
		end 
		return OldAlertBox(...)
	end

	local JobFunctions = {
		["Cashier (Burger)"] = {
			Start = function() 
				JobActions.StartShift("Cashier (Burger)")
				GoToStation = true
				CoolTween(CFrame.new(WorkstationFunctions.GetFreeBurgerStation().OrderDisplay.DisplayMain.Position) - Vector3.new(3, 0, 0), 12)
				GoToStation = false
			end;
			End = function()
				JobActions.EndShift("Cashier (Burger)")
			end;
			GoTo = function()
				require(JobManager):GoToWork("BloxyBurgersCashier")
			end;
		};
		["Hairdresser"] = {
			Start = function()
				JobActions.StartShift("Hairdresser")
				GoToStation = true
				CoolTween(WorkstationFunctions.GetFreeHairStation().Stool.PrimaryPart.CFrame, 12)
				GoToStation = false
			end;
			End = function()
				JobActions.EndShift("Hairdresser")
			end;
			GoTo = function()
				require(JobManager):GoToWork("StylezHairdresser")
			end;
		};
		["Mechanic"] = {
			Start = function() 
				repeat
					wait()
				until JobActions.IsWorking()
				CoolTween(CFrame.new(WorkstationFunctions.GetFreeMotorWorkstation().Display.Screen.Position + Vector3.new(0, 0, 5)), 12)
				JobActions.StartShift("Mechanic")
			end;
			End = function()
				JobActions.EndShift("Mechanic")
				if currentPlayerTween then
					currentPlayerTween:Cancel()
					currentPlayerTween = nil
				end
			end;
			GoTo = function()
				require(JobManager):GoToWork("MikesMechanic")
			end;
		};
		["Pizza Baker"] = {
			Start = function()
				JobActions.StartShift("Pizza Baker")
				local Station = WorkstationFunctions.GetFreeBakerStation()
				if Station ~= nil then
					CoolTween(Station.CounterTop.CFrame - Vector3.new(7, 0, 0), 12)
				end
			end;
			End = function()
				JobActions.EndShift("Pizza Baker")
			end;
			GoTo = function()
				require(JobManager):GoToWork("PizzaPlanetBaker")
			end;
		};
		["Delivery Person"] = {
			Start = function() 
				if currentPlayerTween then
					currentPlayerTween:Cancel()
					currentPlayerTween = nil
				end
				JobActions.StartShift("Delivery Person")
				Call("UsePizzaMoped", {})
				repeat
					wait()
				until player.Character:FindFirstChild("Vehicle_Delivery Moped")
				DeliveryFunctions.GoPizzaPlanet()
			end;
			End = function()
				if currentPlayerTween then
					currentPlayerTween:Cancel()
					currentPlayerTween = nil
				end
				Call("UsePizzaMoped", {})
				wait(0.2)
				player.Character.Humanoid.Jump = true 
				wait(0.2)
				JobActions.EndShift("Delivery Person")
			end;
			GoTo = function()
				require(JobManager):GoToWork("PizzaPlanetDelivery")
			end;
		};
		["Fisherman"] = {
			Start = function() 
				JobActions.StartShift("Fisherman")
				Pathfind(Vector3.new(1040.20239, 11.5224304, 1093.23889))
				StartFish()
			end;
			End = function()
				JobActions.EndShift("Fisherman")
			end;
			GoTo = function()
				require(JobManager):GoToWork("HutFisherman")
			end;
		};
		["Ice Cream Seller"] = {
			Start = function()
				CoolTween(CFrame.new(930.419434, 14.1130867, 1049.05457, -0.948081434, 5.13790361e-08, 0.318027735, 4.70168509e-08, 1, -2.13919567e-08, -0.318027735, -5.32865396e-09, -0.948081434), 12)
				JobActions.StartShift("Ice Cream Seller")
			end;
			End = function()
				JobActions.EndShift("Ice Cream Seller")
			end;
			GoTo = function()
				require(JobManager):GoToWork("BensIceCreamSeller")
			end;
		};
		["Stocker"] = {
			Start = function() 
				JobActions.StartShift("Stocker")
				TakeCrate()
			end;
			End = function()
				JobActions.EndShift("Stocker")
				if currentPlayerTween then
					currentPlayerTween:Cancel()
					currentPlayerTween = nil
				end
			end;
			GoTo = function()
				require(JobManager):GoToWork("SupermarketStocker")
			end;
		};
		["Cashier (Market)"] = {
			Start = function()
				local Station
				repeat
					Station = WorkstationFunctions.GetFreeCashierStation()
				until Station ~= nil
				CoolTween(Station.Scanner.CFrame - Vector3.new(3, 0, 0), 10)
				JobActions.StartShift("Cashier (Market)")
				NextCustomer()
			end;
			End = function()
				JobActions.EndShift("Cashier (Market)")
			end;
			GoTo = function()
				require(JobManager):GoToWork("SupermarketCashier")
			end;
		};
		["Woodcutter"] = {
			Start = function()
				JobActions.StartShift("Woodcutter")
			end;
			End = function()
				JobActions.EndShift("Woodcutter")
			end;
			GoTo = function()
				require(JobManager):GoToWork("LumberWoodcutter")
			end;
		};
		["Janitor"] = {
			Start = function()
				JobActions.StartShift("Janitor")
			end;
			End = function()
				JobActions.EndShift("Janitor")
				JobActions.EndShift("Stocker")
				if currentPlayerTween then
					currentPlayerTween:Cancel()
					currentPlayerTween = nil
				end
			end;
			GoTo = function()
				require(JobManager):GoToWork("CleanJanitor")
			end;
		};
		["Miner"] = {
			Start = function()
				JobActions.StartShift("Miner")
				if player.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity") then
					player.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
				end
				local bv = Instance.new("BodyVelocity", player.Character.HumanoidRootPart)
				bv.Velocity = Vector3.new(0, 0, 0)
			end;
			End = function()
				JobActions.EndShift("Miner")
				if player.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity") then
					player.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
				end
			end;
			GoTo = function()
				require(JobManager):GoToWork("CaveMiner")
			end;
		};
	}

	local savedPos = nil
	local moveCheck = 0

	coroutine.resume(coroutine.create(function()
		while wait(0.5) do
			if ActiveJob == "Delivery Person" and WorkEnabled then
				if not player.Character:FindFirstChild("Vehicle_Delivery Moped") then
					if currentPlayerTween then
						currentPlayerTween:Cancel()
						currentPlayerTween = nil
					end
				end
				if not JobActions.IsWorking() then
					require(JobManager):GoToWork("PizzaPlanetDelivery")
				end
			end
		end
	end))

	local JobList = {
		"Burger Cashier";
		"Hairdresser";
		"Mechanic";
		"Pizza Baker";
		"Delivery Person";
		"Fisherman";
		"Ice Cream Seller";
		"Stocker";
		"Market Cashier";
		"Woodcutter";
		"Janitor";
		"Miner";
	}

	local StopSettings = {
		StopAfterAmount = false,
		StopAmount = nil
	}

	Sections.Autofarm.Main:SearchBox("Job", JobList, function(value)
		local lastActive = ActiveJob
		ActiveJob = value
		if WorkEnabled and lastActive then
			JobFunctions[lastActive]["End"]()
		end
	end)

	Sections.Autofarm.Main:Button("Go To Job", function()
		if ActiveJob ~= nil then
			JobFunctions[ActiveJob]["GoTo"]()
		else 
			Window:Notification("Error", {
				Text = "Job Not Selected";
				ConfirmText = "Okay";
			})
		end
	end)

	Sections.Autofarm.Main:Toggle("Enabled", function(bool)
		WorkEnabled = bool
		if ActiveJob ~= nil then
			if JobFunctions[ActiveJob] ~= nil then
				if bool == true then
					JobFunctions[ActiveJob]["Start"]()
				elseif bool == false then
					JobFunctions[ActiveJob]["End"]()
				end
			end
		else 
			Window:Notification("Error", {
				Text = "Job Not Selected";
				ConfirmText = "Okay";
			})
		end
	end)

	Sections.Autofarm.Settings:Toggle("Stop After Amount", function(bool)
		StopSettings.StopAfterAmount = bool
	end)

	Sections.Autofarm.Settings:Box("Amount", function(val)
		StopSettings.StopAmount = tonumber(val)
	end)

	for i, v in next, game:GetService("ReplicatedStorage").Stats[player.Name].SkillData:GetChildren() do
		local Name = v.Name
		if Name ~= "Cooking" then
			Sections.Misc.Skills:Slider(Name, {
				min = 1,
				max = 10,
				default = v.Value
			}, function(value)
				v.Value = value
			end)
		end
	end

	local function AttemptTeleport()
		local fail = Call("JoinPrivateServer", {
			Search = game:HttpGet("https://bloxburg.sexy/neighborhoods/getCode.php")
		})

		if fail then 
			AttemptTeleport()
		end 
	end

	Sections.Misc.Random:Button("Private Server", function()
		Window:Notification("Message", {
			Text = "Teleporting...";
			ConfirmText = "Okay";
		})
		
		AttemptTeleport()
	end)

	local FakePaycheck = {
		pamount = nil;
		pjob = nil;
	}

	Sections.Misc.FakePaycheck:Box("Amount", function(am)
		if tonumber(am) ~= nil then
			FakePaycheck.pamount = am
		else 
			Window:Notification("Error", {
				Text = "Amount must be a number!";
				ConfirmText = "Okay";
			})
		end
	end)

	Sections.Misc.FakePaycheck:Box("Job", function(Input)
		FakePaycheck.pjob = Input
	end)

	Sections.Misc.FakePaycheck:Button("Fake Paycheck", function()
		if not FakePaycheck.pamount or not FakePaycheck.pjob then 
			Window:Notification("Error", {
				Text = "Amount/Job were not provided";
				ConfirmText = "Okay";
			})
		else 
			local JobData = Modules.JobData
			local old = JobData.GetJob
			JobData.GetJob = function(...)
				local args = {
					...
				} 
				if args[2] == FakePaycheck.pjob then 
					return {
						Title = FakePaycheck.pjob,
						ID = 69,
						Name = FakePaycheck.pjob,
						Location = Instance.new("Model"),
						AwardName = "bruh moment"
					} 
				end
				return old(...)
			end
			local TranslationHandler = Modules.TranslationHandler
			local old2 = TranslationHandler.Format 
			TranslationHandler.Format = function(...)
				local args = {
					...
				} 
				if args[2] == "T_Job"..FakePaycheck.pjob then 
					return FakePaycheck.pjob
				end
				return old2(...)
			end

			require(JobManager):ShowPaycheck(FakePaycheck.pamount, FakePaycheck.pjob)
		end
	end)

	local FakeMessage = {
		messageText = nil;
		Type = nil;    
	}

	Sections.Misc.FakeMessage:Picker("Type", {
		"Message",
		"Error",
		"Confirmation"
	}, function(a)
		FakeMessage.Type = a
	end)

	Sections.Misc.FakeMessage:Box("Text", function(a)
		FakeMessage.messageText = a
	end)

	Sections.Misc.FakeMessage:Button("Fake Message", function()
		if FakeMessage.messageText then
			local GUIHandler = Modules.GUIHandler
			if FakeMessage.Type == "Message" or FakeMessage.Type == nil then
				spawn(function()
					GUIHandler:MessageBox(FakeMessage.messageText)
				end)
			elseif FakeMessage.Type == "Error" then
				spawn(function()
					GUIHandler:AlertBox(FakeMessage.messageText)
				end)
			elseif FakeMessage.Type == "Confirmation" then
				spawn(function()
					GUIHandler:ConfirmBox(FakeMessage.messageText)
				end)
			end
		end
	end)

	local SkySettings = {
		SkyEnabled = false;
		Time = "Day";
		Weather = "Clear";
	}

	Sections.Misc.Sky:Toggle("Enabled", function(bool)
		SkySettings.SkyEnabled = bool
	end)

	Sections.Misc.Sky:Picker("Time of Day", {
		"Day",
		"Night"
	}, function(selected)
		SkySettings.Time = selected
		if SkySettings.SkyEnabled then
			if SkySettings.Time == "Day" then 
				game:GetService("Lighting"):FindFirstChild("TimeOfDay").Value = 500 
			elseif SkySettings.Time == "Night" then 
				game:GetService("Lighting"):FindFirstChild("TimeOfDay").Value = 0
			end
		end
	end)

	Sections.Misc.Sky:Picker("Weather", {
		"Clear",
		"Rain",
		"Fog",
		"Snow"
	}, function(selected)
		SkySettings.Weather = selected
		if SkySettings.SkyEnabled then
			if SkySettings.Weather == "Clear" then 
				game:GetService("Lighting"):FindFirstChild("Weather").Value = ""
			else
				game:GetService("Lighting"):FindFirstChild("Weather").Value = SkySettings.Weather 
			end
		end
	end)

	local TimeOfDay = game:GetService("Lighting"):FindFirstChild("TimeOfDay")
	TimeOfDay:GetPropertyChangedSignal("Value"):Connect(function()
		if SkySettings.SkyEnabled and SkySettings.Time ~= nil then
			if SkySettings.Time == "Day" then
				TimeOfDay.Value = 500
			elseif SkySettings.Time == "Night" then 
				TimeOfDay.Value = 0
			end
		end
	end)

	local Weather = game:GetService("Lighting"):FindFirstChild("Weather") 
	Weather:GetPropertyChangedSignal("Value"):Connect(function()
		if SkySettings.SkyEnabled and SkySettings.Weather ~= nil then
			if SkySettings.Weather == "Clear" then
				Weather.Value = ""
			else
				Weather.Value = SkySettings.Weather
			end
		end
	end)

	local function GetClosestAppliance(Types)
		local Results = {}
		for i, v in next, workspace.Plots["Plot_"..player.Name].House:GetChildren() do
			for k, x in next, v:GetDescendants() do
				for a, b in next, Types do
					if x.Name:find(b) and x:IsA("Part") then 
						table.insert(Results, x)
					end
				end
			end
		end
		if #Results == 1 then
			return Results[1]
		else
			local closest
			local last = huge
			for i, v in next, Results do
				local mag = (player.Character.HumanoidRootPart.Position - v.Position).magnitude
				if mag < last then
					last = mag
					closest = v
				end
			end
			return closest
		end 
	end

	local FoodHandler = Modules.FoodHandler 
	local FoodData = FoodHandler.FoodData
	local CookActions = FoodHandler.CookActions

	local function GetApplianceFromRecipe(recipe)
		local Types = {
			"Stove",
			"Counter"
		}
		local Action = CookActions[recipe]
		local Type = Action.Type or Action.Types
		local Result
		if typeof(Type) == "table" then
			for i, v in next, Type do
				if table.find(Types, v) then
					if v == "Counters" then
						v = "Counter"
					end
					Type = v
				end
			end
		else
			if Type == "Counters" then
				Type = "Counter"
			end
		end
		if table.find(Types, Type) then
			return Type
		end
	end

	local function GetRecipe(name)
		local Recipe = FoodData[name].Recipe
		local Result = {}
		for i, v in next, Recipe do
			if type(v) == "table" then
				for k, x in next, v do
					if GetApplianceFromRecipe(x) then
						table.insert(Result, x)
					end
				end
			else
				table.insert(Result, v)
			end
		end
		return Result
	end

	local function GetMood(Type)
		return ceil(ReplicatedStorage.Stats[player.Name].MoodData[Type].Value)
	end

	local AutoMoodVariables = {
		MoodWhenLowAmount = 0;
		Food = "Garden Salad";
		MoodWhenLow = false;
		EnabledMoods = {};
		AutoCompleteCookingChallenges = false;
		SelectedFood = "Garden Salad";
		Cooking = false;
		DoingAutoMood = false;
		GetToAmount = 90;
		TimeOut = 120;
	}

	local function GetLowMoods()
		local low = {}
		for i, v in next, {
			"Hunger",
			"Fun",
			"Energy",
			"Hygiene"
		} do 
			if GetMood(v) < AutoMoodVariables.GetToAmount then 
				table.insert(low, v)
			end
		end
		return low
	end

	player.PlayerGui.MainGUI.Scripts.Hotbar.ChildAdded:Connect(function(child)
		if (AutoMoodVariables.AutoCompleteCookingChallenges or AutoMoodVariables.Cooking) and child:IsA("BindableEvent") then
			wait()
			child:Fire(true)
		end
	end)

	local CharConnection
	local CurrentConnection

	local function AutoCook(Food, IsAuto)
		local FinishedFood

		if IsAuto then
			for i, Counter in next, workspace.Plots["Plot_"..player.Name].House.Counters:GetChildren() do
				if Counter:FindFirstChild("ItemHolder") then 
					for k, x in next, Counter.ItemHolder:GetChildren() do 
						if x:FindFirstChild("ObjectData") and x.ObjectData:FindFirstChild("FoodQuantity") then
							if x.ObjectData.FoodQuantity.Value > -1 then
								FinishedFood = x
								CharConnection = player.Character.ChildAdded:connect(function(child)
									if child:IsA("Model") and (child.Name:find(Food) or Food:find(child.Name)) and not child.Name:find("Ingredients") then 
										if GetMood("Hunger") < AutoMoodVariables.GetToAmount then
											Remotes["Eat"]:FireServer({
												Item = child
											})
										else 
											CharConnection:Disconnect()
											return "Completed"
										end
									end
								end)
								Pathfind(Counter.AttachPos.Position)
								Remotes["Interact"]:FireServer({
									Target = FinishedFood,
									Path = "2"
								})
							else 
								CharConnection = player.Character.ChildAdded:connect(function(child)
									if child:IsA("Model") and (child.Name:find(Food) or Food:find(child.Name)) and not child.Name:find("Ingredients") then 
										Remotes["UnequipItem"]:FireServer({
											Item = child
										})
										CharConnection:Disconnect()
									end
								end)
								Pathfind(Counter.AttachPos.Position)
								Remotes["Interact"]:FireServer({
									Target = x,
									Path = "1"
								})
							end
						end 
					end
				end
			end
		end

		if not FinishedFood then
			local Fridge = GetClosestAppliance({
				"Fridge"
			})

			if Fridge == nil then
				Window:Notification("Error", {
					Text = "You must have a fridge on your plot";
					ConfirmText = "Okay";
				}) 
				return
			end
			Pathfind(Fridge.AttachPos.Position)
			Remotes["Interact"]:FireServer({
				Target = Fridge,
				Path = "1"
			})
			Remotes["TakeIngredient"]:FireServer({
				Name = Food
			})
			local CurrentChild
			local Recipe = GetRecipe(Food)
			AutoMoodVariables.Cooking = true
			local function DoAction(CookProgress, child)
				local AppFromRec = GetApplianceFromRecipe(Recipe[CookProgress + 1])
				local Appliance = GetClosestAppliance({
					AppFromRec
				})
				if Appliance == nil then 
					Window:Notification("Error", {
						Text = "You must have a "..AppFromRec.." on your plot";
						ConfirmText = "Okay";
					}) 
					return
				end
				Pathfind(Appliance.AttachPos.Position)
				if AppFromRec == "Stove" then
					Remotes["Interact"]:FireServer({
						Target = Appliance,
						Path = "1"
					})
					if Recipe[CookProgress + 1] == "Bake" then
						repeat
							wait()
						until not player.Character:FindFirstChild(child.Name)
						repeat
							Remotes["Interact"]:FireServer({
								Target = Appliance,
								Path = "1"
							})
							wait(1)
						until player.Character:FindFirstChild(child.Name)
						CurrentConnection:Disconnect()
						local NewCookProgress = player.Character:FindFirstChild(child.Name):WaitForChild("CookProgress")
						CurrentConnection = NewCookProgress:GetPropertyChangedSignal("Value"):connect(function()
							DoAction(NewCookProgress.Value, CurrentChild)
						end)
					end
				elseif AppFromRec == "Counter" then
					Remotes["Interact"]:FireServer({
						Target = Appliance,
						Path = "2"
					})
				end
			end
			CharConnection = player.Character.ChildAdded:connect(function(child)
				if child.Name == Food and AutoMoodVariables.Cooking and IsAuto then 
					local Appliance = GetClosestAppliance({
						"Counter"
					})
					if Appliance == nil then 
						Window:Notification("Error", {
							Text = "You must have a counter on your plot";
							ConfirmText = "Okay";
						}) 
						return
					end
					Pathfind(Appliance.AttachPos.Position)
					Remotes["Interact"]:FireServer({
						Target = Appliance,
						Path = "3",
						Pos = Appliance.ObjectModel.PlaceArea.Position
					})
					FinishedFood = Appliance:WaitForChild("ItemHolder"):WaitForChild(Food)
					AutoMoodVariables.Cooking = false
					if GetMood("Hunger") < AutoMoodVariables.GetToAmount then
						Remotes["Interact"]:FireServer({
							Target = FinishedFood,
							Path = "2"
						})
					end
				end
				if child:IsA("Model") and (child.Name:find(Food) or Food:find(child.Name)) and not child.Name:find("Ingredients") and not AutoMoodVariables.Cooking and IsAuto then 
					if GetMood("Hunger") < AutoMoodVariables.GetToAmount then
						Remotes["Eat"]:FireServer({
							Item = child
						})
					else
						CharConnection:Disconnect()
						CurrentConnection:Disconnect()
					end
				end
				if child:IsA("Model") and child.Name:find("Ingredients") then
					local CookProgress = child:WaitForChild("CookProgress")
					if not CurrentConnection then
						DoAction(CookProgress.Value, child)
						CurrentConnection = CookProgress:GetPropertyChangedSignal("Value"):connect(function()
							DoAction(CookProgress.Value, child)
						end)
					end
					CurrentChild = child
				end
			end)
		end
	end 

	local function AutoMood(MoodType)
		if MoodType == "Hunger" then
			AutoCook(AutoMoodVariables.SelectedFood, true)
		elseif MoodType == "Hygiene" then 
			local Appliance = GetClosestAppliance({
				"Bath",
				"Shower",
				"The Barrel",
				"Jacuzzi"
			})
			if Appliance == nil then 
				Window:Notification("Error", {
					Text = "You must have a bath/shower on your plot";
					ConfirmText = "Okay";
				}) 
				return
			end
			local AttachPos = Appliance:FindFirstChild("AttachPos") or Appliance:FindFirstChild("AttachPos1")
			Pathfind(AttachPos.Position)
			Remotes["Interact"]:FireServer({
				Target = Appliance,
				Path = "1"
			})
		elseif MoodType == "Fun" then 
			local Appliance = GetClosestAppliance({
				"TV",
				"Television",
				"Pixelview"
			})
			if Appliance == nil then 
				Window:Notification("Error", {
					Text = "You must have a TV on your plot";
					ConfirmText = "Okay";
				}) 
				return
			end
			Pathfind(Appliance.Position)
			Remotes["Interact"]:FireServer({
				Target = Appliance,
				Path = "1"
			})
			wait(1)
			Remotes["Interact"]:FireServer({
				Target = Appliance,
				Path = "3"
			})
		elseif MoodType == "Energy" then 
			local Appliance = GetClosestAppliance({
				"Bed"
			})
			if Appliance == nil then 
				Window:Notification("Error", {
					Text = "You must have a bed on your plot";
					ConfirmText = "Okay";
				})
				return
			end
			local AttachPos = Appliance:FindFirstChild("AttachPos") or Appliance:FindFirstChild("AttachPos1")
			Pathfind(AttachPos.Position)
			Remotes["Interact"]:FireServer({
				Target = Appliance,
				Path = "1"
			})
		end 
	end

	local AllFoods = {}

	for i, v in next, FoodData do
		if not v.IsQuick and not v.Hidden then
			table.insert(AllFoods, i)
		end
	end

	for i, v in next, {
		"Hunger",
		"Fun",
		"Energy",
		"Hygiene"
	} do
		Sections.AutoMood.Manual:Toggle(v, function(value)
			if value then
				table.insert(AutoMoodVariables.EnabledMoods, v)
			else
				table.remove(AutoMoodVariables.EnabledMoods, table.find(AutoMoodVariables.EnabledMoods, v))
			end
		end)
	end

	local AutoBoostWhenLowToggle = Sections.AutoMood.Automatic:Toggle("Auto Boost Mood At Amount", function(value)
		AutoMoodVariables.MoodWhenLow = value
	end)

	local AutoBoostWhenLowAmountSlider = Sections.AutoMood.Automatic:Slider("Amount", {
		min = 0,
		max = 100
	}, function(value)
		AutoMoodVariables.MoodWhenLowAmount = value
	end)

	local GetToAmountSlider = Sections.AutoMood.Automatic:Slider("Get Moods To Amount", {
		min = 0,
		max = 100,
		default = 90
	}, function(value)
		AutoMoodVariables.GetToAmount = value
	end)

	local AutoMoodTimeoutSlider = Sections.AutoMood.Automatic:Slider("Auto Mood Timeout", {
		min = 10,
		max = 300,
		default = 120
	}, function(value)
		AutoMoodVariables.TimeOut = value
	end)

	local AutoBoostMoodButton = Sections.AutoMood.Manual:Button("Boost Selected Moods", function()
		if not AutoMoodVariables.DoingAutoMood then
			if JobActions.IsWorking() then 
				WorkEnabled = false
				JobFunctions[ActiveJob]["End"]()
				wait(1)
				require(player.PlayerGui.MainGUI.Scripts.Hotbar):ToPlot()
				repeat
					wait()
				until player.PlayerGui.MainGUI:FindFirstChild("LoadingFrame_ToPlot")
				repeat
					wait()
				until not player.PlayerGui.MainGUI:FindFirstChild("LoadingFrame_ToPlot")
				wait(3)
			end
			for i, v in next, AutoMoodVariables.EnabledMoods do 
				AutoMood(v)
				repeat
					wait()
				until GetMood(v) >= AutoMoodVariables.GetToAmount
				if v == "Hygiene" then 
					wait(1)
					player.Character.Humanoid.Jump = true
				end
				if v == "Fun" then 
					Remotes["Interact"]:FireServer({
						Target = GetClosestAppliance({
							"TV",
							"Television",
							"Pixelview"
						}),
						Path = "1"
					})
				end
				if v == "Energy" then 
					wait(1)
					player.Character.Humanoid.Jump = true
				end
			end
		end
	end)

	local AutoCompleteCookingChallengesToggle = Sections.AutoMood.AutoCook:Toggle("Auto Complete Cooking Challenges", function(value)
		AutoMoodVariables.AutoCompleteCookingChallenges = value
	end)

	local FoodSearchBox = Sections.AutoMood.AutoCook:SearchBox("Food", AllFoods, function(value)
		AutoMoodVariables.SelectedFood = value
	end)

	local CookFoodButton = Sections.AutoMood.AutoCook:Button("Cook Food", function()
		AutoCook(AutoMoodVariables.SelectedFood, false)
	end)

	for i, v in next, game:GetService("ReplicatedStorage").Stats[player.Name].MoodData:GetChildren() do 
		v:GetPropertyChangedSignal("Value"):Connect(function()
			if GetMood(v.Name) <= AutoMoodVariables.MoodWhenLowAmount and AutoMoodVariables.MoodWhenLow and not AutoMoodVariables.DoingAutoMood then 
				AutoMoodVariables.DoingAutoMood = true
				local WasWorking = false
				if JobActions.IsWorking() then 
					WorkEnabled = false
					WasWorking = true
					JobFunctions[ActiveJob]["End"]()
					wait(1)
					require(player.PlayerGui.MainGUI.Scripts.Hotbar):ToPlot()
					repeat
						wait()
					until player.PlayerGui.MainGUI:FindFirstChild("LoadingFrame_ToPlot")
					repeat
						wait()
					until not player.PlayerGui.MainGUI:FindFirstChild("LoadingFrame_ToPlot")
					wait(3)
				end
				spawn(function()
					wait(AutoMoodVariables.TimeOut)
					AutoMoodVariables.DoingAutoMood = false
					if CharConnection then
						CharConnection:Disconnect()
					end
					if CurrentConnection then
						CurrentConnection:Disconnect()
					end
					if WasWorking then 
						JobFunctions[ActiveJob]["GoTo"]()
						repeat
							wait()
						until JobActions.IsWorking()
						WorkEnabled = true
						JobFunctions[ActiveJob]["Start"]()
					end
				end)
				for i, v in next, GetLowMoods() do 			
					AutoMood(v)
					repeat
						wait()
					until GetMood(v) >= AutoMoodVariables.GetToAmount
					if v == "Hygiene" then 
						wait(0.5)
						player.Character.Humanoid.Jump = true
					end
					if v == "Fun" then 
						Remotes["Interact"]:FireServer({
							Target = GetClosestAppliance({
								"TV",
								"Television",
								"Pixelview"
							}),
							Path = "1"
						})
					end
					if v == "Energy" then 
						wait(0.5)
						player.Character.Humanoid.Jump = true
					end
				end
				AutoMoodVariables.DoingAutoMood = false
				if WasWorking then 	
					JobFunctions[ActiveJob]["GoTo"]()
					repeat
						wait()
					until JobActions.IsWorking()
					WorkEnabled = true
					JobFunctions[ActiveJob]["Start"]()
				end
			end
		end)    
	end

	coroutine.wrap(function()
		while wait() do
			if WorkEnabled and ActiveJob ~= nil and JobHandler[ActiveJob] ~= nil then
				JobHandler[ActiveJob]()
			end
		end
	end)()

	coroutine.wrap(function()
		while wait() do 
			if JobActions.IsWorking() then 
				if StopSettings.StopAfterAmount == true and StopSettings.StopAmount ~= nil and floor(ReplicatedStorage.Stats[player.Name].Job.ShiftEarnings.Value) >= StopSettings.StopAmount then 
					WorkEnabled = false
					JobFunctions[ActiveJob]["End"]()
					wait(1)
					Modules.Hotbar:ToPlot()
				end
				StatLabels.EarningsLabel:Update("Shift Earnings: "..tostring(floor(ReplicatedStorage.Stats[player.Name].Job.ShiftEarnings.Value)))
				StatLabels.TimeLabel:Update("Shift Duration: "..player.PlayerGui.MainGUI.Bar.CharMenu.WorkFrame.WorkFrame.TimeLabel.TextLabel.Text)
			else
				StatLabels.EarningsLabel:Update("Shift Earnings: 0")
				StatLabels.TimeLabel:Update("Shift Duration: 0s")
				repeat wait() until JobActions.IsWorking()
			end
		end
	end)()

	local statFunctions
	do
		statFunctions = setmetatable({}, {
			__tostring = function()
				return "StatViewer"
			end,
		})
		statFunctions.__index = statFunctions
		function statFunctions.new(...)
			local self = setmetatable({}, statFunctions)
			self:constructor(...)
			return self
		end
		function statFunctions:constructor(player)
			self.statFolder = ReplicatedStorage.Stats[player]
		end
		function statFunctions:getStat(statType)
			return self.statFolder:FindFirstChild(statType, true).Value
		end
	end

	local otherStatLabels = {}

	local selectStatPlayer = Sections.StatViewer.Viewer:SearchBox("Select player", PlayerList, function(target)
		local userStats = statFunctions.new(target)
		for i, v in next, otherStatLabels do 
			v:Update(string.format("%s: %s", i, userStats:getStat(i)))
		end
	end)

	otherStatLabels.Money = Sections.StatViewer.Viewer:Label("Money: 0")
	otherStatLabels.Blockbux = Sections.StatViewer.Viewer:Label("Blockbux: 0")
	otherStatLabels.Houses = Sections.StatViewer.Viewer:Label("Houses: 0")
else
    report(7,'R6, ' .. time3 .. " " .. res3) --Response Spoofing
    return
end
