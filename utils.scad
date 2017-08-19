module bentZylinder(angle, thickness, outerRadius) {
        // torus
        rotate_extrude(angle=angle, convexity=10)
            translate([outerRadius,0,0])
                circle(thickness, center=true);
}