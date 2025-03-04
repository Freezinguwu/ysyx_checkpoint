all:
	@echo "Write this Makefile by your self."

VERILATOR_FILE := $(shell find . -name *.v | sort | uniq)
CXX_SIMFILE := ./csrc/testbench.cpp

sim:
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
	touch sim.fst
	verilator $(VERILATOR_FILE) -exe -cc -j 0 -Wall $(CXX_SIMFILE)
	


include ../Makefile
