## Assembly program that traverses a entered text file and changes 
## any numbers below ten to text instead of digits. 

#Hamza Yoðurtcuoðlu
#171044086

        .data
fileNameSpace : .space 20 
fileNameMessage : .asciiz "Enter Your File Name (Example : input_hw1.txt) : "        
fileWord : .space 256
numberZero : .asciiz "zero"
numberOne : .asciiz "one"
numberTwo : .asciiz "two"
numberThree : .asciiz "three"
numberFour : .asciiz  "four"
numberFive : .asciiz "five"
numberSix : .asciiz  "six"
numberSeven : .asciiz  "seven"         #All Digit are kept on data.
numberEight: .asciiz "eight"
numberNine : .asciiz "nine"
capitalNumberZero : .asciiz "Zero"
capitalNumberOne : .asciiz "One"
capitalNumberTwo : .asciiz "Two"
capitalNumberThree : .asciiz "Three"
capitalNumberFour : .asciiz  "Four"
capitalNumberFive : .asciiz "Five"
capitalNumberSix : .asciiz  "Six"
capitalNumberSeven : .asciiz  "Seven"
capitalNumberEight: .asciiz "Eight"
capitalNumberNine : .asciiz "Nine"   
             
            .text
  ###############################################################
  
main :            #main function is started
  li $s3,'\0'            #s3 register for putting null and Im using end of filename and end of reading text 
  li $v0,4
  la $a0,fileNameMessage  #Typing message(Enter Your File Name...) on Run I/O
  syscall 
  
  li $v0,8
  la $a0,fileNameSpace   #User enter filename Example : input_hw1.txt
  li $a1,20
  syscall             
  
  move $a2,$a0           #Name of file is moved a different register for changing '\n' to '\0' 
  
  jal returnKeepLabel    #Call procedure
  li $v0,10              #When procedure is finished . Program will finish and exit.  
  syscall 
##############################################################

returnKeepLabel:
  move $t9,$ra          #Im keeping return adress for main function when I finish all process
fileNameFix :         
  lb $t6,0($a2)
  beq $t6,'\n',fileNameEnd  #fileNameFix label has a mission that 	
  addi $a2,$a2,1            #has to find '\n' in user's typing file name
  j fileNameFix 	 
  	     
fileNameEnd:
  sb $s3,0($a2)            #Im putting '\0' character to end of file name instead of '\n'
  	              	               	               	             
readFile:  
  li   $v0, 13      
  la   $a0, fileNameSpace   
  li   $a1, 0        # Open for reading (flags are 0: read, 1: write)
  syscall            # open a file (file descriptor returned in $v0)
  move $s6, $v0      # save the file descriptor 
  ###############################################################
  # Read to file just opened  
  li   $v0, 14       # system call for read to file
  move $a0,$s6
  la   $a1, fileWord   
  la   $a2, 256      # hardcoded buffer length
  syscall            # read to file
  
  addi $t2,$t2,1     #I control what each characters is beginning of sentences or not
                     #$t2 is 1 = beginning of sentence or 0 = not    			
                     
Loop:
  lb $t5,0($a1)  #Current Character   
  lb $t7,-1($a1) #Previous Character      #Im keeping in order to check if my character is 
  lb $s4,1($a1)  #Next Character          #involved a floating number or bigger number than 9
  lb $t8,-2($a1) #Two Previous Character
  beq $t5,'.',IncrementControl #Capital is detected and increment $t2 for Capital
  beq $t5,'\n',IncrementControl #Indent is detected and increment $t2 for Capital  . 
  bne $t5,0,Continue  
  j close 	        #when I find '\0' character end of file then , jump to close file

Continue:  		
  li $s7,48 #Im putting 0 character and Im checking last and next character are a number,point or not
  beq $t5,'0',zeroLabel
  beq $t5,'1',oneLabel
  beq $t5,'2',twoLabel
  beq $t5,'3',threeLabel
  beq $t5,'4',fourLabel    #If current character is one of them character , jump to a label
  beq $t5,'5',fiveLabel
  beq $t5,'6',sixLabel
  beq $t5,'7',sevenLabel
  beq $t5,'8',eightLabel
  beq $t5,'9',nineLabel

