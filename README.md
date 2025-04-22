# Steps to ensure smooth evaluation of testbenches

In the event that you run into issues trying to execute the testbenches, I have provided a list of instructions assuming you are working in some directory `/DIR` and that the file `clone_with_dependencies.sh` is inside this folder, for your own reference.

1. Open a terminal.
2. Execute `cd /DIR`.
3. Execute `./clone_with_dependencies.sh ALU_32`.
4. Execute `git clone https://github.com/gpena1/log2.git`.
5. Open `/DIR/log2/ALU_32.mpf` in ModelSim.
6. Verify that the two testbench files located at `/DIR/log2/testbench.v` and `/DIR/log2/log2/log2_testbench.v` exist. The former is to test the log2-assimilated ALU_32 unit, while the latter tests the log2 unit by itself.
7. Compile all.
8. Run the simulations for these testbenches (note that `testbench.v` will show up under `work` as `testbench`, while `log2_testbench.v` will show up under `work` as `log2_tb`).