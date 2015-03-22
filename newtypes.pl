#!/usr/bin/perl
use rvp;   # use the rough verilog parser

# Read in all the files specified on the command line
$vdb = rvp->read_verilog(\@ARGV,[],{},1,[],[],'');

# Print out all the modules found
foreach $module ($vdb->get_modules()) { 
if ( @sig = $vdb->get_modules_signals($module))
	{
foreach $signal (@sig)
{($s_line,$s_a_line,$s_i_line,$s_type,$s_file,$s_p,$s_n,$s_type2,$s_r_file,$s_r_line,$range,$s_a_file,$s_i_file) = $vdb->get_module_signal($module,$signal);
print "$s_type "; }}
}