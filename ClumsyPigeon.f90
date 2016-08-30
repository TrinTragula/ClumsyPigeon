
module bitboards
 
   character(len=160) :: bitboard= &
             "1111111111111111"//&
             "rnbqkbnr11111111"//&
             "pppppppp11111111"//&
             "--------11111111"//&
             "--------11111111"//&
             "--------11111111"//&
             "--------11111111"//&
             "PPPPPPPP11111111"//&
             "RNBQKBNR11111111"//&
             "1111111111111111"
   
   character (len=4) :: bestmove="xxxx"
   

   
   integer, dimension(160) :: pawn=(/0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, &
        198, 198, 198, 198, 198, 198, 198, 198, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 208, 218, 218, 208, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 218, 238, 238, 218, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 208, 218, 218, 208, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        198, 198, 198, 198, 198, 198, 198, 198, 0, 0, 0, 0, 0, 0, 0 ,0,&
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0/)
        
   integer, dimension(160) :: rook=(/0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, &
        198, 198, 198, 198, 198, 198, 198, 198, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 208, 218, 218, 208, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 218, 238, 238, 218, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 208, 218, 218, 208, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        198, 198, 198, 198, 198, 198, 198, 198, 0, 0, 0, 0, 0, 0, 0 ,0,&
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0/)
        
   integer, dimension(160) :: knight=(/0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, &
        198, 198, 198, 198, 198, 198, 198, 198, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 208, 218, 218, 208, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 218, 238, 238, 218, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 208, 218, 218, 208, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        198, 198, 198, 198, 198, 198, 198, 198, 0, 0, 0, 0, 0, 0, 0 ,0,&
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0/)     
   
   integer, dimension(160) :: bishop=(/0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, &
        198, 198, 198, 198, 198, 198, 198, 198, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 208, 218, 218, 208, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 218, 238, 238, 218, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 208, 218, 218, 208, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        198, 198, 198, 198, 198, 198, 198, 198, 0, 0, 0, 0, 0, 0, 0 ,0,&
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0/)
   
   integer, dimension(160) :: queen=(/0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, &
        198, 198, 198, 198, 198, 198, 198, 198, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 208, 218, 218, 208, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 218, 238, 238, 218, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 208, 218, 218, 208, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        198, 198, 198, 198, 198, 198, 198, 198, 0, 0, 0, 0, 0, 0, 0 ,0,&
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0/)
        
        
   integer, dimension(160) :: king=(/0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, &
        198, 198, 198, 198, 198, 198, 198, 198, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 208, 218, 218, 208, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 218, 238, 238, 218, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 208, 218, 218, 208, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        178, 198, 198, 198, 198, 198, 198, 178, 0, 0, 0, 0, 0, 0, 0 ,0,&
        198, 198, 198, 198, 198, 198, 198, 198, 0, 0, 0, 0, 0, 0, 0 ,0,&
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0/)
   
   
   contains

      ! Function that shows the board on screen

      function show()

         integer :: i=0,j=0,k=0,show

         do i=17,144,16

            if (i.eq.17) write(*,"(A)") " ###################"

            do j=0,7
               k=i+j
               if (j.eq.0) write(*,"(A)",advance="NO") " #"
               write(*,"(A)",advance="NO") " "//bitboard(k:k)
               if (j.eq.7) write(*,"(A)") " #"
            end do
      
            if (i.GT.128) write(*,"(A)") " ##a#b#c#d#e#f#g#h##"

         end do
         show=0
      end function show
      
      !Function to check if a move is legal
      
      function checklegality(casin,casout,tratto)
         integer :: checklegality,casin,casout,tratto,i,j,z
         integer :: destra,sinistra,sopra,sotto,diagonalru,diagonalrd,diagonallu,diagonalld
         
        checklegality=0
        ! Direzioni possibili
        destra=casin+1
        sinistra=casin-1
        sopra=casin-16
        sotto=casin+16
        diagonalru=casin-17
        diagonalrd=casin+17
        diagonallu=casin-15
        diagonalld=casin+15
        
        !Out of board?
        if (bitboard(casout:casout).eq."1") then 
        checklegality=1 
        goto 4242
        
        !Moves nothing?
        else if (bitboard(casin:casin).eq."-" .or. bitboard(casin:casin).eq."1") then
        checklegality=1 
        goto 4242
        
        !Moves wrong piece?
        else if (tratto.eq.0 .and. (bitboard(casin:casin).eq."p"&
        .or. bitboard(casin:casin).eq."n"&
        .or. bitboard(casin:casin).eq."r"&
        .or. bitboard(casin:casin).eq."b"&
        .or. bitboard(casin:casin).eq."q"&
        .or. bitboard(casin:casin).eq."k")) then 
        checklegality=1 
        goto 4242
        
        else if (tratto.eq.1 .and. (bitboard(casin:casin).eq."P"&
        .or. bitboard(casin:casin).eq."N"&
        .or. bitboard(casin:casin).eq."R"&
        .or. bitboard(casin:casin).eq."B"&
        .or. bitboard(casin:casin).eq."Q"&
        .or. bitboard(casin:casin).eq."K")) then 
        checklegality=1 
        goto 4242
        
        !Eats a piece of same side?
        else if (tratto.eq.1 .and. (bitboard(casout:casout).eq."p"&
        .or. bitboard(casout:casout).eq."n"&
        .or. bitboard(casout:casout).eq."r"&
        .or. bitboard(casout:casout).eq."b"&
        .or. bitboard(casout:casout).eq."q"&
        .or. bitboard(casout:casout).eq."k")) then 
        checklegality=1 
        goto 4242
        
        else if (tratto.eq.0 &
        .and. (bitboard(casout:casout).eq."P"&
        .or. bitboard(casout:casout).eq."R"&
        .or. bitboard(casout:casout).eq."N"&
        .or. bitboard(casout:casout).eq."B"&
        .or. bitboard(casout:casout).eq."Q"&
        .or. bitboard(casout:casout).eq."K")) then 
        checklegality=1 
        goto 4242
        
        
        else
        
        !Per i pezzi neri
        if (tratto.eq.1) then
        
            !pedoni   ------------------------------------------
            if(bitboard(casin:casin).eq."p") then
                     
                     if ((casout.eq.sotto) .and. (bitboard(casout:casout).eq."-")) then
                         checklegality=0
                     else if ((casout.eq. sotto+16 ) .and. (bitboard(casout:casout).eq."-") .and. &
                     (bitboard((casout-16):(casout-16)).eq."-") .and. (casin.le.48)) then
                         checklegality=0
                     else if ((casout.eq.diagonalld) .and. (bitboard(casout:casout).ne."-")) then
                         checklegality=0
                     else if ((casout.eq.diagonalrd) .and. (bitboard(casout:casout).ne."-")) then
                         checklegality=0
                     else
                         checklegality=1 
                         goto 4242
                     end if
              
            !Cavalli    -----------------------------------------   
            else if(bitboard(casin:casin).eq."n") then
                     if ((casout.eq. casin-16-15)) then
                         checklegality=0
                     else if ((casout.eq. casin-16-17)) then
                         checklegality=0
                     else if ((casout.eq. casin-16-15)) then
                         checklegality=0
                     else if ((casout.eq. casin+16+15)) then
                         checklegality=0
                     else if ((casout.eq. casin+16+17)) then
                         checklegality=0  
                     else if ((casout.eq. casin+2+16)) then
                         checklegality=0 
                     else if ((casout.eq. casin+2-16)) then
                         checklegality=0
                     else if ((casout.eq. casin-2+16)) then
                         checklegality=0
                     else if ((casout.eq. casin-2-16)) then
                         checklegality=0  
                     else
                         checklegality=1 
                         goto 4242
                     end if                             
            
            !Re    -----------------------------------------   
            else if(bitboard(casin:casin).eq."k") then
                     if ((casout.eq. destra)) then
                         checklegality=0
                     else if ((casout.eq. sinistra)) then
                         checklegality=0
                     else if ((casout.eq. sopra)) then
                         checklegality=0
                     else if ((casout.eq. sotto)) then
                         checklegality=0
                     else if ((casout.eq. diagonalru)) then
                         checklegality=0  
                     else if ((casout.eq. diagonalrd)) then
                         checklegality=0 
                     else if ((casout.eq. diagonallu)) then
                         checklegality=0
                     else if ((casout.eq. diagonalld)) then
                         checklegality=0
                     else
                         checklegality=1 
                         goto 4242
                     end if 
            
            !Torri     ----------------------------------------------  
            else if(bitboard(casin:casin).eq."r") then
                     
                 
                    
                     if (casin.gt.casout .and. (casin-casout).lt.8) then 
                     z=1
                     else if (casin.lt.casout .and. (casout-casin).lt.8) then
                     z=1
                     else if (mod(casin,16).eq.mod(casout,16) .and. casin.lt.casout) then
                     z=16
                     else if (mod(casin,16).eq.mod(casout,16) .and. casin.gt.casout) then
                     z=16
                     else 
                     checklegality=1    
                     goto 4242
                     end if
                     
                     
                     if (casin.lt.casout) then
                     do i=casin+z,casout-z,z
                        if (bitboard(i:i).ne."-") then
                        checklegality=1 
                        goto 4242
                        end if
                     end do
                     
                     else if (casin.gt.casout) then
                     do i=casout+z,casin-z,z  
                        if (bitboard(i:i).ne."-") then
                        checklegality=1 
                        goto 4242
                        end if
                     end do
                     end if
                     
                     checklegality=0
            
            
            !Alfieri     ----------------------------------------------  
            else if(bitboard(casin:casin).eq."b") then
                     
                 
                    
                     if (mod(casin,17).eq.mod(casout,17) .and. casin.lt.casout) then 
                     z=17
                     else if (mod(casin,17).eq.mod(casout,17) .and. casin.gt.casout) then
                     z=17
                     else if (mod(casin,15).eq.mod(casout,15) .and. casin.lt.casout) then
                     z=15
                     else if (mod(casin,15).eq.mod(casout,15) .and. casin.gt.casout) then
                     z=15
                     else 
                     checklegality=1    
                     goto 4242
                     end if
                     

                     
                     if (casin.lt.casout) then
                     do i=casin+z,casout-z,z
                        if (bitboard(i:i).ne."-") then
                        checklegality=1 
                        goto 4242
                        end if
                     end do
                     
                     else if (casin.gt.casout) then
                     do i=casout+z,casin-z,z 
                        if (bitboard(i:i).ne."-") then
                        checklegality=1 
                        goto 4242
                        end if
                     end do
                     end if
                     
                     checklegality=0
                     
            !Regina/e    ----------------------------------------------  
            else if(bitboard(casin:casin).eq."q") then
                     
                 
                    
                     if (mod(casin,17).eq.mod(casout,17) .and. casin.lt.casout) then 
                     z=17
                     else if (mod(casin,17).eq.mod(casout,17) .and. casin.gt.casout) then
                     z=17
                     else if (mod(casin,15).eq.mod(casout,15) .and. casin.lt.casout) then
                     z=15
                     else if (mod(casin,15).eq.mod(casout,15) .and. casin.gt.casout) then
                     z=15
                     else if (casin.gt.casout .and. (casin-casout).lt.8) then 
                     z=1
                     else if (casin.lt.casout .and. (casout-casin).lt.8) then
                     z=1
                     else if (mod(casin,16).eq.mod(casout,16) .and. casin.lt.casout) then
                     z=16
                     else if (mod(casin,16).eq.mod(casout,16) .and. casin.gt.casout) then
                     z=16
                     else 
                     checklegality=1    
                     goto 4242
                     end if
                     
                     
                     if (casin.lt.casout) then
                     do i=casin+z,casout-z,z
                        if (bitboard(i:i).ne."-") then
                        checklegality=1 
                        goto 4242
                        end if
                     end do
                     
                     else if (casin.gt.casout) then
                     do i=casout+z,casin-z,z 
                        if (bitboard(i:i).ne."-") then
                        checklegality=1 
                        goto 4242
                        end if
                     end do
                     end if
                     
                     checklegality=0
            
            
            end if
        end if
        
        
        !stessa cosa per i pezzi bianchi
        if (tratto.eq.0) then
        
        !pedoni   ------------------------------------------
            if(bitboard(casin:casin).eq."P") then
                     
                     if ((casout.eq.sopra) .and. (bitboard(casout:casout).eq."-")) then
                         checklegality=0
                     else if ((casout.eq. sopra-16 ).and. (bitboard(casout:casout).eq."-") &
                     .and. (bitboard((casout+16):(casout+16)).eq."-") .and. (casin.ge.113)) then
                         checklegality=0
                     else if ((casout.eq.diagonallu) .and. (bitboard(casout:casout).ne."-")) then
                         checklegality=0
                     else if ((casout.eq.diagonalru) .and. (bitboard(casout:casout).ne."-")) then
                         checklegality=0
                     else
                         checklegality=1 
                         goto 4242

                     end if
              
            !Cavalli    -----------------------------------------   
            else if(bitboard(casin:casin).eq."N") then
                     if ((casout.eq. casin-16-15)) then
                         checklegality=0
                     else if ((casout.eq. casin-16-17)) then
                         checklegality=0
                     else if ((casout.eq. casin-16-15)) then
                         checklegality=0
                     else if ((casout.eq. casin+16+15)) then
                         checklegality=0
                     else if ((casout.eq. casin+16+17)) then
                         checklegality=0  
                     else if ((casout.eq. casin+2+16)) then
                         checklegality=0 
                     else if ((casout.eq. casin+2-16)) then
                         checklegality=0
                     else if ((casout.eq. casin-2+16)) then
                         checklegality=0
                     else if ((casout.eq. casin-2-16)) then
                         checklegality=0  
                     else
                         checklegality=1 
                         goto 4242

                     end if                             
            
            !Re    -----------------------------------------   
            else if(bitboard(casin:casin).eq."K") then
                     if ((casout.eq. destra)) then
                         checklegality=0
                     else if ((casout.eq. sinistra)) then
                         checklegality=0
                     else if ((casout.eq. sopra)) then
                         checklegality=0
                     else if ((casout.eq. sotto)) then
                         checklegality=0
                     else if ((casout.eq. diagonalru)) then
                         checklegality=0  
                     else if ((casout.eq. diagonalrd)) then
                         checklegality=0 
                     else if ((casout.eq. diagonallu)) then
                         checklegality=0
                     else if ((casout.eq. diagonalld)) then
                         checklegality=0
                     else
                         checklegality=1 
                         goto 4242

                     end if 
            
            !Torri     ----------------------------------------------  
            else if(bitboard(casin:casin).eq."R") then
                     
                 
                    
                     if (casin.gt.casout .and. (casin-casout).lt.8) then 
                     z=1
                     else if (casin.lt.casout .and. (casout-casin).lt.8) then
                     z=1
                     else if (mod(casin,16).eq.mod(casout,16) .and. casin.lt.casout) then
                     z=16
                     else if (mod(casin,16).eq.mod(casout,16) .and. casin.gt.casout) then
                     z=16
                     else 
                     checklegality=1    
                     goto 4242
                     end if
                     
                     
                     if (casin.lt.casout) then
                     do i=casin+z,casout-z,z
                        if (bitboard(i:i).ne."-") then
                        checklegality=1 
                        goto 4242
                        end if
                     end do
                     
                     else if (casin.gt.casout) then
                     do i=casout+z,casin-z,z  
                        if (bitboard(i:i).ne."-") then
                        checklegality=1 
                        goto 4242
                        end if
                     end do
                     end if
                     
                     checklegality=0
            
            
            !Alfieri     ----------------------------------------------  
            else if(bitboard(casin:casin).eq."B") then
                     
                 
                    
                     if (mod(casin,17).eq.mod(casout,17) .and. casin.lt.casout) then 
                     z=17
                     else if (mod(casin,17).eq.mod(casout,17) .and. casin.gt.casout) then
                     z=17
                     else if (mod(casin,15).eq.mod(casout,15) .and. casin.lt.casout) then
                     z=15
                     else if (mod(casin,15).eq.mod(casout,15) .and. casin.gt.casout) then
                     z=15
                     else 
                     checklegality=1    
                     goto 4242
                     end if
                     

                     
                     if (casin.lt.casout) then
                     do i=casin+z,casout-z,z
                        if (bitboard(i:i).ne."-") then
                        checklegality=1 
                        goto 4242
                        end if
                     end do
                     
                     else if (casin.gt.casout) then
                     do i=casout+z,casin-z,z 
                        if (bitboard(i:i).ne."-") then
                        checklegality=1 
                        goto 4242
                        end if
                     end do
                     end if
                     
                     checklegality=0
                     
            !Regina/e    ----------------------------------------------  
            else if(bitboard(casin:casin).eq."Q") then
                     
                 
                    
                     if (mod(casin,17).eq.mod(casout,17) .and. casin.lt.casout) then 
                     z=17
                     else if (mod(casin,17).eq.mod(casout,17) .and. casin.gt.casout) then
                     z=17
                     else if (mod(casin,15).eq.mod(casout,15) .and. casin.lt.casout) then
                     z=15
                     else if (mod(casin,15).eq.mod(casout,15) .and. casin.gt.casout) then
                     z=15
                     else if (casin.gt.casout .and. (casin-casout).lt.8) then 
                     z=1
                     else if (casin.lt.casout .and. (casout-casin).lt.8) then
                     z=1
                     else if (mod(casin,16).eq.mod(casout,16) .and. casin.lt.casout) then
                     z=16
                     else if (mod(casin,16).eq.mod(casout,16) .and. casin.gt.casout) then
                     z=16
                     else 
                     checklegality=1    
                     goto 4242
                     end if
                     
                     
                     if (casin.lt.casout) then
                     do i=casin+z,casout-z,z
                        if (bitboard(i:i).ne."-") then
                        checklegality=1 
                        goto 4242
                        end if
                     end do
                     
                     else if (casin.gt.casout) then
                     do i=casout+z,casin-z,z 
                        if (bitboard(i:i).ne."-") then
                        checklegality=1 
                        goto 4242
                        end if
                     end do
                     end if
                     
                     checklegality=0
            
            
            end if
        
        end if
                    
        end if 
        
        checklegality=0
                  
