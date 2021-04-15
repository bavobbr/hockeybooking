package hockeybooking

import grails.plugin.springsecurity.annotation.Secured

class OverviewController {

    @Secured('ROLE_ADMIN')
    def index() {
        [teams: Team.list().sort { it.name },
         players: Player.list().sort { it.name },
         trainers: Trainer.list().sort { it.name},
         trainings: Training.list().sort { it.date }
        ]
    }
}
