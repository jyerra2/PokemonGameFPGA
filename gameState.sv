module gameState(   input Clk, Reset,
						  input frameClk,
						  input logic battle_done,//from poke_battle
						  input logic battle_start,//from random number generator
						  //input logic pokemon_chosen,//from color mapper probably or somewhere the keycode is being read
						  output logic [1:0] display_control,
						  output logic [2:0] battle_control,
 						  // Battle sprites from battle FSM
						  
						  input logic [7:0] keycode,
						  
						  output logic hp1selbit,
											hp2selbit,
											
											init_reg_select,
											during_battle, 
						               wild_poke_reg,
							output logic [1:0] starterSelect,
							output logic starterMux
											
									
											
						  
						  );
						  
						  //battle_start from color mapper
						  //battle_done from pokemon battle
						  //curr_state(output of gameState) is used to indicate the state to the color mapper
						  
						 logic battle_end;
						 logic fight_on;
						 
						 
						  battle b0(.Reset(Reset), .state_in(state_in), .keycode(keycode), .Clk(Clk), .frameClk(frameClk), .fight_on(fight_on), .poke_faint(battle_done), .hp1_selbit(hp1selbit), .hp2_selbit(hp2selbit), .battle_end(battle_end), .battle_control(battle_control));
						  
						  enum logic [1:0] {INIT_STATE, POKE_SELECT, MAP_STAGE, BATTLE_STATE} state, next_state;
						  logic userPkmnSelect;
						  logic init_reg; //only active in the initial state and pokemon select state, given to the level, hp and xp muxes to initialize them for our pokemon
						  
						  assign init_reg_select = init_reg;
						  
						  logic [1:0] disp_control_in;
						  logic [2:0] battle_control_in;
						  
						  
						  always_ff @ (posedge frameClk)
							begin
							if(Reset)
							begin
							state <= INIT_STATE;
							//display_control = 2'b00;
							//battle_control = 3'b000;
							//
							end
						   else
							begin
							state <= next_state;
							// Any variables that need updating
							end
							end
							//Next state logic 
							
							always_comb
							begin
							
								next_state = state;
								
								case(state)
								
								default : begin
								next_state = INIT_STATE;
								end
								
								INIT_STATE : begin
								if(keycode == 8'h28)//Needs to be changed
								next_state = POKE_SELECT;
								
								end
								
								POKE_SELECT : begin
								if(keycode == 8'h16 || keycode == 8'h07 || keycode == 8'h04)
								next_state = MAP_STAGE;
								
								end
								
								MAP_STAGE : begin
								if(keycode == 8'h05 || battle_start) //Remove this assignment --> if(battle_start) from random number generator
 								next_state = BATTLE_STATE;
								
								end
								
								BATTLE_STATE : begin
								if(keycode == 8'h28 || battle_end)  //Remove this assignment --> if(battle_done)
								next_state = MAP_STAGE;
								
								end
								
								endcase
								//Control signals
								display_control = 2'b00;
								//battle_control = 3'b000;
								fight_on = 1'b0;
								init_reg = 1'b1;
								wild_poke_reg = 1'b0;
								during_battle = 1'b0;
								starterSelect = 2'b11;
								starterMux = 1'b0;
								
								case(state)
							
						      INIT_STATE : begin
							   
							   display_control = 2'b00;
							   init_reg = 1'b0;
						      end
							  
							   POKE_SELECT : begin
							   if(keycode == 8'h04) starterSelect = 2'b00;
								else if(keycode == 8'h16) starterSelect = 2'b01;
								else if(keycode == 8'h07) starterSelect = 2'b10;
								starterMux = 1'b1;
						      display_control = 2'b01;
							   init_reg = 1'b0;
						      end
							
						      MAP_STAGE : begin
							   fight_on = 1'b0;
							   display_control = 2'b10;
								init_reg = 1'b1; //userPokemon reg loads with existing values
							
						      end
							
						      BATTLE_STATE : begin
							   fight_on = 1'b1;
							   display_control = 2'b11;
							   init_reg = 1'b1; //userPokemon reg loads with existing values
								wild_poke_reg = 1'b1;
								during_battle = 1'b1;
						      end	
								endcase
							  end
							 
endmodule 
								
								