4242  end function checklegality

     ! Function to understand notation and move a piece
     
     function notationToCaseIn(stringa)
     
              character (len=4) :: stringa
              character (len=2) :: strin,strout
              integer :: casin, casout, h, tempin,tempout, tampin,tampout,notationmove,errore,tratto,notationToCaseIn
              
              strin=stringa(1:2)
              
              read(strin(2:2),*) tempin
              
              if (strin(1:1).eq."a") tampin=145
              if (strin(1:1).eq."b") tampin=146
              if (strin(1:1).eq."c") tampin=147
              if (strin(1:1).eq."d") tampin=148
              if (strin(1:1).eq."e") tampin=149
              if (strin(1:1).eq."f") tampin=150
              if (strin(1:1).eq."g") tampin=151
              if (strin(1:1).eq."h") tampin=152
              
              
              ! Finalmente trasformo le coordinate in numeri per la mia rappresentazione sulla bitboard
              notationToCaseIn=tampin-tempin*16
              
     
     end function notationToCaseIn
     
     function notationToCaseOut(stringa)
              
              character (len=4) :: stringa
              character (len=2) :: strin,strout
              integer :: casin, casout, h, tempin,tempout, tampin,tampout,notationmove,errore,tratto,notationToCaseOut
              
              strout=stringa(3:4)
              
              read(strout(2:2),*) tempout
              
              if (strout(1:1).eq."a") tampout=145
              if (strout(1:1).eq."b") tampout=146
              if (strout(1:1).eq."c") tampout=147
              if (strout(1:1).eq."d") tampout=148
              if (strout(1:1).eq."e") tampout=149
              if (strout(1:1).eq."f") tampout=150
              if (strout(1:1).eq."g") tampout=151
              if (strout(1:1).eq."h") tampout=152
              
              ! Finalmente trasformo le coordinate in numeri per la mia rappresentazione sulla bitboard
              
              notationToCaseOut=tampout-tempout*16
     
     end function notationToCaseOut
     
     function caseToNotation(casin,casout)
     
         character (len=4) :: caseToNotation
         character (len=2) :: strin,strout
         integer :: casin, casout, h, tempin,tempout, tampin,tampout,notationmove,errore,tratto
     
     
         if (mod(casin,16).eq.1) caseToNotation(1:1)="a"
         if (mod(casin,16).eq.2) caseToNotation(1:1)="b"
         if (mod(casin,16).eq.3) caseToNotation(1:1)="c"
         if (mod(casin,16).eq.4) caseToNotation(1:1)="d"
         if (mod(casin,16).eq.5) caseToNotation(1:1)="e"
         if (mod(casin,16).eq.6) caseToNotation(1:1)="f"
         if (mod(casin,16).eq.7) caseToNotation(1:1)="g"
         if (mod(casin,16).eq.8) caseToNotation(1:1)="h"

         if ( ((casin-mod(casin,16))/16).eq.1) caseToNotation(2:2)="8"
         if ( ((casin-mod(casin,16))/16).eq.2) caseToNotation(2:2)="7"
         if ( ((casin-mod(casin,16))/16).eq.3) caseToNotation(2:2)="6"
         if ( ((casin-mod(casin,16))/16).eq.4) caseToNotation(2:2)="5"
         if ( ((casin-mod(casin,16))/16).eq.5) caseToNotation(2:2)="4"
         if ( ((casin-mod(casin,16))/16).eq.6) caseToNotation(2:2)="3"
         if ( ((casin-mod(casin,16))/16).eq.7) caseToNotation(2:2)="2"
         if ( ((casin-mod(casin,16))/16).eq.8) caseToNotation(2:2)="1"
         
         if (mod(casout,16).eq.1) caseToNotation(3:3)="a"
         if (mod(casout,16).eq.2) caseToNotation(3:3)="b"
         if (mod(casout,16).eq.3) caseToNotation(3:3)="c"
         if (mod(casout,16).eq.4) caseToNotation(3:3)="d"
         if (mod(casout,16).eq.5) caseToNotation(3:3)="e"
         if (mod(casout,16).eq.6) caseToNotation(3:3)="f"
         if (mod(casout,16).eq.7) caseToNotation(3:3)="g"
         if (mod(casout,16).eq.8) caseToNotation(3:3)="h"

         if ( ((casout-mod(casout,16))/16).eq.1) caseToNotation(4:4)="8"
         if ( ((casout-mod(casout,16))/16).eq.2) caseToNotation(4:4)="7"
         if ( ((casout-mod(casout,16))/16).eq.3) caseToNotation(4:4)="6"
         if ( ((casout-mod(casout,16))/16).eq.4) caseToNotation(4:4)="5"
         if ( ((casout-mod(casout,16))/16).eq.5) caseToNotation(4:4)="4"
         if ( ((casout-mod(casout,16))/16).eq.6) caseToNotation(4:4)="3"
         if ( ((casout-mod(casout,16))/16).eq.7) caseToNotation(4:4)="2"
         if ( ((casout-mod(casout,16))/16).eq.8) caseToNotation(4:4)="1"
         
     
     end function caseToNotation
     
     function notationmove(stringa,tratto)
              character (len=4) :: stringa
              character (len=2) :: strin,strout
              character (len=1) :: temp
              character(len=160) :: bitboardtemp
              integer :: casin, casout, h, tempin,tempout, tampin,tampout,notationmove,errore,tratto
              strin=stringa(1:2)
              strout=stringa(3:4)
              read(strin(2:2),*) tempin
              read(strout(2:2),*) tempout
              if (strin(1:1).eq."a") tampin=145
              if (strin(1:1).eq."b") tampin=146
              if (strin(1:1).eq."c") tampin=147
              if (strin(1:1).eq."d") tampin=148
              if (strin(1:1).eq."e") tampin=149
              if (strin(1:1).eq."f") tampin=150
              if (strin(1:1).eq."g") tampin=151
              if (strin(1:1).eq."h") tampin=152
              if (strout(1:1).eq."a") tampout=145
              if (strout(1:1).eq."b") tampout=146
              if (strout(1:1).eq."c") tampout=147
              if (strout(1:1).eq."d") tampout=148
              if (strout(1:1).eq."e") tampout=149
              if (strout(1:1).eq."f") tampout=150
              if (strout(1:1).eq."g") tampout=151
              if (strout(1:1).eq."h") tampout=152
              
              ! Finalmente trasformo le coordinate in numeri per la mia rappresentazione sulla bitboard
              casin=tampin-tempin*16
              casout=tampout-tempout*16
              ! Controllo se la mossa è legale
              errore=checklegality(casin,casout,tratto)      
              if(errore.eq.1) then
              write(*,*) "Illegal Move" 
                 notationmove=1   
                 goto 88
              end if 
                
              
      
              bitboardtemp=bitboard
               
               
                 temp(1:1)=bitboard(casin:casin)
                 bitboard(casin:casin)="-"
                 bitboard(casout:casout)=temp(1:1)
                 notationmove=0
              
              errore=ischeck(casin,casout,tratto)   
              if(errore .eq. 1) then
                 write(*,*) "Check" 
                 notationmove=1   
                 bitboard=bitboardtemp
                 goto 88
              end if
              
              
              
