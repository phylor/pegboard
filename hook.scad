// preview[view:south east, tilt:top]

include <pegboard_configuration.scad>;
include <anchors.scad>;

module FrontHook() {
    cube([2,15,hd]);
    translate([-hd,15-2,0])
        cube([5,2,hd]);
}

module PegBoardHook() {
   
        union() {
            PegBoardAnchor();
            
                    
        // The shank of the hook
        cube([plateLength,plateThickness,hd]);
            
            translate([plateLength-2,0,0])
                FrontHook();
        }
}


PegBoardHook();