print:    
  li $v0,11
  lb  $a0,0($a1) #If current character is not a digit . it's printing here
  syscall 
  addi $a1,$a1,1 #Passing next character in text  	 
  move $t2,$zero #Capital control is copied 0
  j Loop         #Loop is continued

printNewLineAndPoint:  #If current character is newline or point , that is printing here  
  li $v0,11
  lb  $a0,0($a1)
  syscall 
  addi $a1,$a1,1	
  j Loop

IncrementControl:# Indent and Point Increment for Capital Letter Digit 
  addi $t2,$t2,1
  j printNewLineAndPoint	
  		 		  		  		
zeroLabel:
  beq $s7,$t7,print   #Previous Character Control Digit or not
  beq $s7,$s4,print   #Next Character Control Digit or not
  addi $s7,$s7,1      #s7 will increment
  bne $s7,':',zeroLabel	
  beq $s4,'.',print    ##Next Character Control Digit or not
  beq $t7,'.',print    ##Previous Character Control Digit or not
  beq $t2,1,capitalZeroLabel   #If Capital control register is 1 ,Our digit has big capital
  beq $t8,'.',capitalZeroLabel
  li $v0,4
  la $a0,numberZero #printing not capital zero 
  addi $a1,$a1,1
  syscall 
  j Loop  #Jump loop label in order to check other character 
oneLabel:
  beq $s7,$t7,print
  beq $s7,$s4,print
  addi $s7,$s7,1
  bne $s7,':',oneLabel	
  beq $s4,'.',print
  beq $t7,'.',print
  beq $t2,1,capitalOneLabel
    beq $t8,'.',capitalOneLabel ##All Instructions are same  
  li $v0,4
  la $a0,numberOne
  addi $a1,$a1,1
  syscall 
  j Loop   
twoLabel:
  beq $s7,$t7,print
  beq $s7,$s4,print
  addi $s7,$s7,1
  bne $s7,':',twoLabel	
  beq $s4,'.',print
  beq $t7,'.',print                ##All Instructions are same
  beq $t2,1,capitalTwoLabel
  beq $t8,'.',capitalTwoLabel
  li $v0,4
  la $a0,numberTwo
  addi $a1,$a1,1
  syscall 
  j Loop
threeLabel:
  beq $s7,$t7,print
  beq $s7,$s4,print
  addi $s7,$s7,1
  bne $s7,':',threeLabel	
  beq $s4,'.',print
  beq $t7,'.',print                ##All Instructions are same
  beq $t2,1,capitalThreeLabel
  beq $t8,'.',capitalThreeLabel
  li $v0,4
  la $a0,numberThree
  addi $a1,$a1,1
  syscall 
  j Loop
fourLabel:
  beq $s7,$t7,print
  beq $s7,$s4,print
  addi $s7,$s7,1
  bne $s7,':',fourLabel	
  beq $s4,'.',print
  beq $t7,'.',print              ##All Instructions are same
  beq $t2,1,capitalFourLabel
  beq $t8,'.',capitalFourLabel
  li $v0,4
  la $a0,numberFour
  addi $a1,$a1,1
  syscall 
  j Loop
fiveLabel:
  beq $s7,$t7,print
  beq $s7,$s4,print
  addi $s7,$s7,1
  bne $s7,':',fiveLabel	
  beq $s4,'.',print
  beq $t7,'.',print             ##All Instructions are same
  beq $t2,1,capitalFiveLabel
  beq $t8,'.',capitalFiveLabel
  li $v0,4
  la $a0,numberFive
  addi $a1,$a1,1
  syscall 
  j Loop
