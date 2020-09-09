//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Po-Han Huang  10-06-2017                               --
//                                                                       --
//    Fall 2017 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 8                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------

// color_mapper: Decide which color to be output to VGA for each pixel.
module  color_mapper ( input        [31:0] testpX,
							  input        [31:0] testpY,
							  input        [31:0] testpX2,
							  input        [31:0] testpY2,
							  input			[7:0] p1ab,
							  input			[7:0] p2ab,
							  input			[7:0] scene,
							  input			[31:0] f1,
							  input			[31:0] f2,
							  input			[31:0] tick,
                                                              //   or background (computed in ball.sv)
                       input        [9:0] DrawX, DrawY,       // Current pixel coordinates
                       output logic [7:0] VGA_R, VGA_G, VGA_B // VGA RGB output
                     );
    
    logic [7:0] Red, Green, Blue;
	 logic [7:0] Redp, Greenp, Bluep;
	 logic [7:0] Redp2, Greenp2, Bluep2;
	 
	 logic [9:0] nX;
	 logic [9:0] nY;
	 logic [7:0] num;
	 logic [7:0] scale;
	 logic [1:0] BW;
	 
	 logic [9:0] testX = 0;
	 logic [9:0] testY = 0;
	 logic [7:0] blockid = 0;
	 
	 logic isp1 = 0;
	 logic isp2 = 0;
	 logic [9:0] p1X = 0;
	 logic [9:0] p1Y = 0;
	 logic [9:0] p2X = 0;
	 logic [9:0] p2Y = 0;
	 
	 logic [2:0] testid1 = 3'b111;
	 logic [2:0] testid2 = 3'b111;
	 logic [2:0] testid = 3'b111;
	 logic [2:0] cidxp1 = 3'b111;
	 logic [2:0] cidxp2 = 3'b111;
	 
	 logic [9:0] aX;
	 logic [9:0] aY;
	 logic [1:0] aidx;
	 logic [1:0] BWY;
	 logic back;
	 
	 logic [1:0] SD;
	 logic isDoor;
	 
	 logic [7:0] first;
	 logic [7:0] second;
	 logic [7:0] third;
	 
	 assign third = tick % 10;
	 assign second = ((tick - tick%10)%100)/10;
	 assign first = ((tick - tick%100)%1000)/100;
    // Output colors to VGA

	 logic BLOCK [224:0] = '{0,0,0,0,1,1,1,1,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,1,0,1,1,0,1,1,0,0,1,1,1,0,1,0,0,0,1,1,0,0,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,1,1,0,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,0,1,0,1,1,0,0,1,0,0,0,0,0,0,1,0,1,0,0,1,0,0,1,0,1,1,1,1,0,1,0,1,0,1,1,1,1,1,0,0,0,1,0,0,1,0,1,0,0,1,0,0,0,0,1,0,1,0,1,1,0,1,1,0,1,0,1,1,1,1,0,1,0,0,1,0,1,1,0,0,0,0,0,0,0,0,1,0,0,1,0,1,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,1,1,0,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0};
	 
	 always_comb
		begin
			p1X = DrawX - testpX;
			p1Y = DrawY - testpY;
			p2X = DrawX - testpX2;
			p2Y = DrawY - testpY2;
			if(scene == 0)
				begin
					SD = 0;
					isDoor = 0;
					testX = (DrawX) % 30;
					testY = (DrawY) % 30;
					blockid = 0;
					testid = testid1;
					nX = 0;
					nY = 0;
					num = 0;
					scale = 0;
