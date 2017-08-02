module userPkmnSelect(input logic [3:0] chosenPokemon,
							 
							 output logic [4:0] pkmnID );

 

     always_comb
			begin
			
			// 00011 : BulbasaurBack
// 00100 : CharmanderBack
// 00101 : SquirtleBack

// 00110 : IvysaurBack
// 00111 : CharmeleonBack
// 01000 : WartortleBack

// 01001 : VenusaurBack
// 01010 : CharizardBack
// 01011 : BlastoiseBack
			if(chosenPokemon == 4'b0000) //Bulbasaur
			pkmnID = 5'b00011;
			
			else if(chosenPokemon == 4'b0001) //Charmander
			pkmnID = 5'b00100;
			
			else if(chosenPokemon == 4'b0010) //Squirtle
			pkmnID = 5'b00101;
			
			else if(chosenPokemon == 4'b0011) //Ivysaur - second map
			pkmnID = 5'b00110;
			
			
			else if(chosenPokemon == 4'b0100) //Charmeleon - second map
			pkmnID = 5'b00111;
			
			
			else if(chosenPokemon == 4'b0101) //Wartortle - second map
			pkmnID = 5'b01000;
			
			
			else if(chosenPokemon == 4'b0011) //Venusaur - third map
			pkmnID = 5'b01001;
			
			
			else if(chosenPokemon == 4'b0011) //Charizard - third map
			pkmnID = 5'b01010;
			
			
			else if(chosenPokemon == 4'b0011) //Blastoise - third map
			pkmnID = 5'b01011;
			
			else
			pkmnID = 5'b11111;
			
			end
			
			
			
	
endmodule
			