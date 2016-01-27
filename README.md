# J from g03

Calculating transfer integrals with Gaussian and the projective method.

This code ported over from the defunct Google Code.
https://code.google.com/archive/p/j-from-g03/

----
## Original documentation

Adapted from code by J.Kirkpatrick to deal with GAMESS-UK output; joejk2 12/09/07

----

1. Compile with make.  This puts 'rewrite_S_Phi_E.x' and 'get_J.m' in ~/bin

2. Run three gaussian jobs:

	1. single molecule 1 in the same orientation as when it is in the pair (e.g. xxx_1.com)
	
	2. single molecule 2 -"- (e.g. xxx_2.com)
	
	3. pair of molecules (e.g. xxx_pair.com)
	
	N.B.Typical input: 
	` # b3lyp nosymm punch=mo iop(3/33=1) `
		nosymm necessary to prevent reorientation of molecule to standard orientation.
		punch=mo puts orbital coefficients in fort.7.  This must be
		moved to xxx_x.pun 
		iop(3/33=1) forces output of the overlap matrix in the
		xxx_x.log file

3. Run 'rewrite_S_Phi_E.x' with the prefix to gaussian calculation (1), (2)
and (3) !! IN THIS ORDER !!.  This program expects to find 3 log files and 3 pun files.

4. You should now have 7 output .txt files:
	Evls_pair.txt  MOs_1.txt  MOs_2.txt  MOs_pair.txt  S_1.txt  S_2.txt
	S_pair.txt
	
5. Run 'octave ~/bin/get_J.m'.  You will be prompted for the number of MOs and
the HOMO of a monomer.  For very small molecules (with nBasis<3) you might
have to comment out some calculations attempted (on non-existant orbitals) in
get_J.m


Compare examples/ethylene_b3lyp with Figure 1 in JACS 2006 128 9882-9886
