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
