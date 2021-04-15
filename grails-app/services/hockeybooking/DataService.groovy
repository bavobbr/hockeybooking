package hockeybooking

import com.opencsv.CSVReader
import grails.gorm.transactions.Transactional

import java.text.SimpleDateFormat

@Transactional
class DataService {

    List<PlayerImport> importCsv(String data) {

        CSVReader reader = new CSVReader(new StringReader(data))
        List allData = reader.readAll()
        def imported = allData.collect { items ->
            items = items.collect { it.trim() }
            println items.join(" | ")
            items as PlayerImport
        }
        imported.each { row ->
            try {
                if (Player.countByName(row.name) == 0) {
                    def player = new Player(name: row.name, email: row.email, responsible: row.email)
                    if (row.birthdate) {
                        def date = new SimpleDateFormat("dd/MM/yyyy").parse(row.birthdate)
                        player.birthdate = date
                    }
                    def team = Team.findByName(row.category)
                    if (!team) {
                        team = new Team(name: row.category, defaultDay: row.day)
                        team.save(errors: true)
                    }
                    player.team = team
                    println "Saving player $player"
                    player.save(errors: true)
                }
            }
            catch (e) {
                log.error("COULD NOT IMPORT DATA $row")
                log.error(e)
            }
        }
        return imported
    }

}
