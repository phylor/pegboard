include <pegboard_configuration.scad>;
include <anchors.scad>;

// Variables to configure:
spacingBetweenHoles = 2;
holeDepth = 30;
holeWidth = 30;
// End configuration

plateHeight = hs+hd;
plateDepth = holeDepth + 2 * spacingBetweenHoles;

requiredWidth = holeWidth + 2 * spacingBetweenHoles;
requiredPegs = ceil((requiredWidth-hd) / hs + 1);

width = (requiredPegs-1)*hs+hd;

echo(width=width, depth=plateDepth, pegs=requiredPegs);

translate([0,-plateDepth,0])
difference() {
    // Base plate
    cube([width, plateDepth, plateHeight]);
    
    // cutout
    translate([plateThickness, plateThickness, -plateHeight/2])
    color([1,0,0])
        cube([width-2*plateThickness, plateDepth-2*plateThickness, 2*plateHeight]);
}

// Back wall
cube([width, plateThickness, hs+hd]);

rightPeg = (requiredPegs-1)*hs;
for(offset =[0:rightPeg:rightPeg]) {
    translate([hd+offset,plateThickness,plateLength])
        rotate([0,90,180])
            PegBoardAnchor();
}