sixLabel:
  beq $s7,$t7,print
  beq $s7,$s4,print
  addi $s7,$s7,1
  bne $s7,':',sixLabel	
  beq $s4,'.',print
  beq $t7,'.',print              ##All Instructions are same
  beq $t2,1,capitalSixLabel
  beq $t8,'.',capitalSixLabel	 
  li $v0,4
  la $a0,numberSix
  addi $a1,$a1,1
  syscall 
  j Loop
sevenLabel:
  beq $s7,$t7,print
  beq $s7,$s4,print
  addi $s7,$s7,1
  bne $s7,':',sevenLabel	
  beq $s4,'.',print
  beq $t7,'.',print               ##All Instructions are same
  beq $t2,1,capitalSevenLabel
  beq $t8,'.',capitalSevenLabel
  li $v0,4
  la $a0,numberSeven
  addi $a1,$a1,1
  syscall 
  j Loop            
eightLabel:
  beq $s7,$t7,print
  beq $s7,$s4,print
  addi $s7,$s7,1
  bne $s7,':',eightLabel	
  beq $s4,'.',print
  beq $t7,'.',print             ##All Instructions are same
  beq $t2,1,capitalEightLabel
  beq $t8,'.',capitalEightLabel
  li $v0,4
  la $a0,numberEight
  addi $a1,$a1,1
  syscall 
  j Loop
nineLabel:
  beq $s7,$t7,print
  beq $s7,$s4,print
  addi $s7,$s7,1
  bne $s7,':',nineLabel	
  beq $s4,'.',print                ##All Instructions are same
  beq $t7,'.',print
  beq $t2,1,capitalNineLabel
  beq $t8,'.',capitalNineLabel
  li $v0,4
  la $a0,numberNine
  addi $a1,$a1,1
  syscall 
  j Loop  

capitalZeroLabel:
  li $v0,4
  la $a0,capitalNumberZero  #If My digit has capital letter printing  is here
  addi $a1,$a1,1            
  syscall 
  move $t2,$zero	    #Capital Character Control is Copied Zero
  j Loop                    #Continue character controlling
capitalOneLabel:
  li $v0,4
  la $a0,capitalNumberOne    ##All Instructions are same 
  addi $a1,$a1,1
  syscall 
  move $t2,$zero
  j Loop   
capitalTwoLabel:
  li $v0,4
  la $a0,capitalNumberTwo    ##All Instructions are same
  addi $a1,$a1,1
  syscall 
  move $t2,$zero
  j Loop
capitalThreeLabel:
  li $v0,4
  la $a0,capitalNumberThree  ##All Instructions are same
  addi $a1,$a1,1
  syscall 
  move $t2,$zero
  j Loop
capitalFourLabel:
  li $v0,4
  la $a0,capitalNumberFour  ##All Instructions are same
  addi $a1,$a1,1
  syscall 
  move $t2,$zero
  j Loop
capitalFiveLabel:
  li $v0,4
  la $a0,capitalNumberFive  ##All Instructions are same
  addi $a1,$a1,1
  syscall 
  move $t2,$zero
  j Loop
capitalSixLabel:
  li $v0,4
  la $a0,capitalNumberSix  ##All Instructions are same
  addi $a1,$a1,1
  syscall 
  move $t2,$zero
  j Loop
capitalSevenLabel:
  li $v0,4
  la $a0,capitalNumberSeven  ##All Instructions are same
  addi $a1,$a1,1
  syscall 
  move $t2,$zero
  j Loop            
capitalEightLabel:
  li $v0,4
  la $a0,capitalNumberEight  ##All Instructions are same
  addi $a1,$a1,1
  syscall 
  move $t2,$zero
  j Loop
capitalNineLabel:
  li $v0,4 
  la $a0,capitalNumberNine  ##All Instructions are same
  addi $a1,$a1,1
  syscall 
  move $t2,$zero
  j Loop  		  		   
  
  ###############################################################
  # Close the file 
close:
  li   $v0, 16       # system call for close file
  move $a0, $s6      # file descriptor to close
  syscall            # close file
  move $ra,$t9
  jr $ra #return main function
  ###############################################################