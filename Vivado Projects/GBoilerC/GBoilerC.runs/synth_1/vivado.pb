
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:062

00:00:082	
366.6802
65.598Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental {C:/GitRepos/GBoilerC/Vivado Projects/GBoilerC/GBoilerC.srcs/utils_1/imports/synth_1/CPU.dcp}Z12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2]
[C:/GitRepos/GBoilerC/Vivado Projects/GBoilerC/GBoilerC.srcs/utils_1/imports/synth_1/CPU.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
^
Command: %s
53*	vivadotcl2-
+synth_design -top GBC -part xc7s25csga324-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
y
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2
xc7s25Z17-347h px� 
i
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2
xc7s25Z17-349h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
14008Z8-7075h px� 
�
%s*synth2u
sStarting Synthesize : Time (s): cpu = 00:00:21 ; elapsed = 00:00:25 . Memory (MB): peak = 848.215 ; gain = 472.895
h px� 
�
synthesizing module '%s'%s4497*oasys2
GBC2
 2.
*C:/GitRepos/GBoilerC/Verilog_Sources/GBC.v2
238@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
CPU2
 22
.C:/GitRepos/GBoilerC/Verilog_Sources/CPU/CPU.v2
338@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
Bypass_Register2
 2>
:C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Bypass_Register.v2
238@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

Register2
 27
3C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Register.v2
238@Z8-6157h px� 
G
%s
*synth2/
-	Parameter SIZE bound to: 8 - type: integer 
h p
x
� 
J
%s
*synth22
0	Parameter INITIAL bound to: 0 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

Register2
 2
02
127
3C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Register.v2
238@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Bypass_Register2
 2
02
12>
:C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Bypass_Register.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Pipeline_Register2
 2@
<C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Pipeline_Register.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Pipeline_Register2
 2
02
12@
<C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Pipeline_Register.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2#
!Pipeline_Register__parameterized02
 2@
<C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Pipeline_Register.v2
238@Z8-6157h px� 
H
%s
*synth20
.	Parameter SIZE bound to: 16 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2#
!Pipeline_Register__parameterized02
 2
02
12@
<C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Pipeline_Register.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Register_File2
 2<
8C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Register_File.v2
248@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2!
Bypass_Register__parameterized02
 2>
:C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Bypass_Register.v2
238@Z8-6157h px� 
H
%s
*synth20
.	Parameter SIZE bound to: 16 - type: integer 
h p
x
� 
�
synthesizing module '%s'%s4497*oasys2
Register__parameterized02
 27
3C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Register.v2
238@Z8-6157h px� 
H
%s
*synth20
.	Parameter SIZE bound to: 16 - type: integer 
h p
x
� 
J
%s
*synth22
0	Parameter INITIAL bound to: 0 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Register__parameterized02
 2
02
127
3C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Register.v2
238@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
Bypass_Register__parameterized02
 2
02
12>
:C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Bypass_Register.v2
238@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Register_File2
 2
02
12<
8C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Register_File.v2
248@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ALU2
 27
3C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ALUs/ALU.v2
288@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
Register__parameterized12
 27
3C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Register.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Register__parameterized12
 2
02
127
3C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Register.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Register__parameterized22
 27
3C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Register.v2
238@Z8-6157h px� 
G
%s
*synth2/
-	Parameter SIZE bound to: 4 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Register__parameterized22
 2
02
127
3C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Register.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

Main_ALU2
 2<
8C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ALUs/Main_ALU.v2
248@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
Adder82
 2:
6C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ALUs/Adder8.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Adder82
 2
02
12:
6C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ALUs/Adder8.v2
238@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

Main_ALU2
 2
02
12<
8C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ALUs/Main_ALU.v2
248@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Incrementer_8Bit2
 2D
@C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ALUs/Incrementer_8Bit.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Incrementer_8Bit2
 2
02
12D
@C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ALUs/Incrementer_8Bit.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

Logic_Unit2
 2>
:C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ALUs/Logic_Unit.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

Logic_Unit2
 2
02
12>
:C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ALUs/Logic_Unit.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

Misc_ALU2
 2<
8C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ALUs/Misc_ALU.v2
248@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
DAA2
 27
3C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ALUs/DAA.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
DAA2
 2
02
127
3C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ALUs/DAA.v2
238@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

Misc_ALU2
 2
02
12<
8C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ALUs/Misc_ALU.v2
248@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ALU2
 2
02
127
3C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ALUs/ALU.v2
288@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

Add16_r82
 2=
9C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Bit16/Add16_r8.v2
278@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

Add16_r82
 2
02
12=
9C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Bit16/Add16_r8.v2
278@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Incrementer_16bit2
 2F
BC:/GitRepos/GBoilerC/Verilog_Sources/CPU/Bit16/Incrementer_16bit.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Incrementer_16bit2
 2
02
12F
BC:/GitRepos/GBoilerC/Verilog_Sources/CPU/Bit16/Incrementer_16bit.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
Adder162
 2<
8C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Bit16/Adder16.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
Adder162
 2
02
12<
8C:/GitRepos/GBoilerC/Verilog_Sources/CPU/Bit16/Adder16.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ControlUnit2
 2F
BC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/ControlUnit.v2
348@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

CU_Clock2
 2C
?C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/CU_Clock.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

CU_Clock2
 2
02
12C
?C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/CU_Clock.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
Decoder2
 2;
7C:/GitRepos/GBoilerC/Verilog_Sources/Generics/Decoder.v2
238@Z8-6157h px� 
G
%s
*synth2/
-	Parameter SIZE bound to: 4 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
Decoder2
 2
02
12;
7C:/GitRepos/GBoilerC/Verilog_Sources/Generics/Decoder.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Decoder__parameterized02
 2;
7C:/GitRepos/GBoilerC/Verilog_Sources/Generics/Decoder.v2
238@Z8-6157h px� 
G
%s
*synth2/
-	Parameter SIZE bound to: 8 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Decoder__parameterized02
 2
02
12;
7C:/GitRepos/GBoilerC/Verilog_Sources/Generics/Decoder.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
NOP_Microcode2
 2R
NC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/NOP_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
NOP_Microcode2
 2
02
12R
NC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/NOP_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Decoder__parameterized12
 2;
7C:/GitRepos/GBoilerC/Verilog_Sources/Generics/Decoder.v2
238@Z8-6157h px� 
G
%s
*synth2/
-	Parameter SIZE bound to: 2 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Decoder__parameterized12
 2
02
12;
7C:/GitRepos/GBoilerC/Verilog_Sources/Generics/Decoder.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
X02
 2=
9C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/X0.v2
318@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
LDa16SP_Microcode2
 2V
RC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/LDa16SP_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
LDa16SP_Microcode2
 2
02
12V
RC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/LDa16SP_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
LDrpd16_Microcode2
 2V
RC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/LDrpd16_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
LDrpd16_Microcode2
 2
02
12V
RC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/LDrpd16_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
JRs8_Microcode2
 2S
OC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/JRs8_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
JRs8_Microcode2
 2
02
12S
OC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/JRs8_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ADDHLrp_Microcode2
 2V
RC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/ADDHLrp_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ADDHLrp_Microcode2
 2
02
12V
RC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/ADDHLrp_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
LDrp3pA_Microcode2
 2V
RC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/LDrp3pA_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
LDrp3pA_Microcode2
 2
02
12V
RC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/LDrp3pA_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
INCDECrpp_Microcode2
 2X
TC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/INCDECrpp_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
INCDECrpp_Microcode2
 2
02
12X
TC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/INCDECrpp_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
INCDECry_Microcode2
 2W
SC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/INCDECry_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
INCDECry_Microcode2
 2
02
12W
SC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/INCDECry_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
LDryd8_Microcode2
 2U
QC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/LDryd8_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
LDryd8_Microcode2
 2
02
12U
QC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/LDryd8_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
MiscALU_Microcode2
 2V
RC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/MiscALU_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
MiscALU_Microcode2
 2
02
12V
RC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/MiscALU_Microcode.v2
238@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
X02
 2
02
12=
9C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/X0.v2
318@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
X12
 2=
9C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/X1.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
X12
 2
02
12=
9C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/X1.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
X22
 2=
9C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/X2.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
X22
 2
02
12=
9C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/X2.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
X32
 2=
9C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/X3.v2
348@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
RET_Microcode2
 2R
NC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/RET_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
RET_Microcode2
 2
02
12R
NC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/RET_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
LDca8A_Microcode2
 2U
QC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/LDca8A_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
LDca8A_Microcode2
 2
02
12U
QC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/LDca8A_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ADDSPs8_Microcode2
 2V
RC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/ADDSPs8_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ADDSPs8_Microcode2
 2
02
12V
RC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/ADDSPs8_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
POP_Microcode2
 2R
NC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/POP_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
POP_Microcode2
 2
02
12R
NC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/POP_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
LDPCSP_HL_Microcode2
 2X
TC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/LDPCSP_HL_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
LDPCSP_HL_Microcode2
 2
02
12X
TC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/LDPCSP_HL_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
JP_a16_Microcode2
 2U
QC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/JP_a16_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
JP_a16_Microcode2
 2
02
12U
QC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/JP_a16_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
LDa16A_Microcode2
 2U
QC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/LDa16A_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
LDa16A_Microcode2
 2
02
12U
QC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/LDa16A_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
CALL_Microcode2
 2S
OC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/CALL_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CALL_Microcode2
 2
02
12S
OC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/CALL_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
PUSH_Microcode2
 2S
OC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/PUSH_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
PUSH_Microcode2
 2
02
12S
OC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/PUSH_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ALU_d8_Microcode2
 2U
QC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/ALU_d8_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ALU_d8_Microcode2
 2
02
12U
QC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/ALU_d8_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
RST_Microcode2
 2R
NC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/RST_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
RST_Microcode2
 2
02
12R
NC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/RST_Microcode.v2
238@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
X32
 2
02
12=
9C:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/X3.v2
348@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Interrupt_Address2
 2L
HC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Interrupt_Address.v2
258@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
LowestSetBit2
 2@
<C:/GitRepos/GBoilerC/Verilog_Sources/Generics/LowestSetBit.v2
238@Z8-6157h px� 
G
%s
*synth2/
-	Parameter SIZE bound to: 5 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
LowestSetBit2
 2
02
12@
<C:/GitRepos/GBoilerC/Verilog_Sources/Generics/LowestSetBit.v2
238@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Interrupt_Address2
 2
02
12L
HC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Interrupt_Address.v2
258@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Interrupt_Microcode2
 2X
TC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/Interrupt_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Interrupt_Microcode2
 2
02
12X
TC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/Interrupt_Microcode.v2
238@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
CB_Microcode2
 2Q
MC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/CB_Microcode.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CB_Microcode2
 2
02
12Q
MC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/Microcode/CB_Microcode.v2
238@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ControlUnit2
 2
02
12F
BC:/GitRepos/GBoilerC/Verilog_Sources/CPU/ControlUnit/ControlUnit.v2
348@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CPU2
 2
02
122
.C:/GitRepos/GBoilerC/Verilog_Sources/CPU/CPU.v2
338@Z8-6155h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
i_Clk2
CPU2
cpu2.
*C:/GitRepos/GBoilerC/Verilog_Sources/GBC.v2
378@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
cpu2
CPU2
112
102.
*C:/GitRepos/GBoilerC/Verilog_Sources/GBC.v2
378@Z8-7023h px� 
�
synthesizing module '%s'%s4497*oasys2

High_Ram2
 23
/C:/GitRepos/GBoilerC/Verilog_Sources/High_Ram.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

High_Ram2
 2
02
123
/C:/GitRepos/GBoilerC/Verilog_Sources/High_Ram.v2
238@Z8-6155h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
82
i_ReadWrite2
12

High_Ram2.
*C:/GitRepos/GBoilerC/Verilog_Sources/GBC.v2
618@Z8-689h px� 
�
synthesizing module '%s'%s4497*oasys2
Interrupt_Controller2
 2?
;C:/GitRepos/GBoilerC/Verilog_Sources/Interrupt_Controller.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Interrupt_Controller2
 2
02
12?
;C:/GitRepos/GBoilerC/Verilog_Sources/Interrupt_Controller.v2
238@Z8-6155h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
82
i_ReadWrite2
12
Interrupt_Controller2.
*C:/GitRepos/GBoilerC/Verilog_Sources/GBC.v2
818@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
i_Clk2
Interrupt_Controller2
interrupt_controller2.
*C:/GitRepos/GBoilerC/Verilog_Sources/GBC.v2
718@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
interrupt_controller2
Interrupt_Controller2
112
102.
*C:/GitRepos/GBoilerC/Verilog_Sources/GBC.v2
718@Z8-7023h px� 
�
synthesizing module '%s'%s4497*oasys2
OAM_LastPage_Controller2
 2U
QC:/GitRepos/GBoilerC/Verilog_Sources/Memory_Controllers/OAM_LastPage_Controller.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
OAM_LastPage_Controller2
 2
02
12U
QC:/GitRepos/GBoilerC/Verilog_Sources/Memory_Controllers/OAM_LastPage_Controller.v2
238@Z8-6155h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
i_Clk2
OAM_LastPage_Controller2
oam_reg_control2.
*C:/GitRepos/GBoilerC/Verilog_Sources/GBC.v2
888@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
i_data_access2
OAM_LastPage_Controller2
oam_reg_control2.
*C:/GitRepos/GBoilerC/Verilog_Sources/GBC.v2
888@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
oam_reg_control2
OAM_LastPage_Controller2
112
92.
*C:/GitRepos/GBoilerC/Verilog_Sources/GBC.v2
888@Z8-7023h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
GBC2
 2
02
12.
*C:/GitRepos/GBoilerC/Verilog_Sources/GBC.v2
238@Z8-6155h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
interrupt_signals2
GBC2.
*C:/GitRepos/GBoilerC/Verilog_Sources/GBC.v2
678@Z8-3848h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Address[6]2

High_RamZ8-7129h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Address[5]2

High_RamZ8-7129h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Address[4]2

High_RamZ8-7129h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Address[3]2

High_RamZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2

i_Bus[7]2

High_RamZ8-7129h px� 

9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[7]2
CB_MicrocodeZ8-7129h px� 

9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[6]2
CB_MicrocodeZ8-7129h px� 

9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[5]2
CB_MicrocodeZ8-7129h px� 

9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[4]2
CB_MicrocodeZ8-7129h px� 

9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[3]2
CB_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Step[3]2
Interrupt_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[7]2
Interrupt_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[6]2
Interrupt_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[5]2
Interrupt_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[4]2
Interrupt_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[7]2
RST_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[6]2
RST_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[5]2
RST_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[4]2
RST_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Step[3]2
ALU_d8_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[7]2
ALU_d8_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[6]2
ALU_d8_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[5]2
ALU_d8_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[4]2
ALU_d8_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[3]2
ALU_d8_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[2]2
ALU_d8_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[7]2
PUSH_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[6]2
PUSH_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[5]2
PUSH_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[4]2
PUSH_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[7]2
CALL_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[6]2
CALL_MicrocodeZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2

i_Always2
CALL_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Step[3]2
LDa16A_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Step[2]2
LDa16A_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[7]2
LDa16A_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[6]2
LDa16A_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[5]2
LDa16A_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[4]2
LDa16A_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Step[3]2
JP_a16_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Step[2]2
JP_a16_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[7]2
JP_a16_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[6]2
JP_a16_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[5]2
JP_a16_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[4]2
JP_a16_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[7]2
LDPCSP_HL_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[6]2
LDPCSP_HL_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[5]2
LDPCSP_HL_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[4]2
LDPCSP_HL_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[3]2
LDPCSP_HL_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[2]2
LDPCSP_HL_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[0]2
LDPCSP_HL_MicrocodeZ8-7129h px� 

9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Step[3]2
POP_MicrocodeZ8-7129h px� 

9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Step[2]2
POP_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[7]2
POP_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[6]2
POP_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[5]2
POP_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[4]2
POP_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[3]2
POP_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Step[3]2
ADDSPs8_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[7]2
ADDSPs8_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[6]2
ADDSPs8_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[5]2
ADDSPs8_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[4]2
ADDSPs8_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Step[3]2
LDca8A_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Step[2]2
LDca8A_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[7]2
LDca8A_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[6]2
LDca8A_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[5]2
LDca8A_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[4]2
LDca8A_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[3]2
LDca8A_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[7]2
RET_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[6]2
RET_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[5]2
RET_MicrocodeZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Opcode[7]2
X3Z8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Opcode[6]2
X3Z8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Opcode[2]2
X3Z8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Opcode[1]2
X3Z8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Opcode[0]2
X3Z8-7129h px� 
k
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Y[5]2
X3Z8-7129h px� 
k
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Y[4]2
X3Z8-7129h px� 
t
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Step[3]2
X2Z8-7129h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[7]2
X2Z8-7129h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[6]2
X2Z8-7129h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[5]2
X2Z8-7129h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[4]2
X2Z8-7129h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[3]2
X2Z8-7129h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[2]2
X2Z8-7129h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[7]2
X1Z8-7129h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[6]2
X1Z8-7129h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[5]2
X1Z8-7129h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[4]2
X1Z8-7129h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[3]2
X1Z8-7129h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[2]2
X1Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Step[3]2
MiscALU_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Step[0]2
MiscALU_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Step[3]2
LDryd8_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Step[2]2
LDryd8_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[7]2
LDryd8_MicrocodeZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
i_Cycle_Count[6]2
LDryd8_MicrocodeZ8-7129h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-71292
100Z17-14h px� 
�
%s*synth2u
sFinished Synthesize : Time (s): cpu = 00:00:27 ; elapsed = 00:00:34 . Memory (MB): peak = 969.309 ; gain = 593.988
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
~Finished Constraint Validation : Time (s): cpu = 00:00:30 ; elapsed = 00:00:37 . Memory (MB): peak = 969.309 ; gain = 593.988
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7s25csga324-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:30 ; elapsed = 00:00:37 . Memory (MB): peak = 969.309 ; gain = 593.988
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
Loading part %s157*device2
xc7s25csga324-1Z21-403h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
7
%s
*synth2
Start Preparing Guide Design
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
�The reference checkpoint %s is not suitable for use with incremental synthesis for this design. Please regenerate the checkpoint for this design with -incremental_synth switch in the same Vivado session that synth_design has been run. Synthesis will continue with the default flow4740*oasys2]
[C:/GitRepos/GBoilerC/Vivado Projects/GBoilerC/GBoilerC.srcs/utils_1/imports/synth_1/CPU.dcpZ8-6895h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2}
{Finished Doing Graph Differ : Time (s): cpu = 00:00:31 ; elapsed = 00:00:38 . Memory (MB): peak = 969.309 ; gain = 593.988
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Preparing Guide Design : Time (s): cpu = 00:00:31 ; elapsed = 00:00:38 . Memory (MB): peak = 969.309 ; gain = 593.988
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:34 ; elapsed = 00:00:42 . Memory (MB): peak = 969.309 ; gain = 593.988
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
C
%s
*synth2+
)

