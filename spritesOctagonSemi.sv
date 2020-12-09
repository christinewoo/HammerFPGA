//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 298 Lab 7                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  sprites ( input Reset, Run, frame_clk,
					input [7:0] keycode,
               output [9:0]  BallX, BallY, BallS );
    
    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size;
	 
	 logic [9:0] X, Y, idx;
	 
    parameter [9:0] Ball_X_Center=335;  // Center position on the X axis --320
    parameter [9:0] Ball_Y_Center=200;  // Center position on the Y axis --240
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=2;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=2;      // Step size on the Y axis
	 
	 parameter [9:0] centerX = 320;
 	 parameter [9:0] centerY = 240;
	 parameter [9:0] cStep = 15;			 // step to ad to data in degrees
	 parameter [9:0] r = 70;
	 

    assign Ball_Size = 8;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
	 
	 always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
				Ball_X_Motion <= 10'd0; //Ball_X_Step;
				Ball_Y_Pos <= Ball_Y_Center;
				Ball_X_Pos <= Ball_X_Center;
        end
           
        else 
        begin 
		
//
//				if ( Ball_Y_Pos <= 190 && Ball_X_Pos > 270 )  // Ball is at the top edge, BOUNCE!
//					  //Ball_Y_Motion <= Ball_Y_Step;
//						begin
//							Ball_X_Motion <= (~ (Ball_X_Step) + 1'b1);
//							Ball_Y_Motion <= 0;
//						end
//				
//				else if ( Ball_X_Pos <= 270 && Ball_Y_Pos < 290 )  // Ball is at the Left edge, BOUNCE!
//						begin	
//							Ball_Y_Motion <= Ball_Y_Step;
//							Ball_X_Motion <= 0;
//						end
//						
//				else if ( Ball_Y_Pos >= 290 && Ball_X_Pos < 370 )  // Ball is at the bottom edge, BOUNCE!
//						begin	
//							Ball_X_Motion <= Ball_X_Step;
//							Ball_Y_Motion <= 0;  // 2's complement.
//						end
//
//				else if ( Ball_X_Pos >= 370 && Ball_Y_Pos > 190 )  // Ball is at the Right edge, BOUNCE!
//						begin	
//							Ball_Y_Motion <= (~ (Ball_Y_Step) + 1'b1);
//							Ball_X_Motion <= 0;  // 2's complement.
//					   end
//				 
//				else 
//					  Ball_Y_Motion <= 0;
					  
					
				
						
				case (keycode)
					8'h04 : begin

								Ball_X_Motion <= -1;//A
								Ball_Y_Motion<= 0;
							  end
							  
					8'h07 : begin
								
							  Ball_X_Motion <= 1;//D
							  Ball_Y_Motion <= 0;
							  end

							  
					8'h16 : begin

							  Ball_Y_Motion <= 1;//S
							  Ball_X_Motion <= 0;
							 end
							  
					8'h1A : begin
							  Ball_Y_Motion <= -1;//W
							  Ball_X_Motion <= 0;
							 end	
						
					8'h2C : begin
							  
							   if ( Ball_Y_Pos <= 200 && Ball_X_Pos > 305 && Ball_X_Pos <= 335 )  		// Ball is at the top edge, LEFT!
									begin
										Ball_X_Motion <= (~ (Ball_X_Step) + 1'b1);
										Ball_Y_Motion <= 0;
									end
									
								//else if ( Ball_Y_Pos < 230 && Ball_Y_Pos >= 200 && Ball_X_Pos > 275 && Ball_X_Pos <= 305 )  		// Ball is at the top edge, 7!
								else if ( Ball_Y_Pos < 230 && Ball_X_Pos > 275 && Ball_X_Pos <= 305 )	
									begin
										Ball_X_Motion <= (~ (Ball_X_Step) + 1'b1);
										Ball_Y_Motion <= Ball_Y_Step;
									end	
							
								else if ( Ball_X_Pos <= 275 && Ball_Y_Pos < 260 && Ball_Y_Pos >= 230 )  // Ball is at the Left edge, DOWN!
									begin	
										Ball_Y_Motion <= Ball_Y_Step;
										Ball_X_Motion <= 0;
									end
									
							   else if ( Ball_Y_Pos < 290 && Ball_Y_Pos >= 260  && Ball_X_Pos < 305 )  		// Ball is at the top edge, 4!
									begin
										Ball_Y_Motion <= Ball_Y_Step;
										Ball_X_Motion <= Ball_X_Step;
									end
									
								else if ( Ball_Y_Pos >= 290 && Ball_X_Pos >= 305 && Ball_X_Pos < 335 )  // Ball is at the bottom edge, RIGHT!
									begin	
										Ball_X_Motion <= Ball_X_Step;
										Ball_Y_Motion <= 0;  // 2's complement.
									end
									
								//else if ( Ball_Y_Pos <= 290 && Ball_Y_Pos > 260 && Ball_X_Pos >= 335 && Ball_X_Pos < 365 )  		// Ball is at the top edge, 2!
								else if ( Ball_Y_Pos > 260 && Ball_X_Pos >= 335 && Ball_X_Pos < 365 )
									begin
										Ball_X_Motion <= Ball_X_Step;
										Ball_Y_Motion <= (~ (Ball_Y_Step) + 1'b1);
									end

								else if ( Ball_X_Pos >= 365 && Ball_Y_Pos <= 260 && Ball_Y_Pos > 230 )  // Ball is at the Right edge, UP!
									begin	
										Ball_Y_Motion <= (~ (Ball_Y_Step) + 1'b1);
										Ball_X_Motion <= 0;  // 2's complement.
									end
									
								//else if ( Ball_Y_Pos <= 230 && Ball_Y_Pos > 200 && Ball_X_Pos <= 365 && Ball_X_Pos > 335 )  		// Ball is at the top edge, 11!
								else if ( Ball_Y_Pos <= 230 && Ball_Y_Pos > 200 && Ball_X_Pos > 335 )
									begin
										Ball_Y_Motion <= (~ (Ball_Y_Step) + 1'b1);
										Ball_X_Motion <= (~ (Ball_X_Step) + 1'b1);
									end
							  
								end
								
					default: ;
				endcase
				 
				Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
				Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);
				
				if (( (Ball_Y_Pos + Ball_Size) >= Ball_Y_Max ) || ( (Ball_Y_Pos - Ball_Size) <= Ball_Y_Min ) ||( (Ball_X_Pos + Ball_Size) >= Ball_X_Max ) || ( (Ball_X_Pos - Ball_Size) <= Ball_X_Min ) )
					begin
						Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
						Ball_X_Motion <= 10'd0; //Ball_X_Step;
						Ball_Y_Pos <= Ball_Y_Center;
						Ball_X_Pos <= Ball_X_Center;
					end
			
			end  
    end
       
    
	 assign BallX = Ball_X_Pos;
   
    assign BallY = Ball_Y_Pos;
   
    assign BallS = Ball_Size;
    

endmodule
   
//    always_ff @ (posedge Reset or posedge frame_clk )
//    begin: Move_Ball
//			//if (Reset)  // Asynchronous Reset
////			begin 
////            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
////				Ball_X_Motion <= 10'd0; //Ball_X_Step;
////				Ball_Y_Pos <= Ball_Y_Center;
////				Ball_X_Pos <= Ball_X_Center;
////				idx <= 0;
////			end
//           
//			if (Reset) 
//			begin 
//				unique case (idx)
//					
//					5'b00000: 
//					begin
//						X = 70;
//						Y = 0;
//					end
//					
//					5'b00001:
//					begin
//						X = 69;
//						Y = -8;
//					end
//					
//					5'b00010:
//					begin
//						X = 68;
//						Y = -16;
//					end
//					
//					5'b00011:
//					begin
//						X = 66;
//						Y = -23;
//					end
//					
//					5'b00101:
//					begin
//						X = 63;
//						Y = -30;
//					end
//					
//					5'b00110:
//					begin
//						X = 59;
//						Y = -37;
//					end
//					
//					5'b00111:
//					begin
//						X = 54;
//						Y = -44;
//					end
//					
//					5'b01001:
//					begin
//						X = 49;
//						Y = -50;
//					end
//					
//					5'b01010:
//					begin
//						X = 42;
//						Y = -56;
//					end
//					
//					5'b01011:
//					begin
//						X = 35;
//						Y = -60;
//					end
//					
//					5'b01100:
//					begin
//						X = 28;
//						Y = -64;
//					end
//					
//					5'b01101:
//					begin
//						X = 19;
//						Y = -67;	
//					end
//					
//					5'b01000:
//					begin
//						X = 10;
//						Y = -69;
//					end
//					
//					5'b01001:
//					begin
//						X = 0;
//						Y = -70;
//					end
//					
//					default:
//					begin
//						X = 0;
//						Y = 0;
//					end
//				endcase
//				
//				
//				Ball_X_Pos <= (centerX + X);  // Update ball position
//				Ball_Y_Pos <= (centerY + Y);
//				
//				if (idx > 13)
//					begin
//						idx <= 0;
//					end
//				else
//					begin
//						idx <= idx + 1;
//					end
//			
//			end  
//    end
//	 
//       
//    assign BallX = Ball_X_Pos;
//   
//    assign BallY = Ball_Y_Pos;
//   
//    assign BallS = Ball_Size;
//    
//
//endmodule
