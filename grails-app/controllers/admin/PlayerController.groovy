package admin

import grails.plugin.springsecurity.annotation.Secured
import hockeybooking.Player

@Secured('ROLE_ADMIN')
class PlayerController {

    static scaffold = Player
}
