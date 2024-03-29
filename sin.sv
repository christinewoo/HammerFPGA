//module sin (input  [5:0]  idx,
//            output logic [6:0]  Out);
//	
//	always_comb
//	begin
//		unique case (idx)
//	 	   5'b00000   : Out = 7'b0000000;
//			5'b00001   : Out = 7'b0001000;
//			
//			5'b00010   : Out = 7'b0010000;
//			5'b00011   : Out = 7'b0010111;
//			
//			5'b00101   : Out = 7'b0011110;
//			5'b00110   : Out = 7'b0100101;
//			
//			5'b00111   : Out = 7'b0101100;
//			5'b01001   : Out = 7'b0110010;
//			
//			5'b01010   : Out = 7'b0111000;
//			5'b01011   : Out = 7'b0111100;
//			
//			5'b01100   : Out = 7'b1000000;
//	 	   5'b01101   : Out = 7'b1000011;	
//			
//			5'b01000   : Out = 7'b1000101;
//			
//	 	   default   : Out0 = 7'b0000000;
//	  	 endcase
//	end
//
//endmodule
//
//module cos (input  [5:0]  idx,
//            output logic [6:0]  Out);
//	
//	always_comb
//	begin
//		unique case (idx)
//	 	   5'b00000   : Y = 7'b1000110;
//			5'b00001   : Y = 7'b1000101;
//			
//			5'b00010   : Y = 7'b1000100;
//			5'b00011   : Y = 7'b1000010;
//			
//			5'b00101   : Y = 7'b0111111;
//			5'b00110   : Y = 7'b0111011;
//			
//			5'b00111   : Y = 7'b0110110;
//			5'b01001   : Y = 7'b0110001;
//			
//			5'b01010   : Y = 7'b0101010;
//			5'b01011   : Y = 7'b0100011;
//			
//			5'b01100   : Y = 7'b0011100;
//	 	   5'b01101   : Y = 7'b0010011;	
//			
//			5'b01000   : Y = 7'b0001010;
//			
//	 	   default   : Out0 = 7'b1000110;
//	  	 endcase
//	end
//
//endmodule

//5'b00000: 
//					begin
//						X = 7'b0000000;
//						Y = 7'b1000110;
//					end
//					
//					5'b00001:
//					begin
//						X = 7'b0001000;
//						Y = 7'b1000101;
//					end
//					
//					5'b00010:
//					begin
//						X = 7'b0010000;
//						Y = 7'b1000100;
//					end
//					
//					5'b00011:
//					begin
//						X = 7'b0010111;
//						Y = 7'b1000010;
//					end
//					
//					5'b00101:
//					begin
//						X = 7'b0011110;
//						Y = 7'b0111111;
//					end
//					
//					5'b00110:
//					begin
//						X = 7'b0100101;
//						Y = 7'b0111011;
//					end
//					
//					5'b00111:
//					begin
//						X = 7'b0101100;
//						Y = 7'b0110110;
//					end
//					
//					5'b01001:
//					begin
//						X = 7'b0110010;
//						Y = 7'b0110001;
//					end
//					
//					5'b01010:
//					begin
//						X = 7'b0111000;
//						Y = 7'b0101010;
//					end
//					
//					5'b01011:
//					begin
//						X = 7'b0111100;
//						Y = 7'b0100011;
//					end
//					
//					5'b01100:
//					begin
//						X = 7'b1000000;
//						Y = 7'b0011100;
//					end
//					
//					5'b01101:
//					begin
//						X = 7'b1000011;
//						Y = 7'b0010011;	
//					end
//					
//					5'b01000:
//					begin
//						X = 7'b1000101;
//						Y = 7'b0001010;
//					end
//					
//					default:
//					begin
//						X = 7'b0000000;
//						Y = 7'b1000110;
//					end
//				endcase