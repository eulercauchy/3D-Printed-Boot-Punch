clampwidth = 23.4;
clampthick = 4;

difference(){
    spherepodium();
    translate([0,14.05,-3.6])holes();
}

module spherepodium(){
	union(){
		translate([0,0,7.5])topsphere();
		color("Yellow") RoundCube(40,40,15.1,1);
	}
}

module topsphere(){
	intersection(){
         color("Blue") sphere(15);
        translate([0,0,50])color("Red") cube(100, center=true);
    }
}

module intersector() {
    color("Red") cube(100, center=true);
}

module holes() {
    difference(){
        color("Green") RoundCube(clampwidth+1,50,8.1,1);
        translate([clampwidth/2-1,0,-clampthick/2-.4])color("Green") RoundCube(5,50,4,1);
        translate([-clampwidth/2+1,0,-clampthick/2-.4])color("Green") RoundCube(5,50,4,1);
    }
}

module RoundCube(cubelength,cubewidth,cubeheight,cuberound){
	hull(){
			translate([cubelength/2-cuberound,cubewidth/2-cuberound,-(cubeheight-cuberound)/2])cylinder(h=cubeheight-cuberound,r=cuberound);
			translate([cubelength/2-cuberound,-cubewidth/2+cuberound,-(cubeheight-cuberound)/2])cylinder(h=cubeheight-cuberound,r=cuberound);
			translate([-cubelength/2+cuberound,cubewidth/2-cuberound,-(cubeheight-cuberound)/2])cylinder(h=cubeheight-cuberound,r=cuberound);
			translate([-cubelength/2+cuberound,-cubewidth/2+cuberound,-(cubeheight-cuberound)/2])cylinder(h=cubeheight-cuberound,r=cuberound);
			rotate([0,90,90]){
			translate([cubeheight/2-cuberound,cubelength/2-cuberound,-(cubewidth-cuberound)/2])cylinder(h=cubewidth-cuberound,r=cuberound);
			translate([cubeheight/2-cuberound,-cubelength/2+cuberound,-(cubewidth-cuberound)/2])cylinder(h=cubewidth-cuberound,r=cuberound);
			translate([-cubeheight/2+cuberound,cubelength/2-cuberound,-(cubewidth-cuberound)/2])cylinder(h=cubewidth-cuberound,r=cuberound);
			translate([-cubeheight/2+cuberound,-cubelength/2+cuberound,-(cubewidth-cuberound)/2])cylinder(h=cubewidth-cuberound,r=cuberound);
			}
			rotate([90,0,90]){
			translate([cubewidth/2-cuberound,cubeheight/2-cuberound,-(cubelength-cuberound)/2])cylinder(h=cubelength-cuberound,r=cuberound);
			translate([cubewidth/2-cuberound,-cubeheight/2+cuberound,-(cubelength-cuberound)/2])cylinder(h=cubelength-cuberound,r=cuberound);
			translate([-cubewidth/2+cuberound,cubeheight/2-cuberound,-(cubelength-cuberound)/2])cylinder(h=cubelength-cuberound,r=cuberound);
			translate([-cubewidth/2+cuberound,-cubeheight/2+cuberound,-(cubelength-cuberound)/2])cylinder(h=cubelength-cuberound,r=cuberound);
			}
	}
}