88   write(*,*)                          
     end function notationmove     
      
      
      !Function to check if the move take the king in check        
      function ischeck(casin,casout,tratto)
      
      Integer :: isking,pll,plll,caseking,ischeck,casin,casout,tratto
      
      
      
         !I consider the king as a piece and see if it can eat a piece the same as it
         if (tratto.eq.1) then
                     do pll=1,160
                         if(bitboard(pll:pll).eq."k") caseking=pll
                     end do  
          
         do plll=1,160
         if (checklegality(plll,caseking,0).ne.1) then
             ischeck=1

             goto 3131
         else
             ischeck=0
         end if
         end do
         
         
         else if (tratto.eq.0) then
                     do pll=1,160
                         if(bitboard(pll:pll).eq."K") caseking=pll
                     end do  
          
         do plll=1,160
         if (checklegality(plll,caseking,1).ne.1) then
             ischeck=1
             
             goto 3131
         else
             ischeck=0
         end if
         end do           
                
         end if

        ischeck=0
        
3131    end function ischeck
      
      function movegen(casin,tratto) result (movelist)
      
         integer :: movelist(145)
         integer :: casin,casout,tratto,i,j
         character (len=1) :: temp
         character(len=160) :: bitboardtemp
        
        movelist=-1
        i=1
        casout=1

        do casout=1,160
           if (checklegality(casin,casout,tratto).eq.0 ) then
           
           bitboardtemp=bitboard
               
               
                 temp(1:1)=bitboard(casin:casin)
                 bitboard(casin:casin)="-"
                 bitboard(casout:casout)=temp(1:1)
           
           if (ischeck(casin,casout,tratto).eq.0) then
           
              movelist(i)=casout
              i=i+1
              
           end if
           
           bitboard=bitboardtemp
           
           end if
        
        end do

         
      end function movegen

      function evaluate(casin,casout,tratto,move) result (eval)
       
       integer :: tratto, eval, casin, casout,i,move,checkmate=9999999, h, k, trotto
       character (len=1) :: temp
       character(len=160) :: bitboardtemp
       integer :: movelist(145)
      
      k=0
      eval=0
      i=0
      h=0
      trotto=tratto
      ! Move=1 c'è da muovere, move=0 è una valutazione statica
      bitboardtemp=bitboard
      
      
      
      if (move.eq.1) then
               
                 temp(1:1)=bitboard(casin:casin)
                 bitboard(casin:casin)="-"
                 bitboard(casout:casout)=temp(1:1)
      end if
      

         do i=1,160
               if(bitboard(i:i).eq."k") eval=eval
               if(bitboard(i:i).eq."p") eval=eval-101
               if(bitboard(i:i).eq."r") eval=eval-500
               if(bitboard(i:i).eq."b") eval=eval-300
               if(bitboard(i:i).eq."n") eval=eval-300
               if(bitboard(i:i).eq."q") eval=eval-900
               if(bitboard(i:i).eq."K") eval=eval
               if(bitboard(i:i).eq."P") eval=eval+101
               if(bitboard(i:i).eq."R") eval=eval+500
               if(bitboard(i:i).eq."B") eval=eval+300
               if(bitboard(i:i).eq."N") eval=eval+300
               if(bitboard(i:i).eq."Q") eval=eval+900
          end do

      

      
      bitboard=bitboardtemp
      
      end function evaluate
      
      recursive function negamax(alpha,beta,depth,tratto) result (roba)
      
      integer :: alpha, beta, depth, best, valore, trotto, alphat, betat,deptht,roba
      character (len=4) :: stringa
      character (len=2) :: strin,strout
      character (len=1) :: temp
      character(len=160) :: bitboardtemp
      integer :: movelisto(145)
      integer :: casin, casout, teratto, h, io, j, k, tempin,tempout, tampin,tampout,notationmove,errore,tratto
      
         alphat=alpha
         betat=beta
         casin=17
         casout=17
         trotto=tratto
         valore=0
         roba=0
         deptht=depth
      
         if (deptht.eq.0) then
         if(trotto.eq.1) teratto=-1
         if(trotto.eq.0) teratto=1
         roba=(evaluate(42,42,trotto,0)+101)*teratto
         return
         end if
         
         

         do h=1,160
            k=0
            movelisto=movegen(h,tratto)
                 do io=1,145
                    if (movelisto(io).eq.-1) exit
                    k=k+1
                 end do
            
            do j=1,k
                 bitboardtemp=bitboard
                 

                 temp(1:1)=bitboard(h:h)
                 bitboard(h:h)="-"
                 bitboard(movelisto(j):movelisto(j))=temp(1:1)

                 if (tratto.eq.1) trotto=0
                 if (tratto.eq.0) trotto=1
                 
                 valore =-negamax(-betat,-alphat,deptht-1,trotto)
                 bitboard=bitboardtemp
                 if (valore .ge. betat) then
                 roba=betat
                 
                 return
                 end if
                 if (valore .gt. alphat) then
                 alphat = valore
                 casin = h
                 casout = movelisto(j)
  
                 end if
            end do
        
        end do 

      roba=alphat
      bestmove=caseToNotation(casin,casout)


      end function negamax

