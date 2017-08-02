module rand_counter
(input frameClk,
 Reset,
 input rand5_start,
 input [7:0] keycode,
 output fight_on,
 output logic [1:0] gg

);

	logic [8:0] Counter;
	//logic wild_found;

always_ff @ (posedge frameClk)
begin
//if(wild_found==1'b0)
Counter <= (Counter+1)%510;
//else
//Counter<= Counter;
end

always_ff @ (posedge frameClk)
 begin
 if(Reset)
 begin
 //Counter= 9'b000000000;
 fight_on= 1'b0;
 gg <=2'b00;
 end
 
  if (Counter >=9'b110010000 && (keycode ==8'h1a || keycode==8'h16|| keycode==8'h07 || keycode==8'h04)&& rand5_start==1'b1)
 begin
 fight_on <=1'b1;
 //wild_found <= 1'b1;
 gg <=2'b11;
 end

 else
 begin
 fight_on<= 1'b0;
 //wild_found<= 1'b0;
 gg <=2'b01;
 end
end
endmodule
