! Copyright (C) 2011 Joseph Moschini.
! See http://factorcode.org/license.txt for BSD license.
!
USING: kernel 6805.emulator.ddr models accessors math ;


IN: 6805.emulator.outputs

! The port has two 8 bit registers
! LATCH   Set the state of output pin
! DDR     Writing a 1 to a DDR bit sets the
!         corresponding port bit to output mode
! 

TUPLE: port < model ddr latch ;

! new port is dependant on ddr port
: <port> ( value -- port )
    port new-model ;
 

! Depending DDR we ether read from out side world or latch output
: port-read ( port -- d )
    dup [ ddr>> value>> ] [ latch>> ] bi bitand
    swap dup [ ddr>> value>> bitnot ] [ value>> ] bi bitand
    swap drop bitand ;

! Write to port
: port-write ( d port -- )
    drop
    drop ;

M: port model-changed ( model observer -- )
    drop
    drop ;
    

