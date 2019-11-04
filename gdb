# To start the debugger:
gdb -q ./executable

# To set a breakpoint:
b method ;; break method
OR break some-method

# To run the program:
r ;; run

# when a breakpoint is reached:

# To run the current line, stepping over any invocations:
n ;; next

# To run the current line, stepping into any invocations:
s ;; step

# To print a stacktrace:
bt ;; backtrace

# To list surrounding source code:
l ;; list

# To continue execution:
c ;; continue

# To exit gdb (after program terminated):
q ;; quit

# To evaluate an expression and print the result:
p length=strlen(string)
