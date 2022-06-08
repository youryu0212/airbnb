package com.codesquad.airbnb.user.domain;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserCrudRepository extends JpaRepository<User, Long> {

    Optional<User> findByOauthId(String oauthId);
}
