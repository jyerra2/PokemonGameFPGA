module battleSpriteName(input logic [4:0] userPkmnID,
														wildPkmnID,
								output logic [7:0] u[0:9],
														 w[0:9]	);
														 //User Pokemon Names
														 always_comb
														 begin
														 
														 u[0] = 8'h00;//" "
														 u[1] = 8'h00;//" "
														 u[2] = 8'h00;//" "
														 u[3] = 8'h00;//" "
														 u[4] = 8'h00;//" "
														 u[5] = 8'h00;//" "
														 u[6] = 8'h00;//" "
														 u[7] = 8'h00;//" "
														 u[8] = 8'h00;//" "
														 u[9] = 8'h00;//" "
													
														 
														 if(userPkmnID == 5'b00011)
														 begin
														 u[0] = 8'h42;//B
														 u[1] = 8'h75;//u
														 u[2] = 8'h6c;//l
														 u[3] = 8'h62;//b
														 u[4] = 8'h61;//a
														 u[5] = 8'h73;//s
														 u[6] = 8'h61;//a
														 u[7] = 8'h75;//u
														 u[8] = 8'h72;//r
														 u[9] = 8'h00;//" "
														 end 
														 else if(userPkmnID == 5'b00100)
														 begin
														 u[0] = 8'h43;//C
														 u[1] = 8'h68;//h
														 u[2] = 8'h61;//a
														 u[3] = 8'h72;//r
														 u[4] = 8'h6d;//m
														 u[5] = 8'h61;//a
														 u[6] = 8'h6e;//n
														 u[7] = 8'h64;//d
														 u[8] = 8'h65;//e
														 u[9] = 8'h72;//r
														 end 
														  else if(userPkmnID == 5'b00101)
														 begin
														 u[0] = 8'h53;//S
														 u[1] = 8'h71;//q
														 u[2] = 8'h75;//u
														 u[3] = 8'h69;//i
														 u[4] = 8'h72;//r
														 u[5] = 8'h74;//t
														 u[6] = 8'h6c;//l
														 u[7] = 8'h65;//e
														 u[8] = 8'h00;//" "
														 u[9] = 8'h00;//" "
														 end
														  else if(userPkmnID == 5'b00110)
														 begin
														 u[0] = 8'h49;//I
														 u[1] = 8'h76;//v
														 u[2] = 8'h79;//y
														 u[3] = 8'h73;//s
														 u[4] = 8'h61;//a
														 u[5] = 8'h75;//u
														 u[6] = 8'h72;//r
														 u[7] = 8'h00;//" "
														 u[8] = 8'h00;//" "
														 u[9] = 8'h00;//" "
														 end
														else if(userPkmnID == 5'b00111)
														 begin
														 u[0] = 8'h43;//C
														 u[1] = 8'h68;//h
														 u[2] = 8'h61;//a
														 u[3] = 8'h72;//r
														 u[4] = 8'h6d;//m
														 u[5] = 8'h65;//e
														 u[6] = 8'h6c;//l
														 u[7] = 8'h65;//e
														 u[8] = 8'h6f;//o
														 u[9] = 8'h6e;//n
														 end
														 else if(userPkmnID == 5'b01000)
														 begin
														 u[0] = 8'h57;//W
														 u[1] = 8'h61;//a
														 u[2] = 8'h72;//r
														 u[3] = 8'h74;//t
														 u[4] = 8'h6f;//o
														 u[5] = 8'h72;//r
														 u[6] = 8'h74;//t
														 u[7] = 8'h6c;//l
														 u[8] = 8'h65;//e
														 u[9] = 8'h00;//" "
														 end
														  else if(userPkmnID == 5'b01001)
														 begin
														 u[0] = 8'h56;//V
														 u[1] = 8'h65;//e
														 u[2] = 8'h6e;//n
														 u[3] = 8'h61;//a
														 u[4] = 8'h73;//s
														 u[5] = 8'h61;//a
														 u[6] = 8'h75;//u
														 u[7] = 8'h72;//r
														 u[8] = 8'h00;//" "
														 u[9] = 8'h00;//" "
														 end 
														  else if(userPkmnID == 5'b01010)
														 begin
														 u[0] = 8'h43;//C
														 u[1] = 8'h68;//h
														 u[2] = 8'h61;//a
														 u[3] = 8'h72;//r
														 u[4] = 8'h69;//i
														 u[5] = 8'h7a;//z
														 u[6] = 8'h61;//a
														 u[7] = 8'h72;//r
														 u[8] = 8'h64;//d
														 u[9] = 8'h00;//" "
														 
														 end
														 else if(userPkmnID == 5'b01011)
														 begin
														 u[0] = 8'h42;//B
														 u[1] = 8'h6c;//l
														 u[2] = 8'h61;//a
														 u[3] = 8'h73;//s
														 u[4] = 8'h74;//t
														 u[5] = 8'h6f;//o
														 u[6] = 8'h69;//i
														 u[7] = 8'h73;//s
														 u[8] = 8'h65;//e
														 u[9] = 8'h00;//" "
														 end
														  
														 end
														 
														 
														 //Wild Pokemon Names
														 always_comb
														 begin
														 w[0] = 8'h00;//" "
														 w[1] = 8'h00;//" "
														 w[2] = 8'h00;//" "
														 w[3] = 8'h00;//" "
														 w[4] = 8'h00;//" "
														 w[5] = 8'h00;//" "
														 w[6] = 8'h00;//" "
														 w[7] = 8'h00;//" "
														 w[8] = 8'h00;//" "
														 w[9] = 8'h00;//" "
														 
														 if(wildPkmnID == 5'b01100)
														 begin
														 w[0] = 8'h50;//P
														 w[1] = 8'h69;//i
														 w[2] = 8'h6b;//k
														 w[3] = 8'h61;//a
														 w[4] = 8'h63;//c
														 w[5] = 8'h68;//h
														 w[6] = 8'h75;//u
														 w[7] = 8'h00;//" "
														 w[8] = 8'h00;//" "
														 w[9] = 8'h00;//" "
														 end
														 
														 	 else if(wildPkmnID == 5'b01101)
														 begin
														 w[0] = 8'h44;//D
														 w[1] = 8'h6f;//o
														 w[2] = 8'h64;//d
														 w[3] = 8'h75;//u
														 w[4] = 8'h6f;//o
														 w[5] = 8'h00;//" "
														 w[6] = 8'h00;//" "
														 w[7] = 8'h00;//" "
														 w[8] = 8'h00;//" "
														 w[9] = 8'h00;//" "
														 end
														 
														 	 else if(wildPkmnID == 5'b01110)
														 begin
														 w[0] = 8'h48;//H
														 w[1] = 8'h6f;//o
														 w[2] = 8'h75;//u
														 w[3] = 8'h6e;//n
														 w[4] = 8'h64;//d
														 w[5] = 8'h6f;//o
														 w[6] = 8'h75;//u
														 w[7] = 8'h72;//r
														 w[8] = 8'h00;//" "
														 w[9] = 8'h00;//" "
														 end
														 
														 	 else if(wildPkmnID == 5'b01111)
														 begin
														 w[0] = 8'h4d;//M
														 w[1] = 8'h75;//u
														 w[2] = 8'h72;//r
														 w[3] = 8'h6b;//k
														 w[4] = 8'h72;//r
														 w[5] = 8'h6f;//o
														 w[6] = 8'h77;//w
														 w[7] = 8'h00;//" "
														 w[8] = 8'h00;//" "
														 w[9] = 8'h00;//" "
														 end
														 
														 	 else if(wildPkmnID == 5'b10000)
														 begin
														 w[0] = 8'h4f;//O
														 w[1] = 8'h6e;//n
														 w[2] = 8'h79;//y
														 w[3] = 8'h78;//x
														 w[4] = 8'h00;//" "
														 w[5] = 8'h00;//" "
														 w[6] = 8'h00;//" "
														 w[7] = 8'h00;//" "
														 w[8] = 8'h00;//" "
														 w[9] = 8'h00;//" "
														 end
														 
														 	 else if(wildPkmnID == 5'b10001)
														 begin
														 w[0] = 8'h47;//G
														 w[1] = 8'h6f;//o
														 w[2] = 8'h6c;//l
														 w[3] = 8'h64;//d
														 w[4] = 8'h75;//u
														 w[5] = 8'h63;//c
														 w[6] = 8'h6b;//k
														 w[7] = 8'h00;//" "
														 w[8] = 8'h00;//" "
														 w[9] = 8'h00;//" "
														 end
														 
														 	 else if(wildPkmnID == 5'b10010)
														 begin
														 w[0] = 8'h50;//P
														 w[1] = 8'h69;//i
														 w[2] = 8'h64;//d
														 w[3] = 8'h67;//g
														 w[4] = 8'h65;//e
														 w[5] = 8'h6f;//o
														 w[6] = 8'h74;//t
														 w[7] = 8'h74;//t
														 w[8] = 8'h6f;//o
														 w[9] = 8'h00;//" "
														 end
														 
														 	 else if(wildPkmnID == 5'b10011)
														 begin
														 w[0] = 8'h53;//S
														 w[1] = 8'h63;//c
														 w[2] = 8'h65;//e
														 w[3] = 8'h70;//p
														 w[4] = 8'h74;//t
														 w[5] = 8'h69;//i
														 w[6] = 8'h6c;//l
														 w[7] = 8'h65;//e
														 w[8] = 8'h00;//" "
														 w[9] = 8'h00;//" "
														 end
														 
														 	 else if(wildPkmnID == 5'b10100)
														 begin
														 w[0] = 8'h4c;//L
														 w[1] = 8'h75;//u
														 w[2] = 8'h67;//g
														 w[3] = 8'h69;//i
														 w[4] = 8'h61;//a
														 w[5] = 8'h00;//" "
														 w[6] = 8'h00;//" "
														 w[7] = 8'h00;//" "
														 w[8] = 8'h00;//" "
														 w[9] = 8'h00;//" "
														 end
														 
														 	 else if(wildPkmnID == 5'b10101)
														 begin
														 w[0] = 8'h41;//A
														 w[1] = 8'h72;//r
														 w[2] = 8'h63;//c
														 w[3] = 8'h65;//e
														 w[4] = 8'h75;//u
														 w[5] = 8'h73;//s
														 w[6] = 8'h00;//" "
														 w[7] = 8'h00;//" "
														 w[8] = 8'h00;//" "
														 w[9] = 8'h00;//" "
														 end
														 
														 	 else if(wildPkmnID == 5'b10110)
														 begin
														 w[0] = 8'h41;//A
														 w[1] = 8'h72;//r
														 w[2] = 8'h74;//t
														 w[3] = 8'h69;//i
														 w[4] = 8'h63;//c
														 w[5] = 8'h75;//u
														 w[6] = 8'h6e;//n
														 w[7] = 8'h6f;//o
														 w[8] = 8'h00;//" "
														 w[9] = 8'h00;//" "
														 end
														 
														 	 else if(wildPkmnID == 5'b10111)
														 begin
														 w[0] = 8'h45;//E
														 w[1] = 8'h6e;//n
														 w[2] = 8'h74;//t
														 w[3] = 8'h65;//e
														 w[4] = 8'h69;//i
														 w[5] = 8'h00;//" "
														 w[6] = 8'h00;//" "
														 w[7] = 8'h00;//" "
														 w[8] = 8'h00;//" "
														 w[9] = 8'h00;//" "
														 end
														 
														 end
														 
														 
														 
														 
														 endmodule
														 
														 
														 
														 
														 