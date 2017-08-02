/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  spriteROM
(     
      input logic [1:0] Sprite,
		input logic [4:0] pkmnID,
		input logic [4:0] wildPkmnID,
		input logic user_on,
		input [13:0] read_address,
		input Clk,
		frameClk,
		output logic [7:0] data_Out
);
//endmodule

// mem has width of 6 bits and a total of 400 addresses
logic [7:0] bulb_front1 [0:9215];
//logic [7:0] bulb_front2 [0:9215];
//logic [7:0] char_front1 [0:9215];
//logic [7:0] char_front2 [0:9215];
//logic [7:0] squir_front1 [0:9215];
//logic [7:0] squir_front2 [0:9215];
//
//logic [7:0] bulbasaurBack [0:9215];
//logic [7:0] ivysaurBack [0:9215];
//logic [7:0] venasaurBack [0:9215];
//logic [7:0] charmanderBack [0:9215];
//logic [7:0] charmeleonBack [0:9215];
//logic [7:0] charizardBack [0:9215];
//logic [7:0] squirtleBack [0:9215];
//logic [7:0] wartortleBack [0:9215];
//logic [7:0] blastoiseBack [0:9215];
//
//logic [7:0] pikachuFront [0:9215];
//logic [7:0] doduoFront [0:9215];
//logic [7:0] houndourFront [0:9215];
//logic [7:0] murkrowFront [0:9215];
//logic [7:0] onyxFront [0:9215];
//logic [7:0] golduckFront [0:9215];
//logic [7:0] pidgeottoFront [0:9215];
//logic [7:0] sceptileFront [0:9215];
//logic [7:0] lugiaFront [0:9215];
//logic [7:0] arceusFront [0:9215];
//logic [7:0] articunoFront [0:9215];
//logic [7:0] enteiFront [0:9215];


//logic [7:0] mem7 [0:9215];
//logic [7:0] mem8 [0:9215];

//logic [4:0] Counter;

//always_ff @ (posedge frameClk)
//begin
//Counter <= (Counter+1)%32;
//end

initial
begin
	 $readmemh("sprite_bytes/bulb_front1.txt", bulb_front1, 0, 9215);
//	 $readmemh("sprite_bytes/bulb_front2.txt", bulb_front2, 0, 9215);
//	 $readmemh("sprite_bytes/char_front1.txt", char_front1, 0, 9215);
//	 $readmemh("sprite_bytes/char_front2.txt", char_front2, 0, 9215);
//	 $readmemh("sprite_bytes/squir_front1.txt", squir_front1, 0, 9215);
//	 $readmemh("sprite_bytes/squir_front2.txt", squir_front2, 0, 9215);
//	 
//	 $readmemh("sprite_bytes/bulb_back.txt", bulbasaurBack, 0, 9215);
//	 $readmemh("sprite_bytes/ivysaur_back.txt", ivysaurBack, 0, 9215);
//	 $readmemh("sprite_bytes/venasaur_back.txt", venasaurBack, 0, 9215);
//	 $readmemh("sprite_bytes/charmander_back.txt", charmanderBack, 0, 9215);
//	 $readmemh("sprite_bytes/charmeleon_back.txt", charmeleonBack, 0, 9215);
//	 $readmemh("sprite_bytes/charizardBack.txt", charizardBack, 0, 9215);
//	 $readmemh("sprite_bytes/squirtle_back.txt", squirtleBack, 0, 9215);
//	 $readmemh("sprite_bytes/wartortle_back.txt", wartortleBack, 0, 9215);
//	 $readmemh("sprite_bytes/blastoise_back.txt", blastoiseBack, 0, 9215);
//	 $readmemh("sprite_bytes/pikachu_front.txt", pikachuFront, 0, 9215);
//	 $readmemh("sprite_bytes/doduo_front.txt", doduoFront, 0, 9215);
//	 $readmemh("sprite_bytes/houndour_front.txt", houndourFront, 0, 9215);
//	 $readmemh("sprite_bytes/murkrow_front.txt", murkrowFront, 0, 9215);
//	 $readmemh("sprite_bytes/onyx_front.txt", onyxFront, 0, 9215);
//	 $readmemh("sprite_bytes/golduck_front.txt", golduckFront, 0, 9215);
//	 $readmemh("sprite_bytes/pidgeotto_front.txt", pidgeottoFront, 0, 9215);
//	 $readmemh("sprite_bytes/sceptileFront.txt", sceptileFront, 0, 9215);
//	 $readmemh("sprite_bytes/lugiaFront.txt", lugiaFront, 0, 9215);
//	 $readmemh("sprite_bytes/arceusFront.txt", arceusFront, 0, 9215);
//    $readmemh("sprite_bytes/articunoFront.txt", articunoFront, 0, 9215);
//	 $readmemh("sprite_bytes/enteiFront.txt", enteiFront, 0, 9215);	 
//    
end


