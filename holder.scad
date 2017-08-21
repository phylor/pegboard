include <pegboard_configuration.scad>;
include <anchors.scad>;


// Variables to configure:
width = 34;
depth = 23;
// End configuration

requiredPegs = ceil((width-hd) / hs + 1);
actualWidth = (requiredPegs-1) * hs + hd;
plateHeight = hs+hd;

// bottom
translate([0,-depth,0])
    cube([actualWidth, depth, plateThickness]);
    
// walls
    translate([0, -depth, plateThickness])
        cube([width, plateThickness, hs+hd-plateThickness]);

// Back wall
cube([actualWidth, plateThickness, hs+hd]);

// Anchors
rightPeg = (requiredPegs-1)*hs;
for(offset =[0:rightPeg:rightPeg]) {
    translate([hd+offset,plateThickness,plateLength])
        rotate([0,90,180])
            PegBoardAnchor();
}