module case_foot() {
    cylinder(10, 9/2, 9/2);
    //cube([30,30,40]);
    CubePoints = [
      [  5,  5,  0 ],  //0
      [ 30,  5,  0 ],  //1
      [ 30, 25,  0 ],  //2
      [  5, 25,  0 ],  //3
      [  0,  0, 40 ],  //4
      [ 30,  0, 40 ],  //5
      [ 30, 30, 40 ],  //6
      [  0, 30, 40 ]   //7
    ];
      
    CubeFaces = [
      [0,1,2,3],  // bottom
      [4,5,1,0],  // front
      [7,6,5,4],  // top
      [5,6,2,1],  // right
      [6,7,3,2],  // back
      [7,4,0,3]   // left
    ];
      
   translate([-15,-15,-40]) polyhedron( CubePoints, CubeFaces );
}

case_foot();