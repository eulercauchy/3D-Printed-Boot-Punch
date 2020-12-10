clampwidth = 23.4;
clampthick = 4;

difference(){
	shell();
	translate([0,14.05,21.1])holes();
}

module shell(){
	intersection(){
		color("Purple") RoundCube(40,40,50,1);
		difference(){
			translate([0,0,50])intersector();
			body();
		}
	}
}

module body(){
    color("Blue") sphere(17);
}

module intersector() {
    color("Red") RoundCube(40.1,40.1,100,1);
}

module holes() {
    difference(){
        color("Green") RoundCube(23.4,50,8.2,.5);
        translate([clampwidth/2-1,0,clampthick/2+.4])color("Blue") RoundCube(5,53,4,1);
        translate([-clampwidth/2+1,0,clampthick/2+.4])color("Green") RoundCube(5,53,4,1);
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

