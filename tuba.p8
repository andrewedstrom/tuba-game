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
		ti=20, --timer interval
		walking=true,
		facing_left=false,
		walk_i=0,
		walk_melody={0,1,0,1,0,1,2,1},
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
					sfx(self.walk_melody[self.walk_i+1])
					self.walk_i+=1
					self.walk_i%=#self.walk_melody
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
	cls(12)
	draw_map()
	p:draw()
end

function draw_map()
	map(0, 0, 0, 0, 16, 16)
end
__gfx__
00000000bbbbbbbb666666666660000006666666666666666666666666666666666aaaa6565565659999999966666666666666666666666666666a6600000000
000000003333333366666666660dddddd0666666666000000666666666666666666aaaa6556556654404440466666666666666666666666666667a6600000000
00700700777777776666666660dddddddd066666660dddddd06666666666000066aaa47a565555654404440466666666666666666666666a777aaa6600000000
00077000555555556666666660ddddddd700666660dddddddd0666666600000005aa499a56565565000000006666666666666666666666aaaaaaaa6600000000
000770005555555566666666000ddddd7777066660ddddddd70066666600000005aa999a55555555444404446666666666666666666666a00006aa6600000000
0070070055555555666666660000000ddd006666000ddddd7777066660000ff0f0aaa9aa566655564444044466666666666666666666aa0000006a6600000000
00000000555555556666666600000077070666660000000ddd00666660ff0ff0f05a7aa655655555000000006666666666666666666aa000ff0f0a6600000000
00000000aaaa5555666666666007707707066666000000770706666660fffffff06aaaa665555565440444046666666666666666666aa0f0ff0f066600000000
00000000aaaa555566666666660777777706666660077077070666666a00fff4aa66666666666666440444044446666666666666666aa0ffffff066600000000
00000000555555556666666660d00777d06666666607777777066666aaa000006a666666666666660000000066644446666666666667a00fff9a666600000000
00000000555555556666666660dd00000666666660d00777d0666666aaa011166a666666666666664044404466666666666666666667aa000006a66600000000
00000000555555556666666660d077006666666660d0000006666666aaa0affaaa6666666666666640444044666666666666666666667a0affaaa66600000000
00000000555555556666666660d07700666666666007700000066666aaaa0fa66a666666666666660000000066666666666666666666a7a0fa06a66600000000
000000007777777766666666660000dd066666660d0770dd0dd066666aaaaaaaa666666666666666444444446666666666666666666666aaaaaa666600000000
0000000033333333666666666660dddd066666660dd00000dd06666666aaaaaa666666666666666644444444666666666666666666666660ddd0666600000000
00000000bbbbbbbb6666666666660000666666666006666000666666666066600666666666666666000000006666666666666666666666660006666600000000
00000000666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006666666666666a6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006666666666667a6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006666666a777aaa6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666666aaaaaaaa6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666666a00006aa6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006666aa0000006a6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666aa000ff0f0a6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666aa0f0ff0f066600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666aa0ffffff066600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006667a00fff9a666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006667aa000006a66600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000066667a0affaaa66600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006666a7a0fa06a66600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000066660daaaaaa066600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666660066600666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000a0a0a0a0a0a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
010200000c1500c1500c1550010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
010200000715007150071551310013100131001310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010200001015010150101550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010200001315013150131500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
