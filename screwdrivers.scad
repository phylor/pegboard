include <pegboard_configuration.scad>;
include <anchors.scad>;

spacingBetweenHoles = 3;
holeWidth = 13;
holeDepth = 13;
horizontalSpacingBetweenHoles = 11;

plateHeight = 10;
plateDepth = holeDepth + 2 * spacingBetweenHoles;

width = 3*30+hd;

difference() {
    // Base plate
    translate([0,-plateDepth,0])
        cube([width, plateDepth, plateHeight]);
    
    for(offset =[0:holeWidth+horizontalSpacingBetweenHoles:width-holeWidth]) {
        translate([horizontalSpacingBetweenHoles+offset,-holeDepth/2-spacingBetweenHoles,-plateHeight/2])
            color([1,0,0]) cylinder(h=2 * plateHeight, r=holeWidth/2);
    }
}

cube([width, plateThickness, hs+hd]);

for(offset =[0:30:90]) {
    translate([hd+offset,plateThickness,plateLength])
        rotate([0,90,180])
            PegBoardAnchor();
}