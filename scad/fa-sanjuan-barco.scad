/**
Model coded by @ken4rab
With licence cc-by-sa 4.0

https://creativecommons.org/licenses/by-sa/4.0/
*/

function mod(X, N)= 
    (X/N - floor(X/N))*N;    
thickness = 3*2.54;    
layers = 300;
module module_wood_bar(x, rotating_height= 0.5,
    angle = 0,
    side = 0,
    long = 300){
angle = pow(-1,side)*abs(angle);
translate([x, 0, 0])
        rotate(a = angle,     
               v=[1,0,0])
        cube(size = [thickness,thickness, long]);    
};


function angle_function(x) = (layers/2-abs(x-layers/2))/5;
//echo(concat("thickness",thickness))
//echo(concat("thickness2",thickness))

for (x = [0:1:300]){
    //echo(concat("x",x))
//    echo("power",pow(-1, mod(x,2)))
    angle = angle_function(x);
    module_wood_bar(x = x*thickness, 
    side = mod(x,2),
    rotating_height = 0.5,
    angle = angle);
}
