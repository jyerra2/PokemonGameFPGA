module poke_battle( //This is received from the Color Mapper based on which map we are currently in
                    input logic hp1_mux, //Select bits from FSM. Set to high for turn in which Pokemon is attacked
										  hp2_mux,
						  input logic [4:0]  poke1_id, poke2_id, //This is used to calculate the type of each pokemon
						  
						  output logic battle_done,//Sent to the FSM in order to indicate that the battle is done
						  
						  output [5:0] hp_out1, hp_out2, //Sent to the color mapper to display dynamic HP
						  
						  input logic init_reg, //This is the select bit for the muxes. Assigned to init_reg_select
						  
						  wild_poke_reg,
						  
						  input Reset,
						  
						  input Clk, //currently not being used. Might be used in the future
						  
						  input frameClk, //for Pokemon registers
						  
						  input logic [1:0] curr_map,
						  
						  output logic [3:0] curr_level,
						  //This is needed for the user being able to go to the next map 
					     output logic [7:0] xp_test1,
						  output logic [3:0] level_test1,
						  output logic [4:0] poke2_idOut,
						  
						  
						 output logic [3:0] userPkmnlevel,
										        wildPkmnlevel,
									
				       output logic [4:0] prev_poke_ID,
                  
                   input logic heal_on						
						  
													
						  );
						  
						  //init_reg_select is 1'b0 if we want default values. 1'b1 if we watn the updated values.
						  
						  logic [2:0] type1, type2;// Local logic variables for the user Pokemon type. Input into the register
						 
						  
						  logic [2:0] type1_out, type2_out;//output from pokemon registers and input into calc hp
						  
						  assign type_test1 = type1_out;
						  assign type_test2 = type2_out;
						  
						  logic [3:0] level_in2reg;  ////Local logic variable for the user Pokemon level --> output from MUX
						  logic [3:0] level1, level2; //Local logic variables for the pokemon levels; level1 -> input into MUX
						  
						  logic [4:0] pokemon_id1, pokemon_id2; //Local logic variables for the pokemon IDs
						  
						  logic [3:0] attack1, defense1; //attack and defense for pokemon 1
						  logic [3:0] attack2, defense2; //attack and defense for pokemon 2
						  
						  logic [5:0] hp1mux_out, hp2mux_out; // input into the registers and output of the muxes
						  
						  logic [5:0] hp_from_reg1, hp_from_reg2; //into the second mux
						  
