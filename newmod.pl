#!/usr/bin/perl
use rvp;   # use the rough verilog parser

# Read in all the files specified on the command line
$vdb = rvp->read_verilog(\@ARGV,[],{},1,[],[],'');

 my $chunkRead = rvp->chunk_read_init(@ARGV,0);
            while ($chunk = rvp->chunk_read($chunkRead)) {
                    print $chunk->{text} if $chunk->{type} eq "code";
            }