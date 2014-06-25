Show Notes for Episode 22
=========================

Getting Input
-------------

You can read a line of input from the console by using this construct:

    $variable = <STDIN>;
    
This will make the program wait for the user to enter some data and press
Enter before the program continues.  Anything that the user typed will be 
assigned to the scalar variable `$variable`.

Getting Rid of the Extra Newline
--------------------------------

It turns out that when you use the process described above to get input, there
is a newline character that is at the end of the string of characters.  You can
get rid of it by using the `chomp` function:

    chomp $variable;
    
Using the IF statement
----------------------

The basic IF statement looks like this:

    if (control_expression) {
        true_statement_1;
        true_statement_2;
        true_statement_3;
    } else {
        false_statement_1;
        false_statement_2;
        false_statement_3;
    }
    
when the program runs, Perl evaluates the control expression.  If the expression
is true, then the first block of statements runs (the `true_statement` lines).
If the control expression is false, then the second block of statements is executed
instead.

If you have more than two possible choices, add an `elsif` branch to the IF statement:

    if (condition_one) {
        one_true_statement_1;
        one_true_statement_2;
        one_true_statement_3;
    } elsif (condition_two) {
        two_true_statement_1;
        two_true_statement_2;
        two_true_statement_3;
    } elsif (condition_three) {
        three_true_statement_1;
        three_true_statement_2;
        three_true_statement_3;
    } else {
        all_false_statement_1;
        all_false_statement_2;
        all_false_statement_3;
    }
    
Each condition is checked in turn, and if an expression is true, the corresponding
branch is executed and all the other conditions and their corresponding statement
blocks are skipped.  If all the conditions are false, the `else` branch is executed,
if it exists.  You don't have to have an `else` branch.

Comparison Operators
--------------------

Perl has two sets of comparison operators: one for comparing numbers, and one
for comparing strings.  These are needed since scalar variables don't have a
definite type; they could be a string or a number.  You need to tell Perl how 
to do the comparison.

    Comparison             Numeric   String
    --------------------------------------
    Equal                    ==        eq
    Not Equal                !=        ne
    Less Than                <         lt
    Greater Than             >         gt
    Less than or equal to    <=        le
    Greater than or equal to >=        ge
    
Intro to Regular Expressions
----------------------------

Regular expressions are used to do pattern matching in Perl.  If you need to 
search a string to find a word or pattern, you use a regular expression.  You
do searches using the match operator like this:

    $variable_to_be_searched =~ /pattern/
    
The regular expression is the pattern that goes between the slashes.  If the
pattern is found in the variable, the whole expression evaluates to true.

The most common pattern is the single character that matches itself.  If you 
have multiple characters next to each other, that exact sequence of characters
must be in the source string in order for there to be a match.  For example:

    $a = "bunny rabbit";
    $a =~ /bunny/;        # true
    $a =~ /rabbit/;       # also true
    $a =~ /bit/;          # also true
    $a =~ /rat/;          # false
    
A period (.) will match any single character except for a newline (\n).  You can
match a "class" of characters by putting them into square brackets.  One and only
one of the characters in the "class" will match at a given position in the string.
There is also a negated class where the first character is a hat, or up-arrow (^)
which will match any character EXCEPT the ones listed in the square brackets.

    $a = "cat";
    $a =~ /c.t/;            # true
    $a =~ /c[ao]t/;         # true
    $a =~ /c[aeiouAEIOU]t/; # also true
    
Some classes of characters are used so often that special codes have been made for
them:

    \d - matches one numeric digit, same as [0123456789] or [0-9]
    \w - matches one "word" character, same as [a-zA-Z0-9_]
    \s - matches one "space" character, same as [ \r\t\n\f]
    \D - matches any character that is NOT a digit, same as [^0-9]
    \W - matches any character that is NOT a word character, same as [^a-zA-Z0-9_]
    \S - matches any character that is NOT a space character, same as [^ \r\t\n\f]
    
So far all the matches have been for one character at a time.  If you want to 
match on "one or more of these" or "up to five of these" then you need some extra
codes.  An asterisk (*) will match zero or more of the previous character.  A plus
sign (+) matches one or more of the previous character.  A question mark (?) matches
zero or one copy of the previous character.

    $a = "foobar";
    $a =~ /fo+ba?r/;    # find the letter "f" followed by 1 or more letter "o"s 
                        # followed by a "b" followed by an optional "a" then 
                        # the letter "r"
                        
All matches are case-sensitive.  If you want to do a search that is 
case-INsensitive, add the "i" option after the second slash of the match
operator.

    $a = "Bunny Rabbit";
    $a =~ /bunny/i;       # true
    $a =~ /rabbit/i;      # true
    
