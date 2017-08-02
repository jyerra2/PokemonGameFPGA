//module battle(input Reset, input Clk, frameClk,
//				  input logic [7:0] keycode,
//
//				  input logic fight_on,
//				  input logic poke_faint, //battle_done from poke_battle
//				  output logic hp1_selbit,
//				  hp2_selbit,
//				  battle_end,
//				  output logic [2:0] battle_control, state_in
//
//
//				  );
//
//
//				  enum logic [3:0] {BATTLE_START, USER_DECIDE, USER_ATTACK, HOLD_USER, WILD_ATTACK, HOLD_WILD, POKE_FAINT, WILD_FAINT, BATTLE_END } state, next_state;
//
//				  //enum logic [2:0] {BATTLE_START, USER_ATTACK, WILD_ATTACK, POKE_FAINT, WILD_FAINT, BATTLE_END } state, next_state;
//
//				  logic [7:0] counter, counter_in;
//
//				 logic [2:0] battle_state;
//				 assign state_in = battle_state;
//			 //assign battle_control = battle_state;
//
//				  always_ff @ (posedge frameClk)
//					begin
//						if(Reset)
//							begin
//							state <= BATTLE_START;
//				         counter <= 8'd0;
//							end
//						else
//							begin
//							state <= next_state;
//				         counter <= counter_in;
//							end
//					end
//				  //Next State logic
//				  always_comb
//					begin
//				   next_state = state;
//
//					unique case(state)
//
//					BATTLE_START : begin
//
//					if(fight_on)
//					next_state = USER_ATTACK;
//					//next_state = BATTLE_END;
//
//					end
//
//					USER_ATTACK : begin
//					if(keycode == 8'h09) //F on the keyboard for fight
//					next_state = HOLD_4;
//					else if(keycode == 8'h08)// E on the keyboard for escape
//					next_state = BATTLE_END;
//					else if(poke_faint)
//					next_state = WILD_FAINT;
//					end
//
//					HOLD_4 : begin
//					if(counter == 8'd255)
//					next_state = WILD_ATTACK;
//					end
//
//
//					WILD_ATTACK : begin
//					if(poke_faint)
//					next_state = POKE_FAINT;
//				   else if(counter == 8'd255)
//					next_state = USER_ATTACK;
//
//
//
//					end
//
//					POKE_FAINT : begin
//					if(counter == 8'd255)
//					next_state = BATTLE_END;
//
//					end
//
//					WILD_FAINT : begin
//					if(counter == 8'd255)
//					next_state = BATTLE_END;
//					end
//
//					BATTLE_END : begin
//					next_state = BATTLE_START;
//					end
//
//					endcase
//
//					//Control Signals
//					counter_in = 8'd0;
//					hp1_selbit = 1'b0;
//					hp2_selbit = 1'b0;
//					battle_end = 1'b0;
//					battle_state = 3'b000;
//					unique case(state)
//
//					BATTLE_START : begin
//					battle_state = 3'b000;
//
//					end
//
//					USER_ATTACK : begin
//					battle_state = 3'b001;
//					//hp2_selbit = 1'b1;
//
//					end
//
//					HOLD_4 : begin
//					battle_state = 3'b010;
//	            counter_in = counter + 1'b1;
//					if(counter == 8'd0)
//					//hp2_selbit = 1'b1;
//					//else
//					hp2_selbit = 1'b1;
//					else
//					hp2_selbit = 1'b0;
//					end
////
//
//
//					WILD_ATTACK : begin
//					battle_state = 3'b011;
//					counter_in = counter + 1'b1;
//					if(counter == 8'd0)
//					hp1_selbit = 1'b1;
//					//battle_state = 3'b010;
//					else
//					hp1_selbit = 1'b0;
//					end
//
//					POKE_FAINT : begin
//					battle_state = 3'b100;
//					counter_in = counter + 1'b1;
//
//					end
//
//					WILD_FAINT : begin
//					battle_state = 3'b101;
//					counter_in = counter + 8'd1;
//
//					end
//
//					BATTLE_END : begin
//					battle_state = 3'b110;
//					battle_end = 1'b1;
//
//					end
//
//					endcase
//
//
//					end
//
//					endmodule
//
//
//
//
//
//
//
//

