///////////////////////////////////////////////////////////////////////////////////
// Tasks: verifyEqual (1-, 2-, 5-, 32-bit versions)
// Package: FIUSCIS-CDA
// Course: CDA3102 (Computer Architecture), Florida International University
// Developer: Trevor Cickovski
// License: MIT, (C) 2022 All Rights Reserved
///////////////////////////////////////////////////////////////////////////////////

module Test;

task verifyEqual;
   input [0:0] actual;
   input [0:0] expected;

   begin
      if (actual !== expected)      
      begin 
         $display("[FAIL] Received %b, expected %b", actual, expected);
         $stop;
      end
      else
      begin
         $display("[PASS]");
      end
   end
endtask

task verifyEqual64;
   input [63:0] actual;
   input [63:0] expected;

   begin
      if (actual !== expected)      
      begin 
         $display("[FAIL] Received %b, expected %b", actual, expected);
         $stop;
      end
      else
      begin
         $display("[PASS]");
      end
   end
endtask


task verifyEqual2;
   input [1:0] actual;
   input [1:0] expected;

   begin
      if (actual !== expected)      
      begin 
         $display("[FAIL] Received %b, expected %b", actual, expected);
         $stop;
      end
      else
      begin
         $display("[PASS]");
      end
   end
endtask

task verifyEqual5;
   input [4:0] actual;
   input [4:0] expected;

   begin
      if (actual !== expected)      
      begin 
         $display("[FAIL] Received %b, expected %b", actual, expected);
         $stop;
      end
      else
      begin
         $display("[PASS]");
      end
   end
endtask

task verifyEqual32;
   input [31:0] actual;
   input [31:0] expected;

   begin
      if (actual !== expected)      
      begin 
         $display("[FAIL] Received %b, expected %b", actual, expected);
         $stop;
      end
      else
      begin
         $display("[PASS]");
      end
   end
endtask

task verifyLessEqual32;
   input [31:0] first;
   input [31:0] second;

   begin
      if (((first > second) === 1) || ((first > second) === 'x))   /* Has to be not greater and not undefined */  
      begin 
         $display("[FAIL] first=%d, second=%d, result=%b", first, second, (first > second));
         $stop;
      end
      else
      begin
         $display("[PASS] first=%d, second=%d, result=%b", first, second, (first > second));
      end
   end
endtask

endmodule