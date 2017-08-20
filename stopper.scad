include <pegboard_configuration.scad>;
include <anchors.scad>;


// Variables to configure:
width = 49;
depth = 21;
// End configuration

requiredPegs = ceil((width-hd) / hs + 1);
actualWidth = (requiredPegs-1) * hs + hd;
plateHeight = hs+hd;

translate([0,-depth,0])
    cube([actualWidth, depth, plateThickness]);

// Back wall
cube([actualWidth, plateThickness, hs+hd]);

// Anchors
rightPeg = (requiredPegs-1)*hs;
for(offset =[0:rightPeg:rightPeg]) {
    translate([hd+offset,plateThickness,plateLength])
        rotate([0,90,180])
            PegBoardAnchor();
}