module battle(input Reset, input Clk, frameClk,
              input logic [7:0] keycode,

              input logic fight_on,
              input logic poke_faint, //battle_done from poke_battle
              output logic hp1_selbit,
              hp2_selbit,
              battle_end,
				  //during_battle,
              output logic [2:0] battle_control, state_in


             );


enum logic [3:0] {BATTLE_START, USER_DECIDE, USER_ATTACK, HOLD1_USER, HOLD2_USER, WILD_ATTACK, HOLD1_WILD, HOLD2_WILD, POKE_FAINT, WILD_FAINT, BATTLE_END } state, next_state;

//enum logic [2:0] {BATTLE_START, USER_ATTACK, WILD_ATTACK, POKE_FAINT, WILD_FAINT, BATTLE_END } state, next_state;

logic [7:0] counter, counter_in;
logic [6:0] counter2, counter2_in;

logic [3:0] battle_state;
assign battle_control = battle_state;
//assign battle_control = battle_state;

always_ff @ (posedge frameClk)
begin
if (Reset)
	begin
	state <= BATTLE_START;
counter <= 8'd0;
counter2 <= 7'd0;
end
else
	begin
	state <= next_state;
counter <= counter_in;
counter2 <= counter2_in;
end
end
//Next State logic
always_comb
begin
next_state = state;

unique case (state)

	BATTLE_START : begin

if (fight_on)
	next_state = USER_DECIDE;
//next_state = BATTLE_END;

end

USER_DECIDE : begin
if (keycode == 8'h09) //F on the keyboard for fight
        next_state = USER_ATTACK;
        else if(keycode == 8'h08)// E on the keyboard for escape
	next_state = BATTLE_END;
end

USER_ATTACK : begin
next_state = HOLD1_USER;
end

HOLD1_USER : begin

if (counter2 == 7'd127)
        next_state = HOLD2_USER;

        end

        HOLD2_USER : begin

        if(counter2 == 7'd127)
	begin
	if (poke_faint) next_state = WILD_FAINT;
	else next_state = WILD_ATTACK;
end
end

WILD_ATTACK : begin
next_state = HOLD1_WILD;
end

HOLD1_WILD : begin
if (counter2 == 7'd127)
        next_state = HOLD2_WILD;
        end

  HOLD2_WILD : begin
   if(counter2 == 7'd127)
	begin
	if (poke_faint) next_state = POKE_FAINT;
	else next_state = USER_DECIDE;
end

end

POKE_FAINT : begin
if (counter == 8'd255)
        next_state = BATTLE_END;

        end

        WILD_FAINT : begin
        if(counter == 8'd255)
	next_state = BATTLE_END;
end

BATTLE_END : begin
next_state = BATTLE_START;
end

endcase

//Control Signals
counter_in = 8'd0;
counter2_in = 7'd0;
hp1_selbit = 1'b0;
hp2_selbit = 1'b0;
battle_end = 1'b0;
battle_state = 4'b0000;
//during_battle = 1'b1;				 
unique case (state)

	BATTLE_START : begin
battle_state = 4'b0000;
//during_battle = 1'b0;

               end

               USER_DECIDE : begin
               battle_state = 4'b0001;
					
//hp2_selbit = 1'b1;

end

USER_ATTACK : begin
battle_state = 4'b0010;
               hp2_selbit = 1'b1;
				
end

HOLD1_USER : begin
battle_state = 4'b0011;
               counter2_in = counter2 + 1'b1;
				
end

HOLD2_USER : begin
battle_state = 4'b0100;
               counter2_in = counter2 + 1'b1;
					
end

WILD_ATTACK : begin
battle_state = 4'b0101;
               hp1_selbit = 1'b1;
					
end

HOLD1_WILD : begin
battle_state = 4'b0110;
               counter2_in = counter2 + 1'b1;
					
end


HOLD2_WILD : begin
battle_state = 4'b0111;
               counter2_in = counter2 + 1'b1;
end

POKE_FAINT : begin
battle_state = 4'b1000;
               counter_in = counter + 1'b1;

end

WILD_FAINT : begin
battle_state = 4'b1001;
               counter_in = counter + 1'b1;
end

BATTLE_END : begin
battle_state = 4'b1010;
               battle_end = 1'b1;

end

endcase


end

endmodule







