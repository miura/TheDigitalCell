run("Set Measurements...", "area centroid perimeter bounding redirect=None decimal=3");
run("Auto Threshold", "method=Otsu white");
run("Options...", "iterations=1 count=1 black do=Nothing");
run("Watershed");
run("Analyze Particles...", "  show=Outlines display");