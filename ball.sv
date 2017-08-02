module  ball ( input         Reset, 
                             frame_clk,  
									output [1:0] spriteControlBits,	  
    								output [3:0] counter,
							      //output [4:0] counter2,
							      output rand5_start,	
								   output logic heal_on,	
									input logic [1:0] curr_map,
									//output logic counter2,
					input [7:0]   keycode,			  // The clock indicating a new frame (~60Hz)
               output [9:0]  BallX, BallY, BallS // Ball coordinates and size
              );
    
    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion;
    logic [9:0] Ball_X_Pos_in, Ball_X_Motion_in, Ball_Y_Pos_in, Ball_Y_Motion_in;
     
    parameter [9:0] Ball_X_Center=230;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=235;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis
    parameter [9:0] Ball_X_Size=28;//Divided size by 2        // Ball size
    parameter [9:0] Ball_Y_Size=40;//Divided size by 2
	 
    assign BallX = Ball_X_Pos;
    assign BallY = Ball_Y_Pos;
    assign BallS = Ball_X_Size;
	 
	 logic [1:0] spriteControlBits_in;
	 logic [3:0] counter_in;
	 logic [4:0] counter_in2;
	 logic rand5_start_in;
    logic heal_on_in;
    
    always_ff @ (posedge frame_clk or posedge Reset)
    begin
        if (Reset)
        begin
            Ball_X_Pos <= Ball_X_Center;
            Ball_Y_Pos <= Ball_Y_Center;
            Ball_X_Motion <= 10'd0;
				Ball_Y_Motion <= 10'd0;
            //Ball_Y_Motion <= Ball_Y_Step;
				spriteControlBits <= 2'b00;
      		counter <= 4'b0000;
				//counter2 <= 5'b00000;
				rand5_start <= 1'b0;
				heal_on = 1'b0;
				
        end
        else 
        begin
            Ball_X_Pos <= Ball_X_Pos_in;
            Ball_Y_Pos <= Ball_Y_Pos_in;
            Ball_X_Motion <= Ball_X_Motion_in;
            Ball_Y_Motion <= Ball_Y_Motion_in;
				spriteControlBits <= spriteControlBits_in;
    			counter <= counter_in;
				rand5_start <= rand5_start_in;
				heal_on = 1'b1;
				
    end
	 end
    
    always_comb
    begin
        // By default, keep motion unchanged
        Ball_X_Motion_in = Ball_X_Motion;
        Ball_Y_Motion_in = Ball_Y_Motion;
		  spriteControlBits_in = spriteControlBits;
        counter_in = counter;
		  rand5_start_in = 1'b0;
		  heal_on_in = 1'b0;
		  unique case(keycode)
		  
		  default:
		  begin
		  Ball_X_Motion_in = 10'd0;
		  Ball_Y_Motion_in = 10'd0;
		  
		  end
		  
		  8'h1A: 
		  begin
		  Ball_X_Motion_in = 10'd0;
		  Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);
		  spriteControlBits_in = 2'b11;
		  counter_in = (counter_in+1)%12;
		  
		  end
		  
		  8'h16: 
		  begin
		  Ball_X_Motion_in = 10'd0;
		  Ball_Y_Motion_in = Ball_Y_Step;
		  spriteControlBits_in = 2'b00;
		  counter_in = (counter_in+1)%12;
		  end
		  
		  8'h07: 
		  begin
		  Ball_Y_Motion_in = 10'd0;
		  Ball_X_Motion_in = Ball_X_Step;
		  spriteControlBits_in = 2'b10;
		  counter_in = (counter_in+1)%12;
		  end
		  
		  8'h04: 
		  begin
		  Ball_Y_Motion_in = 10'd0;
		  Ball_X_Motion_in = (~(Ball_X_Step) + 1'b1);
		   spriteControlBits_in = 2'b01;
		  counter_in = (counter_in+1)%12;
		  end
		  
		  endcase
        // Be careful when using comparators with "logic" datatype becuase compiler treats 
        //   both sides of the operator UNSIGNED numbers. (unless with further type casting)
        // e.g. Ball_Y_Pos - Ball_Size <= Ball_Y_Min 
        // If Ball_Y_Pos is 0, then Ball_Y_Pos - Ball_Size will not be -4, but rather a large positive number.
		if (curr_map== 2'b01 || curr_map == 2'b00)
		begin // begin for map1
		  if ((Ball_Y_Pos+Ball_Y_Size>=280&& Ball_Y_Pos+Ball_Y_Size<=350 && Ball_X_Pos+Ball_X_Size>=0 && Ball_X_Pos+Ball_X_Size<=200) || (Ball_Y_Pos+Ball_Y_Size>=170&& Ball_Y_Pos+Ball_Y_Size<=270 && Ball_X_Pos+Ball_X_Size>=430 && Ball_X_Pos+Ball_X_Size<=640))
		  begin
		 rand5_start_in= 1'b1; //set control bits to start random number generator
		  end 
		 
        else if ((Ball_Y_Pos + Ball_Y_Size >= Ball_Y_Max ) ||(Ball_Y_Pos  >= 10'd27 && Ball_Y_Pos<=10'd50 && Ball_X_Pos >= 10'd14 && Ball_X_Pos <= 10'd144) ||(Ball_Y_Pos  >= 10'd104 && Ball_Y_Pos<=10'd120 && Ball_X_Pos >= 10'd184 && Ball_X_Pos <= 10'd294)|| (Ball_Y_Pos  >= 10'd251 && Ball_Y_Pos<=10'd270 && Ball_X_Pos >= 10'd486 && Ball_X_Pos <= 10'd601)|| (Ball_Y_Pos  >= 10'd340 && Ball_Y_Pos<=10'd360 && Ball_X_Pos >= 10'd0 && Ball_X_Pos <= 10'd640)|| (Ball_X_Pos >=10'd346 && Ball_X_Pos <=10'd640 && Ball_Y_Pos<=10'd55 &&Ball_Y_Pos>=10'd41))
		      //changed Ball_X_Pos >= 10'd42 to 10'd14  
		      // Ball is at the bottom edge, BOUNCE!
            //Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);  // 2's complement.  
				  begin
				  if(keycode == 8'h1A)
				  begin
				  Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);
				  end
				  else if(keycode==8'h04)
				  begin
					Ball_X_Motion_in = (~(Ball_X_Step) + 1'b1);
					end
					else if(keycode == 8'h07)
					begin
					Ball_X_Motion_in = Ball_X_Step;
					end
				  else
				  Ball_Y_Motion_in = 10'd0;
				  end
        
		  else if ( (Ball_Y_Pos <= Ball_Y_Min + (Ball_Y_Size/4)-4) ||(Ball_X_Pos >=10'd14 && Ball_X_Pos <=10'd144 && Ball_Y_Pos<=10'd146 &&Ball_Y_Pos>=10'd132) ||(Ball_X_Pos >=10'd184 && Ball_X_Pos <=10'd294 && Ball_Y_Pos<=10'd230 &&Ball_Y_Pos>=10'd210)|| (Ball_X_Pos >=10'd486 && Ball_X_Pos <=10'd601 && Ball_Y_Pos<=10'd368 &&Ball_Y_Pos>=10'd355) || (Ball_X_Pos >=10'd346 && Ball_X_Pos <=10'd640 && Ball_Y_Pos<=10'd160 &&Ball_Y_Pos>=10'd150) )  // Ball is at the top edge, BOUNCE!
              begin
				  if(keycode == 8'h16)
				  begin
				  Ball_Y_Motion_in = Ball_Y_Step;
				  end
				  else if(keycode==8'h04)
				  begin
					Ball_X_Motion_in = (~(Ball_X_Step) + 1'b1);
					end
					else if(keycode == 8'h07)
					begin
					Ball_X_Motion_in = Ball_X_Step;
					end
				  else
				  Ball_Y_Motion_in = 10'd0;
				  end
		  
		  else if ( (Ball_X_Pos + Ball_X_Size >= Ball_X_Max) ||(Ball_X_Pos>=10'd14 && Ball_X_Pos<= 10'd18&& Ball_Y_Pos>=10'd26&& Ball_Y_Pos<=10'd146)||(Ball_X_Pos>=10'd182 && Ball_X_Pos<=10'd200 && Ball_Y_Pos>=10'd102&& Ball_Y_Pos<=10'd230)||(Ball_X_Pos>=10'd486 && Ball_X_Pos<=10'd500 && Ball_Y_Pos>=10'd251&& Ball_Y_Pos<=10'd368)||(Ball_X_Pos>=10'd346 && Ball_X_Pos<=10'd350 && Ball_Y_Pos>=10'd41&& Ball_Y_Pos<=10'd160) )
		         begin
					if(keycode == 8'h04)
					begin
					Ball_X_Motion_in = (~(Ball_X_Step) + 1'b1);
					end
					else if(keycode == 8'h16)
				  begin
				  Ball_Y_Motion_in = Ball_Y_Step;
				  end
				   else if(keycode == 8'h1A)
				  begin
				  Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);
				  end
					else Ball_X_Motion_in = 10'd0;
					end
		 
		 else if ( (Ball_X_Pos <= Ball_X_Min + (Ball_X_Size/4)-2)||(Ball_X_Pos<=146&& Ball_X_Pos>=140&& Ball_Y_Pos>=26&&Ball_Y_Pos<=146)||(Ball_X_Pos<=294&& Ball_X_Pos>=288&& Ball_Y_Pos>=82&&Ball_Y_Pos<=230)||(Ball_X_Pos<=601&& Ball_X_Pos>=590&& Ball_Y_Pos>=251&&Ball_Y_Pos<=368) ) 		
               begin
					if(keycode == 8'h07)
					begin
					Ball_X_Motion_in = Ball_X_Step;
					end
					else if(keycode == 8'h16)
				  begin
				  Ball_Y_Motion_in = Ball_Y_Step;
				  end
				   else if(keycode == 8'h1A)
				  begin
				  Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);
				  end
					else Ball_X_Motion_in = 10'd0;
					end
					
			else if(Ball_X_Pos>=73&&Ball_X_Pos<=114&&Ball_Y_Pos>=150&&Ball_Y_Pos<=168 && keycode == 8'h0b)
	          begin
			    heal_on_in= 1'b1;
				 end	 
				 
			else 
	           heal_on_in= 1'b0;		
		end //end for map1	

       else if(curr_map == 2'b10)
	begin //begin for map2
      if ((  Ball_Y_Pos+Ball_Y_Size>=310&& Ball_Y_Pos+Ball_Y_Size<=470 && Ball_X_Pos+Ball_X_Size>=0 && Ball_X_Pos+Ball_X_Size<=305) )
		  begin
		 rand5_start_in= 1'b1; //set control bits to start random number generator
		  end 
		 
        else if ((Ball_Y_Pos + Ball_Y_Size >= Ball_Y_Max ) ||(Ball_Y_Pos  >= 10'd320 && Ball_Y_Pos<=10'd340 && Ball_X_Pos >= 10'd345 && Ball_X_Pos <= 10'd639) ||(Ball_Y_Pos  >= 10'd66 && Ball_Y_Pos<=10'd85 && Ball_X_Pos >= 10'd290 && Ball_X_Pos <= 10'd418))
		      //changed Ball_X_Pos >= 10'd42 to 10'd14  
		      // Ball is at the bottom edge, BOUNCE!
            //Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);  // 2's complement.  
				  begin
				  if(keycode == 8'h1A)
				  begin
				  Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);
				  end
				  else if(keycode==8'h04)
				  begin
					Ball_X_Motion_in = (~(Ball_X_Step) + 1'b1);
					end
					else if(keycode == 8'h07)
					begin
					Ball_X_Motion_in = Ball_X_Step;
					end
				  else
				  Ball_Y_Motion_in = 10'd0;
				  end
        
		  else if ( (Ball_Y_Pos <= Ball_Y_Min + (Ball_Y_Size/4)-4) ||(Ball_X_Pos >=10'd0 && Ball_X_Pos <=10'd20 && Ball_Y_Pos<=10'd77 &&Ball_Y_Pos>=10'd50) ||(Ball_X_Pos >=10'd20 && Ball_X_Pos <=10'd129 && Ball_Y_Pos<=10'd230 &&Ball_Y_Pos>=10'd210)|| (Ball_X_Pos >=10'd160 && Ball_X_Pos <=10'd205 && Ball_Y_Pos<=10'd200 &&Ball_Y_Pos>=10'd190) || (Ball_X_Pos >=10'd580 && Ball_X_Pos <=10'd640 && Ball_Y_Pos<=10'd183 &&Ball_Y_Pos>=10'd160)|| (Ball_X_Pos >=10'd290 && Ball_X_Pos <=10'd354 && Ball_Y_Pos<=10'd202 &&Ball_Y_Pos>=10'd185)|| (Ball_X_Pos >=10'd374 && Ball_X_Pos <=10'd447 && Ball_Y_Pos<=10'd202 &&Ball_Y_Pos>=10'd185)|| (Ball_X_Pos >=10'd355 && Ball_X_Pos <=10'd395 && Ball_Y_Pos<=10'd182 &&Ball_Y_Pos>=10'd170))  // Ball is at the top edge, BOUNCE!
              begin
				  if(keycode == 8'h16)
				  begin
				  Ball_Y_Motion_in = Ball_Y_Step;
				  end
				  else if(keycode==8'h04)
				  begin
					Ball_X_Motion_in = (~(Ball_X_Step) + 1'b1);
					end
					else if(keycode == 8'h07)
					begin
					Ball_X_Motion_in = Ball_X_Step;
					end
				  else
				  Ball_Y_Motion_in = 10'd0;
				  end
		  
		  else if ( (Ball_X_Pos + Ball_X_Size >= Ball_X_Max) ||(Ball_X_Pos>=10'd18 && Ball_X_Pos<= 10'd28&& Ball_Y_Pos>=10'd88&& Ball_Y_Pos<=10'd223)||(Ball_X_Pos>=10'd292 && Ball_X_Pos<=10'd310 && Ball_Y_Pos>=10'd268&& Ball_Y_Pos<=10'd480)||(Ball_X_Pos>=10'd286 && Ball_X_Pos<=10'd300 && Ball_Y_Pos>=10'd62&& Ball_Y_Pos<=10'd202)||(Ball_X_Pos>=10'd523 && Ball_X_Pos<=10'd550 && Ball_Y_Pos>=10'd0&& Ball_Y_Pos<=10'd184) )
		         begin
					if(keycode == 8'h04)
					begin
					Ball_X_Motion_in = (~(Ball_X_Step) + 1'b1);
					end
					else if(keycode == 8'h16)
				  begin
				  Ball_Y_Motion_in = Ball_Y_Step;
				  end
				   else if(keycode == 8'h1A)
				  begin
				  Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);
				  end
					else Ball_X_Motion_in = 10'd0;
					end
		 
		 else if ( (Ball_X_Pos <= Ball_X_Min + (Ball_X_Size/4)-2)||(Ball_X_Pos<=182 && Ball_X_Pos>=160&& Ball_Y_Pos>=0 &&Ball_Y_Pos<=220)||(Ball_X_Pos<=443&& Ball_X_Pos>=420&& Ball_Y_Pos>=63&&Ball_Y_Pos<=202)) 		
               begin
					if(keycode == 8'h07)
					begin
					Ball_X_Motion_in = Ball_X_Step;
					end
					else if(keycode == 8'h16)
				  begin
				  Ball_Y_Motion_in = Ball_Y_Step;
				  end
				   else if(keycode == 8'h1A)
				  begin
				  Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);
				  end
					else Ball_X_Motion_in = 10'd0;
					end
					
			else if (Ball_X_Pos>=352&& Ball_X_Pos<=392&&Ball_Y_Pos>=182 &&Ball_Y_Pos<=211 && keycode == 8'h0b)
	           begin
				   heal_on_in= 1'b1;
		        end		
				  else
				  heal_on_in= 1'b0;
   end  //end for map2

   else if (curr_map==2'b11)
begin // begin for map3 

if ((  Ball_Y_Pos+Ball_Y_Size>=0&& Ball_Y_Pos+Ball_Y_Size<=160 && Ball_X_Pos+Ball_X_Size>=320 && Ball_X_Pos+Ball_X_Size<=428)|| ( Ball_Y_Pos+Ball_Y_Size>=400&& Ball_Y_Pos+Ball_Y_Size<=479 && Ball_X_Pos+Ball_X_Size>=174 && Ball_X_Pos+Ball_X_Size<=236))
		  begin
		 rand5_start_in= 1'b1; //set control bits to start random number generator
		  end 
		 
        else if ((Ball_Y_Pos + Ball_Y_Size >= Ball_Y_Max ) ||(Ball_Y_Pos  >= 10'd306 && Ball_Y_Pos<=10'd340 && Ball_X_Pos >= 10'd234 && Ball_X_Pos <= 10'd639) ||(Ball_Y_Pos  >= 10'd345 && Ball_Y_Pos<=10'd360 && Ball_X_Pos >= 10'd0&& Ball_X_Pos <= 10'd18)|| (Ball_Y_Pos  >= 10'd270 && Ball_Y_Pos<=10'd290 && Ball_X_Pos >= 10'd18&& Ball_X_Pos <= 10'd149))
		      //changed Ball_X_Pos >= 10'd42 to 10'd14  
		      // Ball is at the bottom edge, BOUNCE!
            //Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);  // 2's complement.  
				  begin
				  if(keycode == 8'h1A)
				  begin
				  Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);
				  end
				  else if(keycode==8'h04)
				  begin
					Ball_X_Motion_in = (~(Ball_X_Step) + 1'b1);
					end
					else if(keycode == 8'h07)
					begin
					Ball_X_Motion_in = Ball_X_Step;
					end
				  else
				  Ball_Y_Motion_in = 10'd0;
				  end
        
		  else if ( (Ball_Y_Pos <= Ball_Y_Min + (Ball_Y_Size/4)-4) ||(Ball_X_Pos >=10'd0 && Ball_X_Pos <=10'd309 && Ball_Y_Pos<=10'd105 &&Ball_Y_Pos>=10'd80) ||(Ball_X_Pos >=10'd101 && Ball_X_Pos <=10'd233 && Ball_Y_Pos<=10'd211 &&Ball_Y_Pos>=10'd190)|| (Ball_X_Pos >=10'd421 && Ball_X_Pos <=10'd464 && Ball_Y_Pos<=10'd221 &&Ball_Y_Pos>=10'd190) || (Ball_X_Pos >=10'd467 && Ball_X_Pos <=10'd487 && Ball_Y_Pos<=10'd240 &&Ball_Y_Pos>=10'd230)|| (Ball_X_Pos >=10'd490 && Ball_X_Pos <=10'd550 && Ball_Y_Pos<=10'd261 &&Ball_Y_Pos>=10'd250)|| (Ball_X_Pos >=10'd554 && Ball_X_Pos <=10'd572 && Ball_Y_Pos<=10'd240 &&Ball_Y_Pos>=10'd230)|| (Ball_X_Pos >=10'd599 && Ball_X_Pos <=10'd639 && Ball_Y_Pos<=10'd209 &&Ball_Y_Pos>=10'd195))  // Ball is at the top edge, BOUNCE!
              begin
				  if(keycode == 8'h16)
				  begin
				  Ball_Y_Motion_in = Ball_Y_Step;
				  end
				  else if(keycode==8'h04)
				  begin
					Ball_X_Motion_in = (~(Ball_X_Step) + 1'b1);
					end
					else if(keycode == 8'h07)
					begin
					Ball_X_Motion_in = Ball_X_Step;
					end
				  else
				  Ball_Y_Motion_in = 10'd0;
				  end
		  
		  else if ( (Ball_X_Pos + Ball_X_Size >= Ball_X_Max) ||(Ball_X_Pos>=10'd100 && Ball_X_Pos<= 10'd110&& Ball_Y_Pos>=10'd95&& Ball_Y_Pos<=10'd209)||(Ball_X_Pos>=10'd387 && Ball_X_Pos<=10'd400 && Ball_Y_Pos>=10'd0&& Ball_Y_Pos<=10'd104)||(Ball_X_Pos>=10'd440 && Ball_X_Pos<=10'd450 && Ball_Y_Pos>=10'd87&& Ball_Y_Pos<=10'd205)||(Ball_X_Pos>=10'd466 && Ball_X_Pos<=10'd480 && Ball_Y_Pos>=10'd0190&& Ball_Y_Pos<=10'd238) ||(Ball_X_Pos>=10'd487 && Ball_X_Pos<= 10'd497&& Ball_Y_Pos>=10'd200&& Ball_Y_Pos<=10'd258)||(Ball_X_Pos>=10'd18 && Ball_X_Pos<= 10'd30&& Ball_Y_Pos>=10'd272&& Ball_Y_Pos<=10'd385)||(Ball_X_Pos>=10'd230 && Ball_X_Pos<= 10'd210&& Ball_Y_Pos>=10'd308&& Ball_Y_Pos<=10'd480) )
		         begin
					if(keycode == 8'h04)
					begin
					Ball_X_Motion_in = (~(Ball_X_Step) + 1'b1);
					end
					else if(keycode == 8'h16)
				  begin
				  Ball_Y_Motion_in = Ball_Y_Step;
				  end
				   else if(keycode == 8'h1A)
				  begin
				  Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);
				  end
					else Ball_X_Motion_in = 10'd0;
					end
		 
		 else if ( (Ball_X_Pos <= Ball_X_Min + (Ball_X_Size/4)-2)||(Ball_X_Pos<=316 && Ball_X_Pos>=300&& Ball_Y_Pos>=0 &&Ball_Y_Pos<=109)||(Ball_X_Pos<=236&& Ball_X_Pos>=220&& Ball_Y_Pos>=86&&Ball_Y_Pos<=212)||(Ball_X_Pos<=150&& Ball_X_Pos>=140&& Ball_Y_Pos>=271&&Ball_Y_Pos<=410)) 		
               begin
					if(keycode == 8'h07)
					begin
					Ball_X_Motion_in = Ball_X_Step;
					end
					else if(keycode == 8'h16)
				  begin
				  Ball_Y_Motion_in = Ball_Y_Step;
				  end
				   else if(keycode == 8'h1A)
				  begin
				  Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);
				  end
					else Ball_X_Motion_in = 10'd0;
					end
					
			else if (Ball_X_Pos>=140&&Ball_X_Pos<=180&& Ball_Y_Pos>=215&&Ball_Y_Pos<=223 && keycode == 8'h0b)
	             begin
				    heal_on_in= 1'b1; //new
				    end	
					 
			end
			
			else
			begin
		       heal_on_in= 1'b0; //new	
				 end

	//end for map3

					
        // Update the ball's position with its motion
        Ball_X_Pos_in = Ball_X_Pos + Ball_X_Motion;
        Ball_Y_Pos_in = Ball_Y_Pos + Ball_Y_Motion;
        
    /**************************************************************************************
        ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
        Hidden Question #2/2:
          Notice that Ball_Y_Pos is updated using Ball_Y_Motion. 
          Will the new value of Ball_Y_Motion be used when Ball_Y_Pos is updated, or the old? 
          What is the difference between writing
            "Ball_Y_Pos_in = Ball_Y_Pos + Ball_Y_Motion;" and 
            "Ball_Y_Pos_in = Ball_Y_Pos + Ball_Y_Motion_in;"?
          How will this impact behavior of the ball during a bounce, and how might that interact with a response to a keypress?
          Give an answer in your Post-Lab.
    **************************************************************************************/
        
end 
    
endmodule
 
 
 
 
 
// 
// 
// //-------------------------------------------------------------------------
////    Ball.sv                                                            --
////    Viral Mehta                                                        --
////    Spring 2005                                                        --
////                                                                       --
////    Modified by Stephen Kempf 03-01-2006                               --
////                              03-12-2007                               --
////    Translated by Joe Meng    07-07-2013                               --
////    Modified by Po-Han Huang  03-03-2017                               --
////    Spring 2017 Distribution                                           --
////                                                                       --
////    For use with ECE 298 Lab 7                                         --
////    UIUC ECE Department                                                --
////-------------------------------------------------------------------------
//
//
//module  ball ( input         Reset, 
//                             frame_clk,  
//									output [1:0] spriteControlBits,	  
//    								output [3:0] counter,  
//					input [7:0]   keycode,			  // The clock indicating a new frame (~60Hz)
//               output [9:0]  BallX, BallY, BallS, // Ball coordinates and size
//					output logic rand5_start
//              );
//    
//    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion;
//    logic [9:0] Ball_X_Pos_in, Ball_X_Motion_in, Ball_Y_Pos_in, Ball_Y_Motion_in;
//     
//    parameter [9:0] Ball_X_Center=230;  // Center position on the X axis
//    parameter [9:0] Ball_Y_Center=235;  // Center position on the Y axis
//    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
//    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
//    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
//    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
//    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
//    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis
//    parameter [9:0] Ball_X_Size=28;//Divided size by 2        // Ball size
//    parameter [9:0] Ball_Y_Size=40;//Divided size by 2
//	 
//    assign BallX = Ball_X_Pos;
//    assign BallY = Ball_Y_Pos;
//    assign BallS = Ball_X_Size;
//	 
//	 logic [1:0] spriteControlBits_in;
//	 logic [3:0] counter_in;
//	 logic rand5_start_in;
//    
//    always_ff @ (posedge frame_clk or posedge Reset)
//    begin
//        if (Reset)
//        begin
//            Ball_X_Pos <= Ball_X_Center;
//            Ball_Y_Pos <= Ball_Y_Center;
//            Ball_X_Motion <= 10'd0;
//				Ball_Y_Motion <= 10'd0;
//            //Ball_Y_Motion <= Ball_Y_Step;
//				spriteControlBits <= 2'b00;
//      		counter <= 3'b000;
//				rand5_start = 1'b0;
//				
//        end
//        else 
//        begin
//            Ball_X_Pos <= Ball_X_Pos_in;
//            Ball_Y_Pos <= Ball_Y_Pos_in;
//            Ball_X_Motion <= Ball_X_Motion_in;
//            Ball_Y_Motion <= Ball_Y_Motion_in;
//				spriteControlBits <= spriteControlBits_in;
//    			counter <= counter_in;
//				rand5_start = rand5_start_in;
//        end
//    end
//    
//    always_comb
//    begin
//        // By default, keep motion unchanged
//        Ball_X_Motion_in = Ball_X_Motion;
//        Ball_Y_Motion_in = Ball_Y_Motion;
//		  spriteControlBits_in = spriteControlBits;
//        counter_in = counter;
//		  rand5_start_in = 1'b0;
//		  unique case(keycode)
//		  
//		  default:
//		  begin
//		  Ball_X_Motion_in = 10'd0;
//		  Ball_Y_Motion_in = 10'd0;
//		  end
//		  
//		  8'h1A: 
//		  begin
//		  Ball_X_Motion_in = 10'd0;
//		  Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);
//		  spriteControlBits_in = 2'b11;
//		  counter_in = (counter_in+1)%12;
//		  
//		  end
//		  
//		  8'h16: 
//		  begin
//		  Ball_X_Motion_in = 10'd0;
//		  Ball_Y_Motion_in = Ball_Y_Step;
//		  spriteControlBits_in = 2'b00;
//		  counter_in = (counter_in+1)%12;
//		  end
//		  
//		  8'h07: 
//		  begin
//		  Ball_Y_Motion_in = 10'd0;
//		  Ball_X_Motion_in = Ball_X_Step;
//		  spriteControlBits_in = 2'b10;
//		  counter_in = (counter_in+1)%12;
//		  end
//		  
//		  8'h04: 
//		  begin
//		  Ball_Y_Motion_in = 10'd0;
//		  Ball_X_Motion_in = (~(Ball_X_Step) + 1'b1);
//		   spriteControlBits_in = 2'b01;
//		  counter_in = (counter_in+1)%12;
//		  end
//		  
//		  endcase
//		  
//		  if ((Ball_Y_Pos+Ball_Y_Size>=280&& Ball_Y_Pos+Ball_Y_Size<=350 && Ball_X_Pos+Ball_X_Size>=0 && Ball_X_Pos+Ball_X_Size<=200) || (Ball_Y_Pos+Ball_Y_Size>=170&& Ball_Y_Pos+Ball_Y_Size<=270 && Ball_X_Pos+Ball_X_Size>=430 && Ball_X_Pos+Ball_X_Size<=640))
//		  begin
//		 rand5_start_in= 1'b1; //set control bits to start random number generator
//		  end 
//        // Be careful when using comparators with "logic" datatype becuase compiler treats 
//        //   both sides of the operator UNSIGNED numbers. (unless with further type casting)
//        // e.g. Ball_Y_Pos - Ball_Size <= Ball_Y_Min 
//        // If Ball_Y_Pos is 0, then Ball_Y_Pos - Ball_Size will not be -4, but rather a large positive number.
//        else if ((Ball_Y_Pos + Ball_Y_Size >= Ball_Y_Max ) ||(Ball_Y_Pos  >= 10'd27 && Ball_Y_Pos<=10'd50 && Ball_X_Pos >= 10'd14 && Ball_X_Pos <= 10'd144) ||(Ball_Y_Pos  >= 10'd104 && Ball_Y_Pos<=10'd120 && Ball_X_Pos >= 10'd184 && Ball_X_Pos <= 10'd294)|| (Ball_Y_Pos  >= 10'd251 && Ball_Y_Pos<=10'd270 && Ball_X_Pos >= 10'd486 && Ball_X_Pos <= 10'd601)|| (Ball_Y_Pos  >= 10'd340 && Ball_Y_Pos<=10'd360 && Ball_X_Pos >= 10'd0 && Ball_X_Pos <= 10'd640)|| (Ball_X_Pos >=10'd346 && Ball_X_Pos <=10'd640 && Ball_Y_Pos<=10'd55 &&Ball_Y_Pos>=10'd41))
//		      //changed Ball_X_Pos >= 10'd42 to 10'd14  
//		      // Ball is at the bottom edge, BOUNCE!
//            //Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);  // 2's complement.  
//				  begin
//				  if(keycode == 8'h1A)
//				  begin
//				  Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);
//				  end
//				  else if(keycode==8'h04)
//				  begin
//					Ball_X_Motion_in = (~(Ball_X_Step) + 1'b1);
//					end
//					else if(keycode == 8'h07)
//					begin
//					Ball_X_Motion_in = Ball_X_Step;
//					end
//				  else
//				  Ball_Y_Motion_in = 10'd0;
//				  end
//        
//		  else if ( (Ball_Y_Pos <= Ball_Y_Min + (Ball_Y_Size/4)-4) ||(Ball_X_Pos >=10'd14 && Ball_X_Pos <=10'd144 && Ball_Y_Pos<=10'd146 &&Ball_Y_Pos>=10'd132) ||(Ball_X_Pos >=10'd184 && Ball_X_Pos <=10'd294 && Ball_Y_Pos<=10'd230 &&Ball_Y_Pos>=10'd210)|| (Ball_X_Pos >=10'd486 && Ball_X_Pos <=10'd601 && Ball_Y_Pos<=10'd368 &&Ball_Y_Pos>=10'd355) || (Ball_X_Pos >=10'd346 && Ball_X_Pos <=10'd640 && Ball_Y_Pos<=10'd160 &&Ball_Y_Pos>=10'd150) )  // Ball is at the top edge, BOUNCE!
//              begin
//				  if(keycode == 8'h16)
//				  begin
//				  Ball_Y_Motion_in = Ball_Y_Step;
//				  end
//				  else if(keycode==8'h04)
//				  begin
//					Ball_X_Motion_in = (~(Ball_X_Step) + 1'b1);
//					end
//					else if(keycode == 8'h07)
//					begin
//					Ball_X_Motion_in = Ball_X_Step;
//					end
//				  else
//				  Ball_Y_Motion_in = 10'd0;
//				  end
//		  
//		  else if ( (Ball_X_Pos + Ball_X_Size >= Ball_X_Max) ||(Ball_X_Pos>=10'd14 && Ball_X_Pos<= 10'd18&& Ball_Y_Pos>=10'd26&& Ball_Y_Pos<=10'd146)||(Ball_X_Pos>=10'd182 && Ball_X_Pos<=10'd200 && Ball_Y_Pos>=10'd102&& Ball_Y_Pos<=10'd230)||(Ball_X_Pos>=10'd486 && Ball_X_Pos<=10'd500 && Ball_Y_Pos>=10'd251&& Ball_Y_Pos<=10'd368)||(Ball_X_Pos>=10'd346 && Ball_X_Pos<=10'd350 && Ball_Y_Pos>=10'd41&& Ball_Y_Pos<=10'd160) )
//		         begin
//					if(keycode == 8'h04)
//					begin
//					Ball_X_Motion_in = (~(Ball_X_Step) + 1'b1);
//					end
//					else if(keycode == 8'h16)
//				  begin
//				  Ball_Y_Motion_in = Ball_Y_Step;
//				  end
//				   else if(keycode == 8'h1A)
//				  begin
//				  Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);
//				  end
//					else Ball_X_Motion_in = 10'd0;
//					end
//		 
//		 else if ( (Ball_X_Pos <= Ball_X_Min + (Ball_X_Size/4)-2)||(Ball_X_Pos<=146&& Ball_X_Pos>=140&& Ball_Y_Pos>=26&&Ball_Y_Pos<=146)||(Ball_X_Pos<=294&& Ball_X_Pos>=288&& Ball_Y_Pos>=82&&Ball_Y_Pos<=230)||(Ball_X_Pos<=601&& Ball_X_Pos>=590&& Ball_Y_Pos>=251&&Ball_Y_Pos<=368) ) 		
//               begin
//					if(keycode == 8'h07)
//					begin
//					Ball_X_Motion_in = Ball_X_Step;
//					end
//					else if(keycode == 8'h16)
//				  begin
//				  Ball_Y_Motion_in = Ball_Y_Step;
//				  end
//				   else if(keycode == 8'h1A)
//				  begin
//				  Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);
//				  end
//					else Ball_X_Motion_in = 10'd0;
//					end
//					
//        // Update the ball's position with its motion
//        Ball_X_Pos_in = Ball_X_Pos + Ball_X_Motion;
//        Ball_Y_Pos_in = Ball_Y_Pos + Ball_Y_Motion;
//        
//    /**************************************************************************************
//        ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
//        Hidden Question #2/2:
//          Notice that Ball_Y_Pos is updated using Ball_Y_Motion. 
//          Will the new value of Ball_Y_Motion be used when Ball_Y_Pos is updated, or the old? 
//          What is the difference between writing
//            "Ball_Y_Pos_in = Ball_Y_Pos + Ball_Y_Motion;" and 
//            "Ball_Y_Pos_in = Ball_Y_Pos + Ball_Y_Motion_in;"?
//          How will this impact behavior of the ball during a bounce, and how might that interact with a response to a keypress?
//          Give an answer in your Post-Lab.
//    **************************************************************************************/
//        
//    end
//    
//endmodule
