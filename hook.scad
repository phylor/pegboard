// preview[view:south east, tilt:top]

include <anchors.scad>;

// Circle/Sphere resolution
$fn = 40;

// millimeters - The peg board thickness
pbt = 1;

// millimeters - The hole spacing
hs = 15;

// millimeters - The hole diameter
hd = 5 - 1;

// millimeters - The hole radius, half the diameter.
hr = hd/2;

distanceToWall = 12;

plateLength = hs+hd+hr;

module bentZylinder(angle, thickness, outerRadius) {
        // torus
        rotate_extrude(angle=angle, convexity=10)
            translate([outerRadius,0,0])
                circle(thickness, center=true);
}

module FrontHook() {
    cube([2,15,hd]);
    translate([-hd,15-2,0])
        cube([5,2,hd]);
}

module PegBoardHook() {
   
        union() {
            PegBoardAnchor();
            
            translate([plateLength-2,0,0])
                FrontHook();
        }
}


PegBoardHook();

