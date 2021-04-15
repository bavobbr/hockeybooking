package hockeybooking

import grails.rest.Resource

//@Resource(namespace = "rest")
class Training {

    Date date
    Integer maxPlayers = 6

    String hygienicAssistant
    String fieldAssistant
    String terrainAssistant

    boolean reviewed = false

    static hasOne = [team : Team]
    static hasMany = [registeredPlayers: Player]

    static constraints = {
        date nullable: false, format: "dd/MM/yyyy hh:mm"
        team nullable: false
        maxPlayers min: 0, max: 28
        hygienicAssistant nullable: true
        fieldAssistant nullable: true
        terrainAssistant nullable: true
        registeredPlayers display: false
        reviewed display: false
    }

    def afterInsert = {
        if (team && !team.optIn) {
            log.info("Auto-registering all players from team $team.name")
            team.players.each { p ->
                log.info("Registered $p.name")
                addToRegisteredPlayers(p)
            }
        }
    }

    String toString() {
        return date
    }
}
