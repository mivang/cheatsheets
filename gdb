# To start the debugger:
gdb -q ./executable

# To attach gdb to an existing process PID
gdb -q -p <PID> 


# To run the program
r ;; run
r parameter1 parameter2 ;; run with parameters

# Disassemble a program (the main function)
disas main ;; disasemble function with name "main"
disassemble main

# List source code
`list 1` ;; list source code

# Get information about object
info sources               ;; list information on the source file
info functions             ;; list functions
info variables,            ;; list global variables
info scope <FunctionName>` ;; list local variables in the specified function
info files                 ;; lists all the sections and their addresses, like ".text", ".bss", ...
info registers             ;; get registers values
info all-registers         ;; get all registers values
info breakpoints           ;; lists breakpoints set

# Breakpoint on function
b <function_name>

# Breakpoint on instruction addresses
b *0x080484cd 

# Breakpoint on line number
break 54

# Disable/Enable/Delete a breakpoint
i b         ;; list breakpoints (info breakpoints)
disable 1   ;; disable breakpoint 1
enable 1    ;; enable breakpoint 1
delete 1    ;; delete breakpoint 1

# when a breakpoint is reached:

# To run the next line (without going inside library/system calls)
n ;; next

# To run the next line (also stepping into any library/system call)
s ;; step

# To continue until end of function
finish

# To continue until next breakpoint or end
c ;; continue until next breakpoint or end

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
