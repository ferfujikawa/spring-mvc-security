package com.luv2code.springboot.springmvcsecurity.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.luv2code.springboot.springmvcsecurity.service.UserService;

@Configuration
public class DemoSecurityConfig {

	//bcrypt bean definition
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    //authenticationProvider bean definition
    @Bean
    public DaoAuthenticationProvider authenticationProvider(UserService userService) {
        DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
        auth.setUserDetailsService(userService); //set the custom user details service
        auth.setPasswordEncoder(passwordEncoder()); //set the password encoder - bcrypt
        return auth;
    }
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http, AuthenticationSuccessHandler customAuthenticationSuccessHandler) throws Exception {
		
		http.authorizeHttpRequests(configurer ->
			configurer
				.requestMatchers("/").permitAll()
				.requestMatchers("/leaders/**").hasRole("MANAGER")
				.requestMatchers("/systems/**").hasRole("ADMIN")
				.requestMatchers("/register/**").permitAll()
				.anyRequest().authenticated()
			)
			.formLogin(form ->
				form
					.loginPage("/showMyLoginPage")
					.loginProcessingUrl("/authenticateTheUser")
					.successHandler(customAuthenticationSuccessHandler)
					.permitAll()
			)
			.logout(logout ->
				logout
					.permitAll()
					.logoutSuccessUrl("/"))
			.exceptionHandling(configurer ->
				configurer.accessDeniedPage("/access-denied")
			);
		
		return http.build();
	}
	
//	@Bean
//	public InMemoryUserDetailsManager userDetailsManager() {
//		
//		UserDetails john = User.builder()
//				.username("john")
//				.password("{noop}test123")
//				.roles("EMPLOYEE")
//				.build();
//		
//		UserDetails mary = User.builder()
//				.username("mary")
//				.password("{noop}test123")
//				.roles("EMPLOYEE", "MANAGER")
//				.build();
//		
//		UserDetails susan = User.builder()
//				.username("susan")
//				.password("{noop}test123")
//				.roles("EMPLOYEE", "MANAGER", "ADMIN")
//				.build();
//		
//		return new InMemoryUserDetailsManager(john, mary, susan);
//	}
}
