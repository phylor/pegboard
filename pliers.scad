include <pegboard_configuration.scad>;
include <anchors.scad>;

spacingBetweenHoles = 3;
holeWidth = 15;
holeDepth = 30;
numberOfHoles = 5;

plateWidth = numberOfHoles * holeWidth + (numberOfHoles-1) * spacingBetweenHoles;
plateHeight = 10;
plateDepth = holeDepth + 2 * spacingBetweenHoles;

width = 3*30+hd;

difference() {
    // Base plate
    translate([0,-plateDepth,0])
        cube([width, plateDepth, plateHeight]);
    
    for(offset =[0:holeWidth+spacingBetweenHoles:width-holeWidth]) {
        translate([spacingBetweenHoles+offset,-holeDepth-spacingBetweenHoles,-plateHeight/2])
            color([1,0,0]) cube([holeWidth, holeDepth, 2 * plateHeight]);
    }
}

cube([width, plateThickness, hs+hd]);

for(offset =[0:30:90]) {
    translate([hd+offset,plateThickness,plateLength])
        rotate([0,90,180])
            PegBoardAnchor();
}