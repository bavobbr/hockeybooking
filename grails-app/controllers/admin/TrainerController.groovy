package admin

import grails.plugin.springsecurity.annotation.Secured
import hockeybooking.Trainer

@Secured('ROLE_ADMIN')
class TrainerController {

    static scaffold = Trainer

}
