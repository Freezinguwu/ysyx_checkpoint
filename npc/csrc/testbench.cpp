#include "verilated_fst_c.h"
#include "verilated.h"
#include "VALU.h"
int main(int argc, char** argv) {

    
  Verilated::traceEverOn(true);
  VerilatedFstC* tfp = new VerilatedFstC;
  topp->trace(tfp, 99);  
  tfp->open("obj_dir/t_trace_ena_cc/simx.vcd");
  ...
  while (contextp->time() < sim_time && !contextp->gotFinish()) {
      contextp->timeInc(1);
      topp->eval();
      tfp->dump(contextp->time());
  }
  tfp->close();
}

