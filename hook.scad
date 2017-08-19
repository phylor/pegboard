// preview[view:south east, tilt:top]

// degrees - This angles the point from straight out to straight up.
BendAngle = 90; //[0:90]

// millimeters - This defines the radius of the bend from the shank (the wall) to the point.
BendRadius = 10; //[0:100]

// millimeters - Not a true gape (gap), this is the distance from the shank (the wall) to the bend in the hook.
Gape = 10; //[0:100]

// millimeters - The throat (bite) is the measure in millimeters from the lowest point in the gape(gap)to the height of the point.
Throat = 10; //[0:100]

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

module PegBoardAnchor() {
    plateThickness = 2;
    
    union() {
        // Upper pegboard anchor to wall
        /*translate([hd-min(distanceToWall,10-hr),0,hr])
            rotate([0,180,180])
                //difference() {
                    // torus
                    rotate_extrude(angle=80, convexity=10)
                        translate([min(distanceToWall,10-hr),0,0])
                        circle(hr, center=true);
                    
                    //translate([hr,0,0])
                    //    cube(hr);
                //}
        */
    
        translate([hd,0,hr])
            upperPegboardAnchor();
        
        // The shank of the hook
        cube([plateLength,plateThickness,hd]);

        // Lower pegboard anchor to wall
        translate([hs+hd,0,hr])
            rotate([0,-90,90])
                cylinder(h=min(distanceToWall/2+pbt, 10), r=hr);

    }
}

module FrontHook() {
    cube([2,15,hd]);
    translate([-hd,15-2,0])
        cube([5,2,hd]);
}

module PegBoardHook(gape, throat, bendRadius, bendAngle, center=false) {
    pbaX = hs+pbt+hd+hr+hr/2;
    pbaY = pbt+hd+hr;
    
    partX = pbaX + max(pbaX,throat+hd+hr/2) - pbaX;
    partY = pbaY + gape + hd;
    
    offsetX = center ? (-partX/2 - (throat > pbaX ? pbaX-throat-hd-hr/2 : 0)) : 0;
    offsetY = center ? (-partY/2) : 0;
        
    //translate([offsetX,offsetY,0])
        union() {
            PegBoardAnchor();
            
            translate([plateLength-2,0,0])
                FrontHook();
        }
}


/*pegHoleDiameterInMillimeters = 5;
pegHoleRadius = (pegHoleDiameterInMillimeters - 1) / 2;
pegBoardDistanceToWallInMillimeters = 13;
hiddenHolderLength = pegBoardDistanceToWallInMillimeters / 2;


cylinder(h=hiddenHolderLength, radius=pegHoleRadius);
*/
//render()
    PegBoardHook(Gape, Throat, BendRadius, BendAngle, true);

