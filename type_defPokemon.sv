module type_def(input logic  [4:0] pokemon_id,
					 output logic [2:0] type_pokemon);
					 
					 
					 
// 00000 : BulbasaurFront
// 00001 : CharmanderFront
// 00010 : SquirtleFront

// 00011 : BulbasaurBack
// 00100 : CharmanderBack
// 00101 : SquirtleBack

// 00110 : IvysaurBack
// 00111 : CharmeleonBack
// 01000 : WartortleBack

// 01001 : VenusaurBack
// 01010 : CharizardBack
// 01011 : BlastoiseBack

// 01100 : PikachuBack
// 01101 : DoduoBack
// 01110 : HoundourBack
// 01111 : MurkrowBack

// 10000 : OnyxBack
// 10001 : GolduckBack
// 10010 : PidgeottoBack
// 10011 : SceptileBack

// 10100 : LugiaBack
// 10101 : ArceusBack
// 10110 : ArticunoBack
// 10111 : EnteiBack
         always_comb
			begin
         if(pokemon_id == 5'b00011)
			type_pokemon = 3'b000;
			
			else if(pokemon_id == 5'b00100)
			type_pokemon = 3'b001;
			
			else if(pokemon_id == 5'b00101)
			type_pokemon = 3'b010;
			
			else if(pokemon_id == 5'b00110)
			type_pokemon = 3'b000;
			
			else if(pokemon_id == 5'b00111)
			type_pokemon = 3'b001;
			
			else if(pokemon_id == 5'b01000)
			type_pokemon = 3'b010;
			
			else if(pokemon_id == 5'b01001)
			type_pokemon = 3'b000;
			
			else if(pokemon_id == 5'b01010)
			type_pokemon = 3'b001;
			
			else if(pokemon_id == 5'b01011)
			type_pokemon = 3'b010;
			
			else if(pokemon_id == 5'b01100)
			type_pokemon = 3'b011;
			
			else if(pokemon_id == 5'b01101)
			type_pokemon = 3'b100;
			
			else if(pokemon_id == 5'b01110)
			type_pokemon = 3'b001;
			
			else if(pokemon_id == 5'b01111)
			type_pokemon = 3'b100;
			
			else if(pokemon_id == 5'b10000)
			type_pokemon = 3'b101;
			
			else if(pokemon_id == 5'b10001)
			type_pokemon = 3'b010;
			
			else if(pokemon_id == 5'b10010)
			type_pokemon = 3'b100;
			
			else if(pokemon_id == 5'b10011)
			type_pokemon = 3'b000;
			
			else if(pokemon_id == 5'b10100)
			type_pokemon = 3'b100;
			
			else if(pokemon_id == 5'b10101)
			type_pokemon = 3'b110;
			
			else if(pokemon_id == 5'b10110)
			type_pokemon = 3'b010;
			
			else if(pokemon_id == 5'b10111)
			type_pokemon = 3'b001;
			
		   else 
			type_pokemon = 3'b111;
			
			end
			endmodule
			