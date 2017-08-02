module calc_hp(input clk,
					input  logic  [3:0]attack_poke1,
					                  defense_poke2,
					input logic [5:0]  hp_in,
					input  logic[2:0] attackPokemon1type,
				   input logic [2:0]	defensePokemon2type, 
				   output logic [5:0] hp_out,
					output logic poke_faint
					
				   );
					
					always_comb
					begin
					
					
					if(hp_in <= 6'd21)
					begin
					hp_out = 6'd0;
					poke_faint = 1'b1;
					
					end
					
					else
					begin
					hp_out = hp_in - 6'b010101;
					poke_faint = 1'b0;
					
					end
					
					end
					endmodule
					
					
//					logic [5:0] hp_subt;
//					
//					hpSubBytes h0(.clk(clk), .in({attack_poke1, defense_poke2}), .out(hp_subt));
//					
//			      always_comb
//					begin
//					//hp_out = 7'd0;
//					//poke_faint = 1'b0;
//					//Leaf
//					// 2x - Fire, Flying
//					// 0.5x - Leaf, Water, Thunder, Rock
//					// 1x - Psychic, Fighting
//					if(defensePokemon2type == 3'b000) 
//					begin
//					
//					if(attackPokemon1type == 3'b001 || attackPokemon1type == 3'b100)
//					begin
//					if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b011000)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b011000;//20
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b010000)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b010000;//16
//					end
//		          
//					end 
//					
//					else if(attackPokemon1type == 3'b110 || attackPokemon1type == 3'b111)
//					
//					begin
//					if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b010000)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b010000;//16
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b001100)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b001100;//12
//					end
//					
//					end
//
//					else
//					begin
//				if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b001100)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b001100;//12
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b001000)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b001000;//8
//					end
//					
//					end
//					
//					end
//					
//					
//					
//						//Fire
//					// 2x - Water, Rock
//					// 0.5x - Leaf, Fire
//					// 1x - Psychic, Fighting, Flying, Thunder
//				
//					else		if(defensePokemon2type == 3'b001) 
//					begin
//					
//								if(attackPokemon1type == 3'b010 || attackPokemon1type == 3'b101)
//					begin
//					if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b011000)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b011000;//20
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b010000)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b010000;//16
//					end
//		          
//					end 
//					
//					else if(attackPokemon1type == 3'b110 || attackPokemon1type == 3'b111 || attackPokemon1type == 3'b100 || attackPokemon1type == 3'b011)
//					
//					begin
//					if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b010000)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b010000;//16
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b001100)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b001100;//12
//					end
//					
//					end
//
//					else
//					begin
//				if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b001100)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b001100;//12
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b001000)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b001000;//8
//					end
//					
//					end
//					
//					end
//					
//					
//						//Water
//					// 2x - Thunder, Leaf
//					// 0.5x - Fire, Water, Rock
//					// 1x - Psychic, Fighting, Flying
//				
//					else		if(defensePokemon2type == 3'b010) 
//					begin
//					
//						if(attackPokemon1type == 3'b011 || attackPokemon1type == 3'b000)
//					begin
//					if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b011000)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b011000;//20
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b010000)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b010000;//16
//					end
//		          
//					end 
//					
//					else if(attackPokemon1type == 3'b110 || attackPokemon1type == 3'b111 || attackPokemon1type == 3'b100)
//					
//					begin
//					if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b010000)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b010000;//16
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b001100)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b010000;//12
//					end
//					
//					end
//
//					else
//					begin
//				if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b001100)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b001100;//12
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b001000)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b001000;//8
//					end
//					
//					end
//					
//					end
//					
//					
//					//Thunder
//					// 2x - Rock
//					// 0.5x - Psychic, Flying, Thunder
//					// 1x - Leaf, Fire, Water, Fighting
//				
//					else	if(defensePokemon2type == 3'b011) 
//					begin
//								if(attackPokemon1type == 3'b101)
//					begin
//					if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b011000)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b011000;//20
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b010000)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b010000;//16
//					end
//		          
//					end 
//					
//					else if(attackPokemon1type == 3'b010 || attackPokemon1type == 3'b000 || attackPokemon1type == 3'b001 || attackPokemon1type == 3'b111)
//					
//					begin
//					if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b010000)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b010000;//16
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b001100)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b010000;//12
//					end
//					
//					end
//
//					else
//					begin
//				if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b001100)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b001100;//12
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b001000)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b001000;//8
//					end
//					
//					end
//					
//					end
//					
//					
//					//Flying
//					// 2x - Rock, Thunder
//					// 0.5x - Leaf, Fighting
//					// 1x - Fire, Water, Flying, Psychic
//							else	if(defensePokemon2type == 3'b100) 
//					begin
//					
//								if(attackPokemon1type == 3'b101 || attackPokemon1type == 3'b011)
//					begin
//					if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b011000)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b011000;//20
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b010000)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b010000;//16
//					end
//		          
//					end 
//					
//					else if(attackPokemon1type == 3'b001 || attackPokemon1type == 3'b010 || attackPokemon1type == 3'b100 || attackPokemon1type == 3'b110)
//					
//					begin
//					if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b010000)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b010000;//16
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b001100)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b010000;//12
//					end
//					
//					end
//
//					else
//					begin
//				if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b001100)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b001100;//12
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b001000)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b001000;//8
//					end
//					
//					end
//					end
//					
//					//Rock
//					// 2x - Leaf, Water, Fighting
//					// 0.5x - Rock, Fire, Thunder, Flying
//					// 1x - Psychic
//								else	if(defensePokemon2type == 3'b101) 
//					begin
//					
//								if(attackPokemon1type == 3'b000 || attackPokemon1type == 3'b010 || attackPokemon1type == 3'b111)
//					begin
//					if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b011000)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b011000;//20
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b010000)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b010000;//16
//					end
//		          
//					end 
//					
//					else if(attackPokemon1type == 3'b110)
//					
//					begin
//					if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b010000)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b010000;//16
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b001100)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b010000;//12
//					end
//					
//					end
//
//					else
//					begin
//				if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b001100)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b001100;//12
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b001000)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b001000;//8
//					end
//					
//					end
//					
//					end
//					
//					
//					//Psychic
//					// 2x - None
//					// 0.5x - Fighting, Thunder, Psychic
//					// 1x - Leaf, Water, Fire, Flying, Rock
//				
//									else	if(defensePokemon2type == 3'b110) 
//					begin
////								if(attackPokemon1type == 3'b001 || attackPokemon1type == 3'b100)
////					begin
////					if(attack_poke1 > defense_poke2)
////					begin
////					if(hp_in < 6'b011000)
////					hp_out = 6'd0;
////					else
////					hp_out = hp_in - 6'b011000;//20
////			      end
////					
////					else 
////					begin
////					if(hp_in < 6'b010000)
////					hp_out = 6'd0;
////					else 
////					hp_out = hp_in = 6'b010000;//16
////					end
////		          
////					end 
////					
//					if(attackPokemon1type == 3'b111 || attackPokemon1type == 3'b011 || attackPokemon1type == 3'b110)
//					
//					begin
//					if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b010000)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b010000;//16
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b001100)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b010000;//12
//					end
//					
//					end
//
//					else
//					begin
//				if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b001100)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b001100;//12
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b001000)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b001000;//8
//					end
//					
//					end
//					
//					end
//					
//						//Fighting
//					// 2x - Leaf, Water, Fighting
//					// 0.5x - Rock, Fire, Thunder, Flying
//					// 1x - Psychic
//				
//							//else	if(defensePokemon2type == 3'b111) 
//							else
//					begin
//					
//								if(attackPokemon1type == 3'b000 || attackPokemon1type == 3'b010 || attackPokemon1type == 3'b111)
//					begin
//					if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b011000)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b011000;//20
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b010000)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b010000;//16
//					end
//		          
//					end 
//					
//					else if(attackPokemon1type == 3'b110 )
//					
//					begin
//					if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b010000)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b010000;//16
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b001100)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b010000;//12
//					end
//					
//					end
//
//					else
//					begin
//				if(attack_poke1 > defense_poke2)
//					begin
//					if(hp_in < 6'b001100)
//					hp_out = 6'd0;
//					else
//					hp_out = hp_in - 6'b001100;//12
//			      end
//					
//					else 
//					begin
//					if(hp_in < 6'b001000)
//					hp_out = 6'd0;
//					else 
//					hp_out = hp_in - 6'b001000;//8
//					end
//					
//					end
//					
//					end
//					
//					
//					end
//					endmodule
//					
//					
//				
//					
//					
//					