include <utils.scad>;

module PegBoardAnchor() {
    plateThickness = 2;
    
    union() {
        translate([hd,0,hr])
            upperPegboardAnchor();

        // Lower pegboard anchor to wall
        translate([hs+hd,0,hr])
            rotate([0,-90,90])
                cylinder(h=min(distanceToWall/2+pbt, 10), r=hr);

    }
}

module upperPegboardAnchor() {
            rotate([90,0,0])
                cylinder(h=pbt, r=hr);
        
        
        translate([-hr,-pbt,0])
            union() {
        translate([0,0,0])
            rotate([0,0,-70])
                bentZylinder(70, hr, hr);
    
    radius = hr;
    
    angleCorrectionY = sin(70) * radius;
    angleCorrectionX = sqrt(pow(radius,2) - pow(angleCorrectionY,2));
    
    
    translate([angleCorrectionX,-angleCorrectionY,0])
        rotate([0,0,20])
        translate([-hd/2,0,0])
        rotate([0,90,0])
            cylinder(r=hr, h=hd, center=true);
            }
}