//					VGA_R = 0;
//					VGA_G = 0;
//					VGA_B = 100;
					if (DrawX >= 200 && DrawX < 300 && DrawY >= 110 && DrawY < 210)
						begin
							aX = DrawX - 200;
							aY = DrawY - 110;
							aidx = 0;
							back = 0;
						end
					else if (DrawX >= 350 && DrawX < 450 && DrawY >= 110 && DrawY < 210)
						begin
							aX = DrawX - 350;
							aY = DrawY - 110;
							aidx = 1;
							back = 0;
						end
					else if (DrawX >= 200 && DrawX < 300 && DrawY >= 260 && DrawY < 360)
						begin
							aX = DrawX - 200;
							aY = DrawY - 260;
							aidx = 2;
							back = 0;
						end
					else if (DrawX >= 350 && DrawX < 450 && DrawY >= 260 && DrawY < 360)
						begin
							aX = DrawX - 350;
							aY = DrawY - 260;
							aidx = 3;
							back = 0;
						end
					else
						begin
							aX = 0;
							aY = 0;
							aidx = 0;
							back = 1;
						end
					if (BWY == 0 && back == 0)
						begin
							VGA_R = 0;
							VGA_G = 0;
							VGA_B = 0;
						end
					else if (BWY == 1 && back == 0)
						begin
							VGA_R = 255;
							VGA_G = 255;
							VGA_B = 255;
						end
					else if (BWY == 2 && back == 0)
						begin
							VGA_R = 255;
							VGA_G = 242;
							VGA_B = 0;
						end
					else
						begin
							VGA_R = Red;
							VGA_G = Green;
							VGA_B = Blue;
						end
				end
			else if(scene == 2)
				begin
					SD = 0;
					isDoor = 0;
					aX = 0;
					aY = 0;
					aidx = 0;
					back = 0;
					testX = 0;
					testY = 0;
					blockid = 0;
					testid = 3'b111;
					VGA_R = 0;
					VGA_G = 100;
					VGA_B = 0;
					nX = 0;
					nY = 0;
					num = 0;
					scale = 0;
				end
				
			else
				begin
					aX = 0;
					aY = 0;
					aidx = 0;
					back = 0;
					if (isp1 == 1 || isp2 == 1)
						begin
							SD = 0;
							isDoor = 0;
							testX = 0;
							testY = 0;
							blockid = 0;
							testid = 3'b111;
							nX = 0;
							nY = 0;
							num = 0;
							scale = 0;
							if (isp1 == 1)
								begin
									VGA_R = Redp;
									VGA_G = Greenp;
									VGA_B = Bluep;
								end
							else
								begin
									VGA_R = Redp2;
									VGA_G = Greenp2;
									VGA_B = Bluep2;
								end
						end
					else
						begin
							if ((DrawX >= 0)&&(DrawX < 60)&&(DrawY >= 0)&&(DrawY < 60))
								begin
									testX = (DrawX - 100) % 30;
									testY = (DrawY - 20) % 30;
									blockid = ((DrawY - 20) / 30)*15 + (DrawX - 100) / 30;
									testid = 0;
									SD = 0;
									isDoor = 0;
									nX = DrawX - 0;
									nY = DrawY - 0;
									num = first;
									scale = 1;
									if (BW == 0)
										begin
											VGA_R = 255;
											VGA_G = 255;
											VGA_B = 255;
										end
									else
										begin
											VGA_R = 0;
											VGA_G = 0;
											VGA_B = 0;
										end
								end
							else if ((DrawX >= 0)&&(DrawX < 60)&&(DrawY >= 60)&&(DrawY < 120))
								begin
									testX = (DrawX - 100) % 30;
									testY = (DrawY - 20) % 30;
									blockid = ((DrawY - 20) / 30)*15 + (DrawX - 100) / 30;
									testid = 0;
									SD = 0;
									isDoor = 0;
									nX = DrawX - 0;
									nY = DrawY - 60;
									num = second;
									scale = 1;
									if (BW == 0)
										begin
											VGA_R = 255;
											VGA_G = 255;
											VGA_B = 255;
										end
									else
										begin
											VGA_R = 0;
											VGA_G = 0;
											VGA_B = 0;
										end
								end
							else if ((DrawX >= 0)&&(DrawX < 60)&&(DrawY >= 120)&&(DrawY < 180))
								begin
									testX = (DrawX - 100) % 30;
									testY = (DrawY - 20) % 30;
									blockid = ((DrawY - 20) / 30)*15 + (DrawX - 100) / 30;
									testid = 0;
									SD = 0;
									isDoor = 0;
									nX = DrawX - 0;
									nY = DrawY - 120;
									num = third;
									scale = 1;
									if (BW == 0)
										begin
											VGA_R = 0;
											VGA_G = 0;
											VGA_B = 0;
										end
									else
										begin
											VGA_R = 255;
											VGA_G = 255;
											VGA_B = 255;
										end
								end
							else if ((DrawX >= 100)&&(DrawX < 550)&&(DrawY >= 20)&&(DrawY < 470))
								begin
									VGA_R = Red;
									VGA_G = Green;
									VGA_B = Blue;
									nX = 0;
									nY = 0;
									num = 0;
									scale = 0;
									testX = (DrawX - 100) % 30;
									testY = (DrawY - 20) % 30;
									blockid = ((DrawY - 20) / 30)*15 + (DrawX - 100) / 30;
									if (BLOCK[224 - blockid] == 0)
										begin
											isDoor = 0;
											if (blockid == 48 || blockid == 175)
												begin
													SD = 1;
												end
											else if (blockid == 210)
												begin
													SD = 2;
												end
											else if (blockid == 14)
												begin
													SD = 3;
												end
											else
												begin
													SD = 0;
												end
											testid = testid2;
										end
									else
										begin
											SD = 0;
											if(blockid == 30 || blockid == 132)
												begin
													isDoor = 1;
												end
											else
												begin
													isDoor = 0;
												end
											testid = testid1;
										end
								end
							else
								begin
									VGA_R = Red;
									VGA_G = Green;
									VGA_B = Blue;
									SD = 0;
									isDoor = 0;
									testX = 0;
									testY = 0;
									blockid = 0;
									testid = 3'b011;
									nX = 0;
									nY = 0;
									num = 0;
									scale = 0;
								end
						end
				end
		end

	 wall wall1 (.wallX(testX), .wallY(testY), .p1ab(p1ab), .isDoor(isDoor), .cidx(testid1));
	 road road1 (.roadX(testX), .roadY(testY), .p1ab(p1ab), .p2ab(p2ab), .SD(SD), .cidx(testid2));
	 
	 
	 
	 
	 pallete pallete (.cidx(testid), .Red(Red), .Green(Green), .Blue(Blue));
	 pallete2 pallete2 (.cidx(cidxp1), .Red(Redp), .Green(Greenp), .Blue(Bluep));
	 pallete3 pallete3 (.cidx(cidxp2), .Red(Redp2), .Green(Greenp2), .Blue(Bluep2));
	 
	 isplayer isp(.*, .pX(testpX), .pY(testpY), .pX2(testpX2), .pY2(testpY2));
	 
	 player1 player11(.pX(p1X), .pY(p1Y), .cidx(cidxp1), .f1(f1));
	 player2 player22(.pX(p2X), .pY(p2Y), .cidx(cidxp2), .f2(f2));
	 
	 ability ability1(.aX(aX), .aY(aY), .aidx(aidx), .p1ab(p1ab), .p2ab(p2ab), .BWY(BWY));
	 
	 number number1(.nX(nX), .nY(nY), .num(num), .scale(scale), .BW(BW));
    // Assign color based on is_ball signal
//    always_comb
//    begin
//        if (is_ball == 1'b1) 
//        begin
//            // White ball
//            Red = 8'hff;
//            Green = 8'hff;
//            Blue = 8'hff;
//        end
//        else 
//        begin
//            // Background with nice color gradient
//            Red = 8'h3f; 
//            Green = 8'h00;
//            Blue = 8'h7f - {1'b0, DrawX[9:3]};
//        end
//    end 
    
endmodule
