#!/usr/bin/perl
use strict;
use warnings;

print "Content-type: text/html\n\n";
my $agent = $ENV{HTTP_USER_AGENT};  # This is a string that your browser sends to identify itself
my $now_time = localtime;           # I'm curious what the local time is for my server.

print "<HTML><HEAD><TITLE>What browser are you using</TITLE></HEAD>\n";
print "<BODY>\n";
print "<H1>What browser are you using?</H1>\n";
# print "$agent<BR />\n";

print "Welcome!<BR />\n";
print "The local server time is $now_time<BR />\n";

# I'm going to use the m// operator to find matches, and since it it used so often,
# the "m" is optional.
if ($agent =~ /Firefox/ && $agent !~ /Opera/) {        # If I see "Firefox" but not "Opera"
    print "You appear to be running Firefox.<BR />\n";
} elsif ($agent =~ /Safari/ && $agent !~ /Chrome/) {   # If I see "Safari but not "Chrome"
    print "You appear to be running Safari.<BR />\n";
} elsif ($agent =~ /Chrome/) {
    print "Your browser appears to be Chrome.<BR />\n";
} elsif ($agent =~ /MSIE/ || $agent =~ /Trident/) {    # If I see "MSIE" or "Trident"
    print "Your browser appears to be Internet Explorer.<BR />\n";
} elsif ($agent =~ /Opera/) {                       
    print "Your browser appears to be Opera.<BR />\n";
} else {
    print "I can't tell what browser you are running!<BR />\n";
    print "Your user agent string is: $agent<BR />\n";
}

print "</BODY></HTML>";
