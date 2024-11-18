package com.avion.avion_concept.security;

import com.auth0.jwt.JWT;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.avion.avion_concept.provider.ResourceProvider;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

import static com.auth0.jwt.algorithms.Algorithm.HMAC512;

@Component
public class JwtService {
    final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    ResourceProvider provider;

    public String generateJwtToken(String username, long expiration) {

        return JWT.create()
                .withIssuer(this.provider.getJwtIssuer())
                .withAudience(this.provider.getJwtAudience())
                .withIssuedAt(new Date())
                .withSubject(username)
                .withExpiresAt(new Date(System.currentTimeMillis() + expiration))
                .sign(HMAC512(this.provider.getJwtSecret()));
    }

    public DecodedJWT verifyJwtToken(String token) {

        return JWT.require(HMAC512(this.provider.getJwtSecret()))
                .withIssuer(this.provider.getJwtIssuer())
                .build().verify(token);
    }

    public String getSubject(String token) {

        return JWT.require(HMAC512(this.provider.getJwtSecret()))
                .withIssuer(this.provider.getJwtIssuer())
                .build().verify(token).getSubject();
    }
}