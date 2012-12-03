import com.rubi.maniquies.Rol
import com.rubi.maniquies.Usuario
import com.rubi.maniquies.UsuarioRol
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.security.core.context.SecurityContextHolder as SCH
import org.springframework.security.authentication.TestingAuthenticationToken

class BootStrap {

    def springSecurityService
    def sessionFactory

    def init = { servletContext ->
        log.info "Iniciando Aplicación"
        
        log.info "Creando rol Admin"
        def roleAdmin = Rol.findByAuthority('ROLE_ADMIN') ?: new Rol(authority: 'ROLE_ADMIN').save(failOnError: true)
        
        log.info "Creando usuario Admin"
        def admin = Usuario.findByUsername('admin')
        if (!admin){
            admin = new Usuario(
                username : 'admin'
                , password : 'admin'
                , enabled : true
            ).save(failOnError: true)
        }
        
        log.info "Creando Relacion rol usuario"
        if (!admin.authorities.contains(roleAdmin)){
            UsuarioRol.create(admin, roleAdmin)
        }
        
    }
    def destroy = {
    }
}
