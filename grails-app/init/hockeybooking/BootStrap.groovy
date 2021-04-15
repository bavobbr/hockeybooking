package hockeybooking

import java.time.LocalDate
import java.time.ZoneId

class BootStrap {

    def init = { servletContext ->

        if (User.count == 0) {
            User.withTransaction {
                log.info("Creating users...")
                def userManager = new User(username: "manager", password: "dmon9200").save(flush: true)
                def userAdmin = new User(username: "admin", password: "dmon9200").save(flush: true)
                def userUser = new User(username: "assist", password: "dmon9200").save(flush: true)
                def roleAdmin = new Role(authority: "ROLE_ADMIN").save(flush: true)
                def roleUser = new Role(authority: "ROLE_USER").save(flush: true)
                UserRole.create(userAdmin, roleAdmin, false)
                log.info("Mapping roles...")
                UserRole.create(userUser, roleUser, false)
                UserRole.create(userAdmin, roleUser, false)
                UserRole.create(userManager, roleUser, false)
                log.info("Mapped roles")
            }
        }

        environments {
            development {
                Player.withTransaction {
                    if (Player.count == 0) {
                        log.info("Creating test dataset...")
                        def trainer1 = new Trainer(name: "Bavo Bruylandt", email: "bavo.bruylandt@gmail.com").save()
                        def trainer2 = new Trainer(name: "Steven Van Maegdenbergh", email: "bavo.bruylandt@gmail.com").save()
                        def trainer3 = new Trainer(name: "Daan Everaert", email: "daan@gmail.com").save()
                        def trainer4 = new Trainer(name: "Pierre Samyn", email: "pierre.samyn@gmail.com").save()
                        def p1 = new Player(name: "Mauro Bruylandt", email: "mb@dmon.be", responsible: "Griet Redant")
                        def p2 = new Player(name: "Wannes Duyck", email: "mwd@dmon.be", responsible: "Johan Duyck")
                        def p3 = new Player(name: "Bavo Lambert", email: "bl@dmon.be", responsible: "Ignace")
                        def p4 = new Player(name: "Tuur Geeroms", email: "tg@dmon.be", responsible: "Lieven Geeroms")
                        def p5 = new Player(name: "Juliette Samyn", email: "js@dmon.be", responsible: "Pierre Samyn")
                        def p6 = new Player(name: "Mirthe Bruylandt", email: "mb@dmon.be", responsible: "Griet Redant")
                        def p7 = new Player(name: "Bernard Staelens", email: "bs@dmon.be", responsible: "Staelens")
                        def p8 = new Player(name: "Tuur Op De Beeck", email: "topb@dmon.be", responsible: "Op De Beeck")
                        def p9 = new Player(name: "Manu", email: "manu@dmon.be", responsible: "Carla Van Riet")
                        def p10 = new Player(name: "Rhune Meskens", email: "mb@dmon.be", responsible: "Griet Redant")
                        def p11 = new Player(name: "Tibo Merkcx", email: "tmer@dmon.be", responsible: "Pieter Merckx")
                        def p12 = new Player(name: "Seppe Merkcx", email: "tmer@dmon.be", responsible: "Pieter Merckx")
                        def p13 = new Player(name: "Henri Staelens", email: "hs@dmon.be", responsible: "Staelens")
                        def p14 = new Player(name: "Gilles De Wolf", email: "gdw@dmon.be", responsible: "De Wolf")
                        def p15 = new Player(name: "Marcel De Ketelaere", email: "sdl@dmon.be", responsible: "Sofie De Lathauwer")
                        def p16 = new Player(name: "Flore Duyck", email: "fd@dmon.be", responsible: "Elisabeth Poppe")
                        def team1 = new Team(name: "U12B")
                        team1.addToPlayers(p1)
                        team1.addToPlayers(p2)
                        team1.addToPlayers(p3)
                        team1.addToPlayers(p4)
                        team1.addToPlayers(p4)
                        team1.addToPlayers(p7)
                        team1.addToPlayers(p8)
                        team1.addToPlayers(p9)
                        team1.addToPlayers(p10)
                        team1.addToPlayers(p11)
                        team1.addToPlayers(p13)
                        team1.addToPlayers(p14)
                        team1.addToTrainers(trainer1)
                        team1.save()
                        def team2 = new Team(name: "U9G")
                        team2.addToPlayers(p5)
                        team2.addToPlayers(p6)
                        team2.addToPlayers(p16)
                        team2.addToTrainers(trainer2)
                        team2.save()
                        def team3 = new Team(name: "U10B")
                        team3.addToPlayers(p12)
                        team3.addToPlayers(p15)
                        team3.addToTrainers(trainer3)
                        team3.addToTrainers(trainer2)
                        team3.addToTrainers(trainer1)
                        team3.save()

                        def team4 = new Team(name: "Trimmers", optIn: true)
                        def p17 = new Player(name: "Bavo Bruylandt", email: "fd@dmon.be", responsible: "Elisabeth Poppe")
                        def p18 = new Player(name: "Elisabeth Poppe", email: "fd@dmon.be", responsible: "Elisabeth Poppe")
                        def p19 = new Player(name: "Zeger Van Hese", email: "fd@dmon.be", responsible: "Elisabeth Poppe")
                        def p20 = new Player(name: "Wouter Sooghen", email: "fd@dmon.be", responsible: "Elisabeth Poppe")
                        def p21 = new Player(name: "Steven Van Maeghdenbergh", email: "fd@dmon.be", responsible: "Elisabeth Poppe")
                        def p22 = new Player(name: "Daan Everaert", email: "fd@dmon.be", responsible: "Elisabeth Poppe")
                        def p23 = new Player(name: "Sofie De Lathauwer", email: "fd@dmon.be", responsible: "Elisabeth Poppe")
                        def p24 = new Player(name: "Sara Van De Velde", email: "fd@dmon.be", responsible: "Elisabeth Poppe")
                        def p25 = new Player(name: "Celine", email: "fd@dmon.be", responsible: "Elisabeth Poppe")
                        def p26 = new Player(name: "Kris Boon", email: "fd@dmon.be", responsible: "Elisabeth Poppe")
                        team4.addToPlayers(p17)
                        team4.addToPlayers(p18)
                        team4.addToPlayers(p19)
                        team4.addToPlayers(p20)
                        team4.addToPlayers(p21)
                        team4.addToPlayers(p22)
                        team4.addToPlayers(p23)
                        team4.addToPlayers(p24)
                        team4.addToPlayers(p25)
                        team4.addToPlayers(p26)
                        team4.addToTrainers(trainer4)
                        team4.addToTrainers(trainer2)
                        team4.save()
                        def training1 = new Training(date: Date.from(LocalDate.of(2020, 5, 23).atStartOfDay(ZoneId.systemDefault()).toInstant()), team: team1, maxPlayers: 6).save()
                        def training2 = new Training(date: Date.from(LocalDate.of(2020, 5, 30).atStartOfDay(ZoneId.systemDefault()).toInstant()), team: team1, maxPlayers: 6).save()
                        def training3 = new Training(date: Date.from(LocalDate.of(2020, 5, 23).atStartOfDay(ZoneId.systemDefault()).toInstant()), team: team2, maxPlayers: 12).save()
                        def training4 = new Training(date: Date.from(LocalDate.of(2020, 5, 30).atStartOfDay(ZoneId.systemDefault()).toInstant()), team: team2, maxPlayers: 12).save()
                        def training6 = new Training(date: Date.from(LocalDate.of(2020, 6, 6).atStartOfDay(ZoneId.systemDefault()).toInstant()), team: team2, maxPlayers: 6).save()

                        def training7 = new Training(date: Date.from(LocalDate.of(2020, 5, 23).atStartOfDay(ZoneId.systemDefault()).toInstant()), team: team3, maxPlayers: 12).save()
                        def training8 = new Training(date: Date.from(LocalDate.of(2020, 5, 30).atStartOfDay(ZoneId.systemDefault()).toInstant()), team: team3, maxPlayers: 12).save()
                        def training9 = new Training(date: Date.from(LocalDate.of(2020, 6, 6).atStartOfDay(ZoneId.systemDefault()).toInstant()), team: team3, maxPlayers: 12).save()

                        def training10 = new Training(date: Date.from(LocalDate.of(2020, 5, 23).atStartOfDay(ZoneId.systemDefault()).toInstant()), team: team4, maxPlayers: 8).save()
                        def training11 = new Training(date: Date.from(LocalDate.of(2020, 5, 30).atStartOfDay(ZoneId.systemDefault()).toInstant()), team: team4, maxPlayers: 8).save()
                        def training12 = new Training(date: Date.from(LocalDate.of(2020, 6, 6).atStartOfDay(ZoneId.systemDefault()).toInstant()), team: team4, maxPlayers: 8).save()
                        def training13 = new Training(date: Date.from(LocalDate.of(2020, 6, 13).atStartOfDay(ZoneId.systemDefault()).toInstant()), team: team4, maxPlayers: 8).save()
                    }

                }
            }
        }

    }
    def destroy = {
    }
}