always_ff @ (posedge Clk) begin
//
//if(Sprite == 2'b00)
//begin
//if(Counter == 5'b00000||Counter == 5'b00001||Counter == 5'b00010||Counter == 5'b00011||Counter == 5'b00100||Counter == 5'b00101||Counter == 5'b00110||Counter == 5'b00111||Counter == 5'b01000||Counter == 5'b01001||Counter == 5'b01010||Counter == 5'b01011||Counter == 5'b01100||Counter == 5'b01101||Counter == 5'b01110||Counter == 5'b01111)
// data_Out<= bulb_front2[read_address];
// else
//  data_Out<= bulb_front1[read_address];
//end	
//
//else if(Sprite == 2'b01)
//begin
//if(Counter == 5'b00000||Counter == 5'b00001||Counter == 5'b00010||Counter == 5'b00011||Counter == 5'b00100||Counter == 5'b00101||Counter == 5'b00110||Counter == 5'b00111||Counter == 5'b01000||Counter == 5'b01001||Counter == 5'b01010||Counter == 5'b01011||Counter == 5'b01100||Counter == 5'b01101||Counter == 5'b01110||Counter == 5'b01111)
//   data_Out <= char_front1[read_address];
//	else
//	data_Out <= char_front2[read_address];
//	
//	end
//	
//else if(Sprite == 2'b10)
// begin
//if(Counter == 5'b00000||Counter == 5'b00001||Counter == 5'b00010||Counter == 5'b00011||Counter == 5'b00100||Counter == 5'b00101||Counter == 5'b00110||Counter == 5'b00111||Counter == 5'b01000||Counter == 5'b01001||Counter == 5'b01010||Counter == 5'b01011||Counter == 5'b01100||Counter == 5'b01101||Counter == 5'b01110||Counter == 5'b01111)
// data_Out <= squir_front1[read_address];
// else
//   data_Out <= squir_front2[read_address]; 
//
// end
//
//else
//begin
//
//
////User Pokemon
//if(user_on)
//begin
//
//if(pkmnID == 5'b00011)
// data_Out <= bulbasaurBack[read_address];
//else if(pkmnID == 5'b00100)
//data_Out <= charmanderBack[read_address]; 
//else if(pkmnID == 5'b00101)
//data_Out <= squirtleBack[read_address];
//else if(pkmnID == 5'b00110)
//data_Out <= ivysaurBack[read_address];
//else if(pkmnID == 5'b00111)
//data_Out <= charmeleonBack[read_address];
//else if(pkmnID == 5'b01000)
//data_Out <= wartortleBack[read_address];
//else if(pkmnID == 5'b01001)
//data_Out <= venasaurBack[read_address];
//else if(pkmnID == 5'b01010)
//data_Out <= charizardBack[read_address];
//else if(pkmnID == 5'b01011)
//data_Out <= blastoiseBack[read_address];
//else
//data_Out <= bulb_front1[read_address];
//end
//
////Wild Pokemon
//else
//begin
//if(wildPkmnID == 5'b01100)
//data_Out <= pikachuFront[read_address];
//else if(wildPkmnID == 5'b01101)
//data_Out <= doduoFront[read_address];
//else if(wildPkmnID == 5'b01110)
//data_Out <= houndourFront[read_address];
//else if(wildPkmnID == 5'b01111)
//data_Out <= murkrowFront[read_address];
//else if(wildPkmnID == 5'b10000)
//data_Out <= onyxFront[read_address];
//else if(wildPkmnID == 5'b10001)
//data_Out <= golduckFront[read_address];
//else if(wildPkmnID == 5'b10010)
//data_Out <= pidgeottoFront[read_address];
//else if(wildPkmnID == 5'b10011)
//data_Out <= sceptileFront[read_address];
//else if(wildPkmnID == 5'b10100)
//data_Out <= lugiaFront[read_address];
//else if(wildPkmnID == 5'b10101)
//data_Out <= arceusFront[read_address];
//else if(wildPkmnID == 5'b10110)
//data_Out <= articunoFront[read_address];
//else if(wildPkmnID == 5'b10111)
//data_Out <= enteiFront[read_address];
//else 
//data_Out <= bulb_front1[read_address];
//
//end
//
//end

end
endmodule


  /*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */
//
//module  spriteROM
//(     
//      input logic [1:0] Sprite,
//		input frameClk,
//		input [13:0] read_address,
//		input Clk,
//      input logic [4:0] pkmnID,
//		input logic [4:0] wildID,
//		output logic [7:0] data_Out
//);
//
//// 00000 : BulbasaurFront
//// 00001 : CharmanderFront
//// 00010 : SquirtleFront
//
//// 00011 : BulbasaurBack
//// 00100 : CharmanderBack
//// 00101 : SquirtleBack
//
//// 00110 : IvysaurBack
//// 00111 : CharmeleonBack
//// 01000 : WartortleBack
//
//// 01001 : VenusaurBack
//// 01010 : CharizardBack
//// 01011 : BlastoiseBack
//
//// 01100 : PikachuBack
//// 01101 : DoduoBack
//// 01110 : HoundourBack
//// 01111 : MurkrowBack
//
//// 10000 : OnyxBack
//// 10001 : GolduckBack
//// 10010 : PidgeottoBack
//// 10011 : SceptileBack
//
//// 10100 : LugiaBack
//// 10101 : ArceusBack
//// 10110 : ArticunoBack
//// 10111 : EnteiBack
//
//
//
//
//// mem has width of 6 bits and a total of 400 addresses
//logic [7:0] mem0 [0:9215];
////logic [7:0] mem1 [0:9215];
////logic [7:0] mem2 [0:9215];
//
//initial
//begin
//	 $readmemh("sprite_bytes/bulb_front2.txt", mem0, 0, 9215);
//	 //$readmemh("sprite_bytes/char_front1.txt", mem1, 0, 9215);
//	 //$readmemh("sprite_bytes/squir_front1.txt", mem2, 0, 9215);
//	 
//end
//
//
//always_ff @ (posedge Clk) begin
//
//if(Sprite == 2'b00)
//	data_Out<= mem0[read_address];
//else if(Sprite == 2'b01)
//   data_Out <= mem0[read_address];
//else if(Sprite == 2'b10)
//	data_Out <= mem0[read_address];
//else 
//begin
// if(pkmnID == 5'b01010)
// data_Out <= mem0[read_address];
//else 
// data_Out <= mem0[read_address];
//end 
//end
//
//endmodule