Incremental Synthesis Report Summary:

h p
x
� 
<
%s
*synth2$
"1. Incremental synthesis run: no

h p
x
� 
O
%s
*synth27
5   Reason for not running incremental synthesis : 


h p
x
� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}4868*oasysZ8-7130h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   17 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input    8 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input    5 Bit       Adders := 8     
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit       Adders := 5     
h p
x
� 
F
%s
*synth2.
,	   3 Input    4 Bit       Adders := 2     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input      8 Bit         XORs := 5     
h p
x
� 
H
%s
*synth20
.	   2 Input      5 Bit         XORs := 2     
h p
x
� 
H
%s
*synth20
.	   2 Input      1 Bit         XORs := 6     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               16 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 11    
h p
x
� 
H
%s
*synth20
.	                5 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 5     
h p
x
� 
&
%s
*synth2
+---RAMs : 
h p
x
� 
U
%s
*synth2=
;	               56 Bit	(8 X 7 bit)          RAMs := 1     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit        Muxes := 7     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 29    
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 8     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 23    
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
o
%s
*synth2W
UPart Resources:
DSPs: 80 (col length:40)
BRAMs: 90 (col length: RAMB18 40 RAMB36 20)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:49 ; elapsed = 00:02:02 . Memory (MB): peak = 1082.410 ; gain = 707.090
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:49 ; elapsed = 00:02:03 . Memory (MB): peak = 1107.266 ; gain = 731.945
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:49 ; elapsed = 00:02:03 . Memory (MB): peak = 1107.266 ; gain = 731.945
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:01:04 ; elapsed = 00:02:20 . Memory (MB): peak = 1307.336 ; gain = 932.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:01:04 ; elapsed = 00:02:20 . Memory (MB): peak = 1307.336 ; gain = 932.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:01:04 ; elapsed = 00:02:20 . Memory (MB): peak = 1307.336 ; gain = 932.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:01:04 ; elapsed = 00:02:20 . Memory (MB): peak = 1307.336 ; gain = 932.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:01:04 ; elapsed = 00:02:20 . Memory (MB): peak = 1307.336 ; gain = 932.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:01:04 ; elapsed = 00:02:20 . Memory (MB): peak = 1307.336 ; gain = 932.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
+
%s*synth2
+-+-----+------+
h px� 
+
%s*synth2
| |Cell |Count |
h px� 
+
%s*synth2
+-+-----+------+
h px� 
+
%s*synth2
+-+-----+------+
h px� 
3
%s
*synth2

