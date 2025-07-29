/* [Open Luggage Params:] */
// Overall footprint size
moduleSize = 200; // [50:350]
// Height of the walls
wallHeight = 20; // [5:300]
// Thickness of the base
baseThinkness = 5; // [1:10]
// Thickness of the walls
wallThinkness = 5; // [1:10]
// Size of corner cutout
cornerSize = 50; // [10:100]

module corner() {
    union() {
        linear_extrude(height=baseThinkness)
            polygon(
                points=[
                    [0,cornerSize],
                    [cornerSize,0],
                    [moduleSize ,0],
                    [moduleSize,moduleSize],
                    [cornerSize,moduleSize],
                    [0,moduleSize]
                ]
            );
            translate([0, 0, baseThinkness])
        linear_extrude(height=wallHeight)
            polygon(
                points=[
                    [0,cornerSize],
                    [cornerSize,0],
                    [moduleSize ,0],
                    [moduleSize,wallThinkness], 
                    [cornerSize + (wallThinkness/2), wallThinkness],
                    [wallThinkness, cornerSize + (wallThinkness/2)],
                    [wallThinkness,moduleSize],
                    [0,moduleSize],
                    [0,cornerSize]
                ]
            );
    }
}

corner();