end module bitboards

! Main vero e proprio

Program ClumsyPigeon

use bitboards

IMPLICIT NONE
 integer :: i,j,k,res,movin,movout,errore,tratto,score,bau
 integer :: movelist(145)
 character (len=4) :: stringa
 character (len=100):: input

  read (*,*) input

if (input .eq. "human") then

! Tratto = 0 -> Mossa a bianco  Tratto = 1 -> Mossa al nero
   tratto=0
   res=show()
   if(res.ne.0) write (*,*) "Can't visualize the board"
   write(*,*)

   
   ! Chiede input mosse
   
   do while (stringa.ne."exit")
10    if (tratto.eq.0) write(*,"(A)",advance="NO") "White Move> "
      if (tratto.eq.1) write(*,"(A)",advance="NO") "Black Move> "

!     Show all possible moves
!
!    do movin=1,160
!           movelist=movegen(movin,tratto)
!           do j=1,145
!             if (movelist(j).ne.-1) write(*,"(A,A)",advance="NO") caseToNotation(movin,movelist(j))," "
!           end do
!        end do



     read (*,*) stringa
    
    
     if (stringa.ne."exit") then 

        res=notationmove(stringa,tratto)
        if (res.eq.1) goto 10
        res=show()
        
        tratto=tratto+1
        if (tratto.eq.2) tratto=0
        
