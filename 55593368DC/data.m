% data for 18 bus Test case
disp('18 bus sample')
%(bus#)( ang  )(bus type)
bus=[
   1      0.0000    1;
   2      0.0000    2;
   3      0.0000    1;
   4      0.0000    1;
   5      0.0000    2;
   6      0.0000    1;
   7      0.0000    1;
   8      0.0000    1;
   9      0.0000    1 ;
  10      0.0000    2;
  11      0.0000    1;
  12      0.0000    1;
  13      0.0000    1;
  14      0.0000    2;
  15      0.0000    1;
  16      0.0000    2;
  17      0.0000    1;
  18      0.0000    3];

%Load ID    PL
load=[
     1    550.000;
     2    840.000;
     3    1540.000;
     4    380.000;
     5    6390.000;
     6    1990.000;
     7    2130.000;
     8    880.000;
     9    2590.000;
     10   940.000;
     11   7000.000;
     12   1900.000;
     13   1100.000;
     14   320.000;
     15   2000.000;
     16   1320.000;
     17   4000.000];
 
%Generator  ID    PG
 generator=[
     2     3600.000;
     5     7600.000; 
     10    7500.00; 
     11    5400.000; 
     14    6000.000; 
     16    4950.000; 
     18    0.000   ]; 

%      b#1 b#2 (name)    (x)    (Capacity) (longth)
line = [
       1   2    1    0.0176    2300.00      70.00;  
       2   3    2    0.0348    2300.00      138.00;  
       3   4    1    0.0404    2300.00      155.00;  
       3   7    1    0.0325    2300.00      129.00;        
       5   6    1    0.0276    2300.00      106.00;          
       6   7    2    0.0126    2300.00      50.00;             
       7   8    1    0.0141    2300.00      60.00;  
       8   9    1    0.0102    2300.00      40.00;   
       9   10   1    0.0501    2300.00      200.00;
       1   11   1    0.0102    2300.00      40.00;  
       5   11   1    0.0153    2300.00      60.00;  
       6   14   1    0.0554    2300.00      220.00;  
       6   14   2    0.0554    2300.00      220.00;      
       7   8    2    0.0141    2300.00      60.00;
       7   9    1    0.0318    2300.00      126.00;   
       7   13   1    0.0126    2300.00      50.00; 
       8   9    2    0.0102    2300.00      40.00;
       9   10   2    0.0501    2300.00      200.00;
       9   10   3    0.0501    2300.00      200.00;
       9   16   1    0.0501    2300.00      200.00;
      11   12   1    0.0126    2300.00      50.00;
      14   15   1    0.0428    2300.00      170.00;  
      16   17   1    0.0153    2300.00      60.00;          
      17   18   1    0.0140    2300.00      55.00      
];