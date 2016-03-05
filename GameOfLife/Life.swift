


import Foundation


class Life {
    
    var world = [[Int]]()
    
    
    init(){
        for _ in 0..<102 {
            var col = [Int]()
            for _ in 0..<102{
                col.append(0)
            }
            self.world.append(col)
        }
    }
    
    func livedPeople(){
        for _ in 0..<1000{
            world[Int(arc4random_uniform(100))][Int(arc4random_uniform(100))] = 1
        }
        for i in 0..<102{
            world[i][0] = 0
            world[i][101] = 0
        }
        for j in 1..<101{
            world[0][j] = 0
            world[101][j] = 0
        }
    }
    
    
    
    
    
    func checkLife(i:Int,j:Int){
        
        var livedPeople = 0
        
        if world[i][j] == 0 {
            
            if world[i-1][j] == 1{
                livedPeople++
            }
            if world[i][j-1] == 1{
                livedPeople++
            }
            if world[i-1][j-1] == 1{
                livedPeople++
            }
            if world[i+1][j] == 1{
                livedPeople++
            }
            if world[i][j+1] == 1{
                livedPeople++
            }
            if world[i+1][j+1] == 1{
                livedPeople++
            }
            if world[i-1][j+1] == 1{
                livedPeople++
            }
            if world[i+1][j-1] == 1{
                livedPeople++
            }
            
            if livedPeople == 3 {
                world[i][j] = 1
            }
        } else if world[i][j] == 1{
            
            if world[i-1][j] == 1{
                livedPeople++
            }
            if world[i][j-1] == 1{
                livedPeople++
            }
            if world[i-1][j-1] == 1{
                livedPeople++
            }
            if world[i+1][j] == 1{
                livedPeople++
            }
            if world[i][j+1] == 1{
                livedPeople++
            }
            if world[i+1][j+1] == 1{
                livedPeople++
            }
            if world[i-1][j+1] == 1{
                livedPeople++
            }
            if world[i+1][j-1] == 1{
                livedPeople++
            }
        
            
            if livedPeople > 3  || livedPeople < 2 {
                world[i][j] =  0
            }
        }
    }
    
    func lifeStart(){
        for i in 1..<101{
            for j in 1..<101{
               checkLife(i, j: j)
            }
        }
    }
    
    
}
