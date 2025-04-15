// Testbench for log2 module
`timescale 1ns/1ps

module log2_tb;
    // Inputs
    reg [31:0] A;
    
    // Outputs
    wire [4:0] log2_result;
    
    // Instantiate the Unit Under Test (UUT)
    log2 uut (
        .A(A),
        .log2(log2_result)
    );
    
    // Expected result calculation function
    function [4:0] expected_log2;
        input [31:0] value;
        integer i;
        begin
            expected_log2 = 0;
            for (i = 31; i >= 0; i = i - 1) begin
                if (value[i] == 1) begin
                    expected_log2 = i;
                    i = -1; // Break the loop
                end
            end
        end
    endfunction
    
    // Variables for test reporting
    integer num_tests = 0;
    integer num_passed = 0;
    
    initial begin
        // Initialize Inputs
        A = 0;
	
        // Wait for global reset
        #100;
        
        // Monitor the output
        $display("Starting log2 module test");
        $display("-------------------------");
        $display("A (decimal) | A (hex)     | Expected log2 | Actual log2 | Status");
        $display("-------------------------");
        
        // Test case 1: A = 0 (log2(0) is undefined, but our circuit should output 0)
        A = 0;
        #10;
        check_result(A);
        
        // Test case 2: A = 1 (log2(1) = 0)
        A = 1;
        #10;
        check_result(A);
        
        // Test case 3: A = 2 (log2(2) = 1)
        A = 2;
        #10;
        check_result(A);
        
        // Test case 4: A = 3 (log2(3) = 1)
        A = 3;
        #10;
        check_result(A);
        
        // Test case 5: A = 4 (log2(4) = 2)
        A = 4;
        #10;
        check_result(A);
        
        // Test case 6: A = 7 (log2(7) = 2)
        A = 7;
        #10;
        check_result(A);
        
        // Test case 7: A = 8 (log2(8) = 3)
        A = 8;
        #10;
        check_result(A);
        
        // Test case 8: A = 15 (log2(15) = 3)
        A = 15;
        #10;
        check_result(A);
        
        // Test case 9: A = 16 (log2(16) = 4)
        A = 16;
        #10;
        check_result(A);
        
        // Test case 10: A = 31 (log2(31) = 4)
        A = 31;
        #10;
        check_result(A);
        
        // Test case 11: A = 32 (log2(32) = 5)
        A = 32;
        #10;
        check_result(A);
        
        // Test case 12: A = 65535 (log2(65535) = 15)
        A = 65535;
        #10;
        check_result(A);
        
        // Test case 13: A = 65536 (log2(65536) = 16)
        A = 65536;
        #10;
        check_result(A);
        
        // Test case 14: A = 2^31 - 1 (log2(2^31-1) = 30)
        A = 2147483647;
        #10;
        check_result(A);
        
        // Test case 15: A = 2^31 (log2(2^31) = 31)
        A = 32'h80000000;
        #10;
        check_result(A);
        
        // Test case 16: A = 2^32 - 1 (log2(2^32-1) = 31)
        A = 32'hFFFFFFFF;
        #10;
        check_result(A);
        
        // Generate some random test cases
        repeat (10) begin
            A = $urandom;
            #10;
            check_result(A);
        end
        
        // Summary
        $display("-------------------------");
        $display("Test summary: %0d tests, %0d passed, %0d failed", 
                 num_tests, num_passed, num_tests - num_passed);
        $display("-------------------------");
        
        // End simulation
        $finish;
    end
    
    // Task to check and display results
    task check_result;
        input [31:0] value;
        begin
            num_tests = num_tests + 1;
            
            if (log2_result === expected_log2(value)) begin
                $display("%0d | 0x%h | %0d | %0d | PASS", 
                         value, value, expected_log2(value), log2_result);
                num_passed = num_passed + 1;
            end else begin
                $display("%0d | 0x%h | %0d | %0d | FAIL", 
                         value, value, expected_log2(value), log2_result);
            end
        end
    endtask
    
endmodule