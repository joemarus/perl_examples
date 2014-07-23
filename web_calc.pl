#!/usr/bin/perl
use strict;
use warnings;
use Scalar::Util qw(looks_like_number);

print "Content-type: text/html\n\n";


#-------------------------------------------------------------------------------
# This is Patrick's code for splitting apart the query string.
# The results go into a hash called %in.
#-------------------------------------------------------------------------------
my $query = $ENV{'QUERY_STRING'};
my %in;
my $error = "";

if (length ($query) > 0){
    my @things = split(/&/, $query);
    foreach my $thing (@things){
        (my $name, my $value) = split(/=/, $thing);
        $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
        $in{$name} = $value;
    }
}

#-------------------------------------------------------------------------------
# In this section, I take any passed in values and get ready to populate
# the form fields with them.
#-------------------------------------------------------------------------------
my $value1 = "";
my $value2 = "";
if (length($in{arg1}) > 0) { $value1 = $in{arg1}; }
if (length($in{arg2}) > 0) { $value2 = $in{arg2}; }

my $selected1 = "";
my $selected2 = "";
my $selected3 = "";
my $selected4 = "";
if ($in{operation} eq "add") { $selected1 = "SELECTED"; }
if ($in{operation} eq "subtract") { $selected2 = "SELECTED"; }
if ($in{operation} eq "multiply") { $selected3 = "SELECTED"; }
if ($in{operation} eq "divide") { $selected4 = "SELECTED"; }

#-------------------------------------------------------------------------------
# This is the HTML form.
#-------------------------------------------------------------------------------
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
print "</FORM><HR />\n";
print "Answer: ";

#-------------------------------------------------------------------------------
# In this part, I do some checking to see if we have valid values to work with.
#-------------------------------------------------------------------------------
if ( (length($in{arg1}) > 0) && !looks_like_number($in{arg1}) ) {
    $error = $error . "Your first value does not look like a number. ";
}
if ( (length($in{arg2}) > 0) && !looks_like_number($in{arg2}) ) {
    $error = $error . "Your second value does not look like a number. ";
}
if ( ($in{arg2} eq "0") && ($in{operation} eq "divide") ) {
    $error = $error . "Division by zero not allowed.  ";
}

#-------------------------------------------------------------------------------
# Here is where all the calculating work is done.  If there are no errors, and
# if there is actual data to work with, we do the calculation and print the 
# result.  Otherwise, we print the errors that were found.
#-------------------------------------------------------------------------------
if ( (length($error) == 0) && (length($in{arg1}) > 0) && (length($in{arg2}) > 0) ) {
    print $in{arg1} + $in{arg2} if ($in{operation} eq "add");
    print $in{arg1} - $in{arg2} if ($in{operation} eq "subtract");
    print $in{arg1} * $in{arg2} if ($in{operation} eq "multiply");
    print $in{arg1} / $in{arg2} if ($in{operation} eq "divide");
} else {
    print "<SPAN style=\"color: red;\">$error</SPAN>";
}

print "</BODY></HTML>\n";