Report Instance Areas: 
h p
x
� 
<
%s
*synth2$
"+------+---------+-------+------+
h p
x
� 
<
%s
*synth2$
"|      |Instance |Module |Cells |
h p
x
� 
<
%s
*synth2$
"+------+---------+-------+------+
h p
x
� 
<
%s
*synth2$
"|1     |top      |       |     0|
h p
x
� 
<
%s
*synth2$
"+------+---------+-------+------+
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:01:04 ; elapsed = 00:02:20 . Memory (MB): peak = 1307.336 ; gain = 932.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
b
%s
*synth2J
HSynthesis finished with 0 errors, 1 critical warnings and 184 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:01:04 ; elapsed = 00:02:20 . Memory (MB): peak = 1307.336 ; gain = 932.016
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:01:04 ; elapsed = 00:02:20 . Memory (MB): peak = 1307.336 ; gain = 932.016
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1308.3122
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1423.8122
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

1c4b232eZ4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1302
1112
12
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:01:112

00:02:342

1423.8122

1054.719Z17-268h px� 
c
%s6*runtcl2G
ESynthesis results are not added to the cache due to CRITICAL_WARNING
h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2M
KC:/GitRepos/GBoilerC/Vivado Projects/GBoilerC/GBoilerC.runs/synth_1/GBC.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2Q
Oreport_utilization -file GBC_utilization_synth.rpt -pb GBC_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Sat Apr 19 13:08:52 2025Z17-206h px� 


End Record