34      bau=negamax(-1000000,+1000000,5,tratto)

        write(*,*) "La mia mossa, signore: ", bestmove
        res=notationmove(bestmove,tratto)
        if (res.eq.1) write(*,*) "Scacco Matto!"
        write(*,"(A,I7)") "Punteggio attuale: ", evaluate(0,0,tratto,0)
        res=show()

        tratto=tratto+1
        if (tratto.eq.2) tratto=0
        
        
        write(*,*)

       
     end if
   end do
   
else if (input .eq. "uci") then

  write(*,*) "id Clumsy Pigeon"
  write(*,*) "author Daniele Scarinci"
  write(*,*) "uciok"

  do while(input.ne."exit")

  read(*,*) input
  
  if (input.eq."isready") write (*,*) "readyok"
  
  if (input.eq."ucinewgame") write(*,*) "isready"
  
  if (input.eq."go depth 5") then
  
  tratto=tratto+1
        if (tratto.eq.2) tratto=0
  
349  bau=negamax(-1000000,+1000000,5,tratto)
   
        res=notationmove(bestmove,tratto)
        if (res.eq.1) goto 349
        res=show()
        tratto=tratto+1
        if (tratto.eq.2) tratto=0
  else 
  
  write(*,*) "readyok"
  end if
    
   

  end do
end if   
   
   
end program ClumsyPigeon
