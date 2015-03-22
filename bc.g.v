
//clad 4 module 
module cla4(a,b,cin,s,cout); 
input[3:0] a,b; 
input cin; 
output cout; 
output[3:0] s; 
wire[3:0] g,p; 
wire[13:0] z; 
XOR2X1 x1 (.a1(a[0]),.a2(b[0]),.z(p[0])); 
AND2X1 x2 (.a1(a[0]),.a2(b[0]),.z(g[0])); 
XOR2X1 x3 (.a1(a[1]),.a2(b[1]),.z(p[1])); 
AND2X1 x4 (.a1(a[1]),.a2(b[1]),.z(g[1])); 
XOR2X1 x5 (.a1(a[2]),.a2(b[2]),.z(p[2])); 
AND2X1 x6 (.a1(a[2]),.a2(b[2]),.z(g[2])); 
XOR2X1 x7 (.a1(a[3]),.a2(b[3]),.z(p[3])); 
AND2X1 x8 (.a1(a[3]),.a2(b[3]),.z(g[3])); 
XOR2X1 x9 (.a1(cin),.a2(p[0]),.z(s[0])); 
AND2X1 x10 (.a1(cin),.a2(p[0]),.z(z[0])); 
OR2X1 x11 (.a1(z[0]),.a2(g[0]),.z(z[1])); 
XOR2X1 x12 (.a1(z[1]),.a2(p[1]),.z(s[1])); 
AND3X1 x13 (.a1(cin),.a2(p[0]),.a3(p[1]),.z(z[2])); 
AND2X1 x14 (.a1(g[0]),.a2(p[1]),.z(z[3])); 
OR3X1 x15 (.a1(z[2]),.a2(z[3]),.a3(g[1]),.z(z[4])); 
XOR2X1 x16 (.a1(z[4]),.a2(p[2]),.z(s[2])); 
AND4X1 x17 (.a1(cin),.a2(p[0]),.a3(p[1]),.a4(p[2]),.z(z[5])); 
AND3X1 x18 (.a1(g[0]),.a2(p[1]),.a3(p[2]),.z(z[6])); 
AND2X1 x19 (.a1(g[1]),.a2(p[2]),.z(z[7])); 
OR4X1 x20 (.a1(z[5]),.a2(z[6]),.a3(z[7]),.a4(g[2]),.z(z[8])); 
XOR2X1 x21 (.a1(z[8]),.a2(p[3]),.z(s[3])); 
AND4X1 x22 (.a1(cin),.a2(p[0]),.a3(p[1]),.a4(p[2]),.z(z[9])); 
AND3X1 x23 (.a1(g[0]),.a2(p[1]),.a3(p[2]),.z(z[10])); 
AND2X1 x24 (.a1(g[1]),.a2(p[2]),.z(z[11])); 
OR4X1 x25 (.a1(z[9]),.a2(z[10]),.a3(z[11]),.a4(g[2]),.z(z[12])); 
AND2X1 x26 (.a1(z[12]),.a2(p[3]),.z(z[13])); 
OR2X1 x27 (.a1(z[13]),.a2(g[3]),.z(cout)); 
endmodule 

//code ends here
