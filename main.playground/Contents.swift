/*
    This is my Soccer League Coordinator
    Techdegree Swift
    Project 1
    Tim Degerman
    2018
*/

let joeSmith: [String : Any]  = ["name": "Joe Smith",
                                 "height": 42,
                                 "experience": true,
                                 "guardians": "Jim and Jan Smith"]

let jillTanner: [String : Any]  = ["name": "Jill Tanner",
                                   "height": 36,
                                   "experience": true,
                                   "guardians": "Clara Tanner"]

let billBon: [String : Any]  = ["name": "Bill Bon",
                                "height": 42,
                                "experience": true,
                                "guardians": "Sara and Jenny Bon"]

let evaGordon: [String : Any]  = ["name": "Eva Gordon",
                                  "height": 45,
                                  "experience": false,
                                  "guardians": "Wendy and Mike Gordon"]

let mattGill: [String : Any]  = ["name": "Matt Gill",
                                 "height": 40,
                                 "experience": false,
                                 "guardians": "Charles and Sylvia Gill"]

let kimmyStein: [String : Any]  = ["name": "Kimmy Stein",
                                   "height": 41,
                                   "experience": false,
                                   "guardians": "Bill and Hillary Stein"]

let sammyAdams: [String : Any]  = ["name": "Sammy Adams",
                                   "height": 45,
                                   "experience": false,
                                   "guardians": "Jeff Adams"]

let karlSaygan: [String : Any]  = ["name": "Karl Saygan",
                                   "height": 42,
                                   "experience": true,
                                   "guardians": "Heather Bledsoe"]

let suzaneGreenberg: [String : Any]  = ["name": "Suzane Greenberg",
                                        "height": 44,
                                        "experience": true,
                                        "guardians": "Henrietta Dumas"]

let salDali: [String : Any]  = ["name": "Sal Dali",
                                "height": 41,
                                "experience": false,
                                "guardians": "Gala Dali"]

let joeKavalier: [String : Any]  = ["name": "Joe Kavalier",
                                    "height": 39,
                                    "experience": false,
                                    "guardians": "Sam and Elaine Kavalier"]

let benFinkelstein: [String : Any]  = ["name": "Ben Finkelstein",
                                       "height": 44,
                                       "experience": false,
                                       "guardians": "Aaron and Jill Finkelstein"]

let diegoSoto: [String : Any]  = ["name": "Diego Soto",
                                  "height": 41,
                                  "experience": true,
                                  "guardians": "Robin and Sarika Soto"]

let chloeAlaska: [String : Any]  = ["name": "Chloe Alaska",
                                    "height": 47,
                                    "experience": false,
                                    "guardians": "David and Jamie Alaska"]

let arnoldWillis: [String : Any]  = ["name": "Arnold Willis",
                                     "height": 43,
                                     "experience": false,
                                     "guardians": "Claire Willis"]

let philipHelm: [String : Any]  = ["name": "Philip Helm",
                                   "height": 44,
                                   "experience": true,
                                   "guardians": "Thomas Helm and Eva Jones"]

let lesClay: [String : Any]  = ["name": "Les Clay",
                                "height": 42,
                                "experience": true,
                                "guardians": "Wynonna Brown"]

let herschelKrustofski: [String : Any] = ["name": "Herschel Krustofski",
                                          "height": 45,
                                          "experience": true,
                                          "guardians": "Hyman and Rachel Krustofski"]



let players = [joeSmith, jillTanner, billBon, evaGordon, mattGill, kimmyStein, sammyAdams, karlSaygan, suzaneGreenberg, salDali, joeKavalier, benFinkelstein, diegoSoto, chloeAlaska, arnoldWillis, philipHelm, lesClay, herschelKrustofski]

// Teams

var teamSharks: [[String : Any]] = []
var teamDragons: [[String : Any]] = []
var teamRaptors: [[String : Any]] = []

// Add counter
let teamsCounter: Int = [teamSharks, teamDragons, teamRaptors].count


// Function to sort players into balanced teams

func sortPlayersToTeams(fromTeam team: [[String : Any]]) -> (experiencedTeam: [[String : Any]] , inexperiencedTeam: [[String : Any]]) {
    
    var experiencedTeam: [[String : Any]] = []
    var inexperiencedTeam: [[String : Any]] = []
    
    // Iterate over playerlist (team) and sort them into correct team (collection)
    
    for player in team {
        guard let pIsExperienced = player["experience"] as? Bool else { break }
        if pIsExperienced {
            experiencedTeam.append(player)
        } else {
            inexperiencedTeam.append(player)
        }
    }
    return(experiencedTeam, inexperiencedTeam)
}

// Creating array of the players to differentiate between exp and inexp

var experiencedPlayers: [[String : Any]] = sortPlayersToTeams(fromTeam: players).experiencedTeam
var inexperiencedPlayers: [[String : Any]] = sortPlayersToTeams(fromTeam: players).inexperiencedTeam

// Adding count of players for each of the teams
let countExperiencedPlayers: Int = experiencedPlayers.count / teamsCounter
let countInexperiencedPlayers: Int = inexperiencedPlayers.count / teamsCounter

// Create a function for adding players

func addingPlayers() -> [[String : Any]] {
    
    var team: [[String : Any]] = []
    
    // Adding experienced players to the team array by using the counter and remove from experiencedPlayers array
    for _ in 0..<countExperiencedPlayers {
        team.append(experiencedPlayers[experiencedPlayers.count - 1])
        experiencedPlayers.remove(at: experiencedPlayers.count - 1)
    }
    
    // Adding experienced players to the team array by using the counter and remove from inexperiencedPlayers array
    for _ in 0..<countInexperiencedPlayers {
        team.append(inexperiencedPlayers[inexperiencedPlayers.count - 1])
        inexperiencedPlayers.remove(at: inexperiencedPlayers.count - 1)
    }
    
    return team
    
}

// Building the teams

teamSharks = addingPlayers()
teamDragons = addingPlayers()
teamRaptors = addingPlayers()


// Letters to the guardians

var letters: [String] = []

func makeLetters(toTeam team: [[String: Any]], teamName name: String, practiceDate date: String) -> Void {
    // Loop through team array and then fill in the letter with string
    for count in 0..<team.count {
        guard let guardianName = team[count]["guardian"] as? String else { break }
        guard let playerName = team[count]["name"] as? String else { break }
        
        let letter: String = "Hello, \(guardianName). I am pleased to tell you that \(playerName) has been selected to join \(team). If \(playerName) chooses to accept this then we look forward to meeting them at \(date) for their first practice."
        
        // Finally append the letter to the letters array
        letters.append(letter)
    }
}

makeLetters(toTeam: teamSharks, teamName: "Sharks", practiceDate: "Sharks - March 17, 3pm")
makeLetters(toTeam: teamDragons, teamName: "Dragons", practiceDate: "Dragons - March 17, 1pm")
makeLetters(toTeam: teamRaptors, teamName: "Raptors", practiceDate: "Raptors - March 18, 1pm")

// Print the letter
func printLetters(letters: [String]) -> Void {
    for letter in letters {
        print("\(letter)")
    }
}

printLetters(letters: letters)
