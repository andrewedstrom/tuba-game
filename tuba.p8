pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
local p

function _init()
	p={
		x=60,
		y=70,
		w=16,
		h=16,
		t=0,
		ti=16, --timer interval
		walking=true,
		facing_left=false,
		next_walk_sound=0,
		update=function(self)
			self.t=(self.t+1)%self.ti
			
			self.walking=true
			if btn(0) then
				self.x-=1
				self.facing_left=true
			elseif btn(1) then
				self.x+=1
				self.facing_left=false
			elseif btn(2) then
				self.y-=1
			elseif btn(3) then
				self.y+=1
			else
				self.walking=false
			end
			
			-- walking sound
			if self.walking then
				if self.t==0 then
					sfx(self.next_walk_sound)
					self.next_walk_sound = (self.next_walk_sound+1)%2
				end
			end
		end,
		draw=function(self)
			palt(0,false)
			palt(6,true)
			local sx=104
			local sy=0
			if self.walking and self.t>self.ti/2 then
				sx=8
				sy=16
			end
			
			sspr(sx,sy,self.w,self.h,self.x,self.y,self.w,self.h,self.facing_left)
		end
	}
end

function _update60()
	p:update()
end

function _draw()
	cls(6)
	p:draw()
end
__gfx__
0000000066660000006666666660000006666666666666666666666666666666666aaaa66666666666666aa6666666666666a6666666666666666a6600000000
000000006660888888066666660dddddd0666666666000000666666666666666666aaaa6666666666666aaaa66666666666aa6666666666666667a6600000000
00700700660888888880666660dddddddd066666660dddddd06666666666000066aaa47a666666666666a99a666666a777aaa6666666666a777aaa6600000000
00077000660888888880666660ddddddd700666660dddddddd0666666600000005aa499a66666660000aa99a66666aaaaaaaa666666666aaaaaaaa6600000000
000770006000877778000666000ddddd7777066660ddddddd70066666600000005aa999a666660000000a99a66666a00006aa666666666a00006aa6600000000
0070070060070000007006660000000ddd006666000ddddd7777066660000ff0f0aaa9aa666660000000aaaa666600000006a6666666a00000006a6600000000
00000000070777777770706600000077070666660000000ddd00666660ff0ff0f05a7aa666660000ff0f0aa6666600000006a666666a0000ff0f0a6600000000
0000000007777077077770666007707707066666000000770706666660fffffff06aaaa666660ff0ff0f06666660000ff0f06666666a0ff0ff0f066600000000
000000006007707707700666660777777706666660077077070666666a00fff4aa66666666660fffffff06666660ff0ff0f06666666a0fffffff066600000000
00000000600077887700066660d00777d06666666607777777066666aaa000006a6666666666a00fff4aa6666660fffffff066666667a00fff9a666600000000
00000000077000000007706660dd00000666666660d00777d0666666aaa011166a666666666aaa000006a666666a00fff9a666666667aa000006a66600000000
00000000077000000007706660d077006666666660d0000006666666aaa0affaaa666666666aaa011166a66666aa1000006a666666667a0affaaa66600000000
00000000600088008800066660d07700666666666007700000066666aaaa0fa66a666666666aaa0affaaa66666a610affaaa66666666a7a0fa06a66600000000
000000006608008800806666660000dd066666660d0770dd0dd066666aaaaaaaa6666666666aaaa0fa66a66666a61a0fa66a6666666666aaaaaa666600000000
0000000066088800888066666660dddd066666660dd00000dd06666666aaaaaa666666666666aaaaaaaa6666666aaaaaaaa6666666666660ddd0666600000000
00000000666000660006666666660000666666666006666000666666666066600666666666666006600666666666006600666666666666660006666600000000
00000000666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006666666666666a6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006666666666667a6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006666666a777aaa6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666666aaaaaaaa6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666666a00006aa6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006666a00000006a6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666a0000ff0f0a6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666a0ff0ff0f066600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666a0fffffff066600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006667a00fff9a666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006667aa000006a66600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000066667a0affaaa66600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006666a7a0fa06a66600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000066660daaaaaa066600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666660066600666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
010200000c1500c1500c1500010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
010200000715007150071501310013100131001310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010200001015010150101500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010200001315013150131500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