//					     assign hp_out1 = hp1mux_out; //This is for the color mapper
//						  assign hp_out2 = hp2mux_out; //This is for the color mapper
//						  
						  assign hp_out1 = hp1mux_out; 
						  assign hp_out2 = hp2mux_out;
						  
						  logic level_inc; //select bit for the level increment mux
						  
						   logic pkmn1_faint, pkmn2_faint; //Local logic variable for pokemon faint
						  
						  //assign level1 = level_poke1;
						  
						  assign prev_poke_ID = pokemon_id1;
						  
						  //assign pokemon_idtest = pokemon_id1;
						  
						  logic init_reg_select;
						  
						  assign init_reg_select = init_reg;
						  
						  //assign pokemon_id1 = poke1_id;
						  //assign pokemon_id2 = poke2_id;
						  
						  assign userPkmnlevel = level1;
						  
						    
						  logic [5:0] hpmux1_in1;
						  logic [5:0] hpmux2_in1;
						  
						  logic [7:0] xp_prev;
						  
						  logic [7:0] xp_pkmn_regout, waste;
						  
						  logic [3:0] waste2;//curr_level,
						  
						  logic [3:0] level_prev;
						
						  assign curr_level = level_in2reg;
						  
						  //curr_level = level1;
						  
						  assign battle_done = pkmn1_faint || pkmn2_faint;
						  
						  logic [5:0] hp_prev1, hp_prev2;
						  
						  logic [7:0] xpmux_out;
						  
						 always_comb
						 begin
						 if(curr_map == 2'b00 || curr_map == 2'b01)
						 level2 = 4'b0011;
						 else if(curr_map == 2'b10)
						 level2 = 4'b1000;
						 else
						 level2 = 4'b1101;
						 end

						  
						  type_def td1(.pokemon_id(poke1_id), .type_pokemon(type1));
						  type_def td2(.pokemon_id(poke2_id), .type_pokemon(type2));
							
						  level_mux level_init(.level_in(4'b0101), .level_in_plus1(level1), .level_sel(init_reg_select), .level_out(level_prev));	
						  
						  level_mux level_battle(.level_in(level_prev), .level_in_plus1(level_prev + 1'b1), .level_sel(level_inc), .level_out(level_in2reg));//Done
						  
						  hp_mux hp1_init(.hp_prev(6'b111111), .hp_new(hp_from_reg1), .sel(init_reg), .hp_to_pkmnreg(hp_prev1));
						  
						  hp_mux hp2_init(.hp_prev(6'b111111), .hp_new(hp_from_reg2), .sel(wild_poke_reg), .hp_to_pkmnreg(hp_prev2));
						 
								 
						  hp_mux hp1( .hp_prev(hp_prev1), .hp_new(hpmux1_in1), .sel(hp1_mux), .hp_to_pkmnreg(hp1mux_out)); //Done
						  
						  hp_mux hp2( .hp_prev(hp_prev2), .hp_new(hpmux2_in1), .sel(hp2_mux), .hp_to_pkmnreg(hp2mux_out));//Done 
						  
						  xp_mux xp_init(.xp_prev(8'b00000000), .xp_new(xp_pkmn_regout), .sel(init_reg_select), .xp_to_pkmnreg(xp_prev) );
						
						  //poke_reg pokemon1(.Clk(Clk), .frameClk(frameClk), .poke_id(poke1_id), .type_id(type1), .level(level_in2reg), .hp(hp1mux_out), .xp(xpmux_out), .poke_idOut(pokemon_id1), .type_out(type1_out), .attack(level_in2reg), .defense(level_in2reg), .attack_out(attack1), .defense_out(defense1), .hp_out(hp_from_reg1), .xp_out(xp_pkmn_regout), .level_out(level1) );
						  poke_reg pokemon1(.Reset(Reset), .Clk(Clk), .frameClk(frameClk),.poke_id(poke1_id), .type_id(type1), .level(level_in2reg), .hp(hp1mux_out), .xp(xpmux_out), .poke_idOut(pokemon_id1), .type_out(type1_out), .attack(level_in2reg), .defense(level_in2reg), .attack_out(attack1), .defense_out(defense1), .hp_out(hp_from_reg1), .xp_out(xp_pkmn_regout), .level_out(level1) );
						  
						  //poke_reg pokemon2(.Clk(Clk), .frameClk(frameClk), .poke_id(poke2_id), .type_id(type2), .level(level2), .hp(hp2mux_out), .xp(8'b00000000), .poke_idOut(pokemon_id2), .type_out(type2_out),.attack(level2), .defense(level2), .attack_out(attack2), .defense_out(defense2), .hp_out(hp_from_reg2), .xp_out(waste), .level_out(waste2) );	
						
					     poke_reg pokemon2(.Reset(Reset), .Clk(Clk), .frameClk(frameClk), .poke_id(poke2_id), .type_id(type2), .level(level2), .hp(hp2mux_out), .xp(8'b00000000), .poke_idOut(poke2_idOut), .type_out(type2_out),.attack(4'b0011), .defense(4'b0011), .attack_out(attack2), .defense_out(defense2), .hp_out(hp_from_reg2), .xp_out(waste), .level_out(wildPkmnlevel) );	
						  
						  calc_xp xp1(.xp_prev(xp_prev), .pkmn_faint(pkmn2_faint), .other_pkmn_level(level2), .xp_new(xpmux_out), .other_pkmn_id(pokemon_id2), .level_inc(level_inc));//Done
						
						  calc_hp pkmn1(.poke_faint(pkmn1_faint), .clk(Clk), .attack_poke1(wildPkmnlevel), .defense_poke2(userPkmnlevel), .attackPokemon1type(type2_out), .defensePokemon2type(type1_out), .hp_in(hp1mux_out),  .hp_out(hpmux1_in1));//Done
						 
					     calc_hp pkmn2(.poke_faint(pkmn2_faint), .clk(Clk), .attack_poke1(userPkmnlevel), .defense_poke2(wildPkmnlevel), .attackPokemon1type(type1_out), .defensePokemon2type(type2_out), .hp_in(hp2mux_out),  .hp_out(hpmux2_in1)); //Done	 
						  
						  
						  
						 
						  
						endmodule
						