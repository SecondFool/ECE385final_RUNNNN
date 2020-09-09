module pallete (input [2:0] cidx,
					output logic [7:0] Red, Green, Blue);
	always_comb
		begin	
			case(cidx)
				3'b000:
					begin
						Red = 8'h77;
						Green = 8'h44;
						Blue = 8'h22;
					end
				3'b001:
					begin
						Red = 8'h99;
						Green = 8'h66;
						Blue = 8'h44;
					end
				3'b010:
					begin
						Red = 8'hbb;
						Green = 8'h88;
						Blue = 8'h66;
					end
				3'b011:
					begin
						Red = 8'h00;
						Green = 8'h00;
						Blue = 8'h00;
					end
				3'b100:
					begin
						Red = 8'h44;
						Green = 8'h44;
						Blue = 8'h44;
					end
				3'b101:
					begin
						Red = 8'h4a;
						Green = 8'h4a;
						Blue = 8'h4a;
					end
				3'b110:
					begin
						Red = 8'h66;
						Green = 8'h66;
						Blue = 8'h66;
					end
				default:
					begin
						Red = 8'hff;
						Green = 8'hff;
						Blue = 8'hff;
					end
			endcase
		end
					
					
endmodule			

module pallete2 (input [2:0] cidx,
					output logic [7:0] Red, Green, Blue);
	always_comb
		begin	
			case(cidx)
				3'b000:
					begin
						Red = 98;
						Green = 101;
						Blue = 86;
					end
				3'b001:
					begin
						Red = 99;
						Green = 66;
						Blue = 44;
					end
				3'b010:
					begin
						Red = 159;
						Green = 192;
						Blue = 98;
					end
				3'b011:
					begin
						Red = 233;
						Green = 237;
						Blue = 224;
					end
				3'b100:
					begin
						Red = 224;
						Green = 89;
						Blue = 89;
					end
				3'b101:
					begin
						Red = 131;
						Green = 60;
						Blue = 11;
					end
				3'b110:
					begin
						Red = 237;
						Green = 171;
						Blue = 126;
					end
				default:
					begin
						Red = 8'h00;
						Green = 8'h00;
						Blue = 8'h00;
					end
			endcase
		end
					
					
endmodule			
				
module pallete3 (input [2:0] cidx,
					output logic [7:0] Red, Green, Blue);
	always_comb
		begin	
			case(cidx)
				3'b000:
					begin
						Red = 88;
						Green = 83;
						Blue = 87;
					end
				3'b001:
					begin
						Red = 114;
						Green = 85;
						Blue = 66;
					end
				3'b010:
					begin
						Red = 168;
						Green = 171;
						Blue = 215;
					end
				3'b011:
					begin
						Red = 218;
						Green = 144;
						Blue = 141;
					end
				3'b110:
					begin
						Red = 86;
						Green = 65;
						Blue = 67;
					end
				3'b101:
					begin
						Red = 251;
						Green = 221;
						Blue = 196;
					end
				3'b100:
					begin
						Red = 190;
						Green = 178;
						Blue = 166;
					end
				default:
					begin
						Red = 212;
						Green = 209;
						Blue = 255;
					end
			endcase
		end
					
					
endmodule
	