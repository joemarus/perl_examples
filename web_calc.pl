#!/usr/bin/perl
use strict;
use warnings;

print "Content-type: text/html\n\n";

my $query = $ENV{'QUERY_STRING'};
my %in;

if (length ($query) > 0){
    my @things = split(/&/, $query);
    foreach my $thing (@things){
        (my $name, my $value) = split(/=/, $thing);
        $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
        $in{$name} = $value;
    }
}

my $value1 = "";
my $value2 = "";
if ($in{arg1}) { $value1 = $in{arg1}; }
if ($in{arg2}) { $value2 = $in{arg2}; }

my $selected1 = "";
my $selected2 = "";
my $selected3 = "";
my $selected4 = "";
if ($in{operation} eq "add") { $selected1 = "SELECTED"; }
if ($in{operation} eq "subtract") { $selected2 = "SELECTED"; }
if ($in{operation} eq "multiply") { $selected3 = "SELECTED"; }
if ($in{operation} eq "divide") { $selected4 = "SELECTED"; }

print "<HTML><HEAD><TITLE>Simple Calculator</TITLE></HEAD>\n";
print "<BODY><H1>A Simple Calculator</H1>\n";

print '<FORM method="GET" action="web_calc.pl">';
print "<INPUT type=\"TEXT\" size=\"10\" name=\"arg1\" value=\"$value1\">\n";
print '<SELECT name="operation">';
print "<OPTION VALUE=\"add\" $selected1>+</OPTION>";
print "<OPTION VALUE=\"subtract\" $selected2>-</OPTION>";
print "<OPTION VALUE=\"multiply\" $selected3>X</OPTION>";
print "<OPTION VALUE=\"divide\" $selected4>/</OPTION>";
print "</SELECT>\n";
print "<INPUT type=\"TEXT\" size=\"10\" name=\"arg2\" value=\"$value2\">\n";
print "<P>\n";
print '<INPUT type="SUBMIT" value="Calculate">';
print "<HR />\n";
print "Answer: ";
if (($in{arg1}) && ($in{arg2})) {
    print $in{arg1} + $in{arg2} if ($in{operation} eq "add");
    print $in{arg1} - $in{arg2} if ($in{operation} eq "subtract");
    print $in{arg1} * $in{arg2} if ($in{operation} eq "multiply");
    print $in{arg1} / $in{arg2} if ($in{operation} eq "divide");
}

print "</BODY></HTML>\n";

