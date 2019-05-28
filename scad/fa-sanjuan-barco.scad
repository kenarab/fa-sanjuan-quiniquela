/**
Fuego Austral. 
Barco para Quema de San Juan

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
        translate([0, 0, -rotating_height*long])
        rotate(a = angle,     
               v=[1,0,0])
        translate([0, 0, rotating_height*long])
        cube(size = [thickness,thickness, long], center = true);    
};


function angle_function_linear(x, factor) = (layers/2-abs(x-layers/2)*.8)*factor;

function angle_function_cuadratic(x, factor) = 1/20*(pow(layers/2,2)-(pow(x-layers/2,2)))*pow(factor,2);

function angle_function (x, factor)= angle_function_cuadratic(x, factor);
for (x = [0:1:300]){
    angle = angle_function(x, factor = 1/5);
    rotating_height = angle_function(x, factor = 1/500);
//    echo(concat("angle",angle))
    
    module_wood_bar(x = x*thickness, 
    side = mod(x,2),
    rotating_height = rotating_height,
    angle = angle);
}
