cc=g++
options= -O3

all: rewrite_S_phi_E.cpp components.h
	${cc} ${options} rewrite_S_phi_E.cpp -o rewrite_S_phi_E.x 


