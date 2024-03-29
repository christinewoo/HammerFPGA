//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
                       output logic [7:0]  Red, Green, Blue );
    
    logic [1:0] ball_on;
	 
 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*Ball_Size, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 12 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	  
    int DistX, DistY, Size;
	 assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
    assign Size = Ball_size;
	  
    always_comb
    begin:Ball_on_proc
			if ((DistX <= 2 * Ball_size) && (DistY <= 2 * Ball_size)) 
            ball_on = 2'b01;
			else if (( DrawX*DrawX + DrawY*DrawY) <= (Size * Size))
				ball_on = 2'b10;
         else 
            ball_on = 2'b00;
     end 
       
    always_comb
    begin:RGB_Display
        if ((ball_on == 2'b01)) 
        begin 
            Red = 8'hfa;
            Green = 8'h61;
            Blue = 8'he8;
        end 
		  else if ((ball_on == 2'b10)) 
        begin 
            Red = 8'h33;
            Green = 8'h55;
            Blue = 8'hff;
        end 
        else 
        begin 
            Red = 8'h00; 
            Green = 8'hbf- DrawX[6:3];
            Blue = 8'h7f - DrawY[6:3];
        end      
    end 
	 
//	     always_comb
//    begin:Ball_on_proc
//			if ((DistX <= 2 * Ball_size) && (DistY <= 2 * Ball_size)) 
//            ball_on = 2'b01;
//			else if (( PersonX*PersonX + PersonY*PersonY) <= (16 * 16))
//				ball_on = 2'b10;
//         else 
//            ball_on = 2'b00;
//     end 
//       
//    always_comb
//    begin:RGB_Display
//        if ((ball_on == 2'b01)) 
//        begin 
//            Red = 8'hfa;
//            Green = 8'h61;
//            Blue = 8'he8;
//        end 
//		  else if ((ball_on == 2'b10)) 
//        begin 
//            Red = 8'h33;
//            Green = 8'h55;
//            Blue = 8'h88;
//        end 
//        else 
//        begin 
//            Red = 8'h00; 
//            Green = 8'hbf- DrawX[6:3];
//            Blue = 8'h7f - DrawY[6:3];
//        end      
//    end 
	 
//	 always_comb
//    begin:Ball_on_proc
//        if ( ( DistX*DistX + DistY*DistY) <= (Size * Size) ) 
//            ball_on = 1'b1;
//        else 
//            ball_on = 1'b0;
//     end 
//       
//    always_comb
//    begin:RGB_Display
//        if ((ball_on == 1'b1)) 
//        begin 
//            Red = 8'hff;
//            Green = 8'h55;
//            Blue = 8'h00;
//        end       
//        else 
//        begin 
//            Red = 8'h00; 
//            Green = 8'h00;
//            Blue = 8'h7f - DrawX[9:3];
//        end      
//    end 
endmodule
