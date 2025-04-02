`timescale 1ns/1ps

module circuit_tb;
    // Parameters
    parameter INPUT_WIDTH = 32;
    parameter OUTPUT_WIDTH = 5;
    
    // Testbench signals
    reg [INPUT_WIDTH-1:0] inputs;
    wire [OUTPUT_WIDTH-1:0] outputs;
    
    // Clock and reset signals
    reg clk;
    reg rst_n;
    
    // Instantiate the Device Under Test (DUT)
    // Replace "circuit" with your actual module name
    // and ensure port names match your design
    circuit #(
        .INPUT_WIDTH(INPUT_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .inputs(inputs),
        .outputs(outputs)
    );
    
    // Clock generation
    always begin
        #5 clk = ~clk;
    end
    
    // Test vector variables
    integer i;
    integer error_count;
    reg [OUTPUT_WIDTH-1:0] expected_output;
    
    // Initial block for test procedure
    initial begin
        // Initialize the simulation
        $dumpfile("circuit_tb.vcd");
        $dumpvars(0, circuit_tb);
        
        // Initialize signals
        clk = 0;
        rst_n = 0;
        inputs = 0;
        error_count = 0;
        
        // Apply reset for a few clock cycles
        #20;
        rst_n = 1;
        #10;
        
        // Test case 1: All zeros
        inputs = 32'h00000000;
        expected_output = calculate_expected(inputs);
        #10;
        check_output(expected_output);
        
        // Test case 2: All ones
        inputs = 32'hFFFFFFFF;
        expected_output = calculate_expected(inputs);
        #10;
        check_output(expected_output);
        
        // Test case 3: Alternating pattern
        inputs = 32'hAAAAAAAA;
        expected_output = calculate_expected(inputs);
        #10;
        check_output(expected_output);
        
        // Test case 4: Another alternating pattern
        inputs = 32'h55555555;
        expected_output = calculate_expected(inputs);
        #10;
        check_output(expected_output);
        
        // Test case 5: Walking ones
        for (i = 0; i < INPUT_WIDTH; i = i + 1) begin
            inputs = (1 << i);
            expected_output = calculate_expected(inputs);
            #10;
            check_output(expected_output);
        end
        
        // Test case 6: Random values
        repeat (20) begin
            // Generate random input
            inputs = $random;
            expected_output = calculate_expected(inputs);
            #10;
            check_output(expected_output);
        end
        
        // Report results
        if (error_count == 0) begin
            $display("TESTBENCH PASSED! All test cases verified successfully.");
        end else begin
            $display("TESTBENCH FAILED with %d errors.", error_count);
        end
        
        // End simulation
        #100;
        $finish;
    end
    
    // Task to check output against expected value
    task check_output;
        input [OUTPUT_WIDTH-1:0] expected;
        begin
            if (outputs !== expected) begin
                $display("ERROR at time %t: Inputs = 0x%h, Expected Output = 0x%h, Actual Output = 0x%h",
                         $time, inputs, expected, outputs);
                error_count = error_count + 1;
            end else begin
                $display("PASS at time %t: Inputs = 0x%h, Output = 0x%h", $time, inputs, outputs);
            end
        end
    endtask
    
    // Function to calculate expected output based on inputs
    // Replace this with the actual logic of your circuit
    function [OUTPUT_WIDTH-1:0] calculate_expected;
        input [INPUT_WIDTH-1:0] inputs;
        begin
            calculate_expected = 0
			for(integer j = INPUT_WIDTH-1; j >= 0; j = j - 1) begin
				if(inputs[j]) begin
					calculate_expected = 1 << j;
					break
				end
			end
			calculate_expected = calculated_expected & ((1 << OUTPUT_WIDTH) - 1);
			// Replace this with your actual logic
            // This is just a placeholder example (count number of 1s, limited to 5 bits)
            //calculate_expected = 0;
            //for (integer j = 0; j < INPUT_WIDTH; j = j + 1) begin
            //    if (inputs[j])
            //        calculate_expected = calculate_expected + 1;
            //end
            //calculate_expected = calculate_expected & ((1 << OUTPUT_WIDTH) - 1);
        end
    endfunction
    
endmodule