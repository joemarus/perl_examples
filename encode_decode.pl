#!/usr/bin/perl
# encode_decode.pl
# A quick example of how the tr (transliteration) function works.
use strict;    
use warnings;

my $message;  # Required by "use strict", a good practice.
print "Enter a message to encode:\n>";
$message = <STDIN>;
chomp $message;

# The tr (transliteration) function works by replacing one character with another.
# In this case we are replacing each character with one that appears in the
# alphabet 13 characters later.  So an "A" becomes an "N", a "B" becomes a "O", etc.
# The old folks might recognize this scheme as ROT13.
# By the way, the tr function does not use regular expressions at all. 
$message =~ tr/A-Za-z/N-ZA-Mn-za-m/;
print "Here is the encoded message:\n>$message\n";
print "\nPress Enter to decode the message:";
<STDIN>;

# To decode ROT13, we just do the exact same encoding we did before.  Note
# that we are only messing with the alphabetic characters, not numbers, spaces,
# or punctuation.  ROT13 is not a very good way to encode messages.
$message =~ tr/A-Za-z/N-ZA-Mn-za-m/;
print "Here is the decoded message:\n>$message\n";

# Here's a way to only add the extra input when we are in Windows.
if ($ENV{OS} eq "Windows_NT") {
    print "\nPress Enter to close window";
    <STDIN>;
}
