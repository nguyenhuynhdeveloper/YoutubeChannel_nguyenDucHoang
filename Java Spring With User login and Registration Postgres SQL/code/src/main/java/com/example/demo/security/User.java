package com.example.demo.security;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Collections;
@Getter
@Setter
@EqualsAndHashCode
@NoArgsConstructor
@Entity
public class User implements UserDetails {
    public static final String SEQUENCE_NAME = "user_sequence";
    @Id
    @SequenceGenerator(name = User.SEQUENCE_NAME,
            sequenceName = SEQUENCE_NAME,
            allocationSize = 1)
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = SEQUENCE_NAME
    )
    private Long id;
    private String name;
    private String userName;
    private String email;
    private String password;
    private UserRole userRole;
    private Boolean isLocked;
    private Boolean isEnabled;

    //id = auto-generated
    public User(String name, String userName, String email,
                String password, UserRole userRole,
                Boolean isLocked, Boolean isEnabled) {
        this.name = name;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.userRole = userRole;
        this.isLocked = isLocked;
        this.isEnabled = isEnabled;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections.singletonList(new SimpleGrantedAuthority(userRole.name()));
    }

    @Override
    public String getPassword() {
        return null;
    }

    @Override
    public String getUsername() {
        return userName;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return !isLocked;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return isEnabled;
    }
}
